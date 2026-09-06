Imports System.Collections.Generic
Imports System.Configuration
Imports System.Data.OleDb
Imports System.Globalization
Imports System.Security.Cryptography
Imports System.Text
Imports Razorpay.Api

Public Class Payment
    Inherits System.Web.UI.Page

    Public Property RazorpayOrderId As String = String.Empty
    Public Property CheckoutOrderId As Integer
    Public Property PaymentAmount As Decimal
    Public Property AmountInPaise As Integer
    Public ReadOnly Property RazorpayKeyId As String
        Get
            Return ConfigurationManager.AppSettings("RazorPayKeyId")
        End Get
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Session("userID") Is Nothing Then
            Response.Redirect("~/Pages/public/Login.aspx")
            Return
        End If

        Try
            If String.Equals(Request.Form("paymentAction"), "verify", StringComparison.Ordinal) Then
                VerifyRazorpayPayment()
            ElseIf Not IsPostBack Then
                StartRazorpayPayment()
            End If
        Catch ex As Exception
            lblMessage.Text = ex.Message
        End Try
    End Sub

    Private Sub StartRazorpayPayment()
        CheckoutOrderId = GetOrderIDFromRequest()
        PaymentAmount = GetPendingOrderTotal(CheckoutOrderId, Convert.ToInt32(Session("userID")))
        AmountInPaise = Convert.ToInt32(Decimal.Round(PaymentAmount * 100D, 0, MidpointRounding.AwayFromZero))
        RazorpayOrderId = GetExistingRazorpayOrderID(CheckoutOrderId)

        If String.IsNullOrEmpty(RazorpayOrderId) Then
            Dim options As New Dictionary(Of String, Object) From {
                {"amount", AmountInPaise},
                {"currency", "INR"},
                {"receipt", "BMP-" & CheckoutOrderId}
            }
            Dim client As New RazorpayClient(RazorpayKeyId, GetRazorpaySecret())
            Dim razorpayOrder As Razorpay.Api.Order = client.Order.Create(options)
            RazorpayOrderId = razorpayOrder("id").ToString()
            SavePaymentAttempt(CheckoutOrderId, RazorpayOrderId, PaymentAmount)
        End If
    End Sub

    Private Sub VerifyRazorpayPayment()
        Dim localOrderID As Integer = GetOrderIDFromRequest()
        Dim buyerID As Integer = Convert.ToInt32(Session("userID"))
        Dim razorpayOrderID As String = Request.Form("razorpay_order_id")
        Dim razorpayPaymentID As String = Request.Form("razorpay_payment_id")
        Dim razorpaySignature As String = Request.Form("razorpay_signature")
        If String.IsNullOrWhiteSpace(razorpayOrderID) OrElse String.IsNullOrWhiteSpace(razorpayPaymentID) OrElse String.IsNullOrWhiteSpace(razorpaySignature) Then Throw New Exception("Razorpay did not return complete payment information.")

        Dim totalAmount As Decimal = GetPendingOrderTotal(localOrderID, buyerID)
        If Not String.Equals(razorpayOrderID, GetExistingRazorpayOrderID(localOrderID), StringComparison.Ordinal) Then Throw New Exception("The Razorpay order does not match this checkout.")
        If Not IsValidSignature(razorpayOrderID, razorpayPaymentID, razorpaySignature) Then Throw New Exception("Payment signature verification failed.")

        Dim client As New RazorpayClient(RazorpayKeyId, GetRazorpaySecret())
        Dim razorpayPayment As Razorpay.Api.Payment = client.Payment.Fetch(razorpayPaymentID)
        If Not String.Equals(razorpayPayment("order_id").ToString(), razorpayOrderID, StringComparison.Ordinal) OrElse Not String.Equals(razorpayPayment("status").ToString(), "captured", StringComparison.OrdinalIgnoreCase) Then Throw New Exception("Razorpay has not confirmed this payment as captured.")

        CompletePayment(localOrderID, razorpayOrderID, razorpayPaymentID, razorpaySignature, totalAmount)
        Response.Redirect("~/Pages/client/OrderConfirmation.aspx?orderID=" & localOrderID, False)
        Context.ApplicationInstance.CompleteRequest()
    End Sub

    Private Function GetOrderIDFromRequest() As Integer
        Dim orderID As Integer
        If Not Integer.TryParse(Request.QueryString("orderID"), orderID) OrElse orderID <= 0 Then Throw New Exception("Invalid order.")
        Return orderID
    End Function

    Private Function GetPendingOrderTotal(localOrderID As Integer, buyerID As Integer) As Decimal
        Const query As String = "SELECT total_amt FROM [order] WHERE ID = ? AND buyerID = ? AND order_status = ?"
        Using connection As OleDbConnection = connectDB.GetConnection()
            connection.Open()
            Using command As New OleDbCommand(query, connection)
                command.Parameters.AddWithValue("@orderID", localOrderID)
                command.Parameters.AddWithValue("@buyerID", buyerID)
                command.Parameters.AddWithValue("@status", "pending")
                Dim result As Object = command.ExecuteScalar()
                Dim amount As Decimal
                If result Is Nothing OrElse result Is DBNull.Value OrElse Not Decimal.TryParse(Convert.ToString(result), NumberStyles.Number, CultureInfo.InvariantCulture, amount) OrElse amount <= 0D Then Throw New Exception("The order is unavailable or is not awaiting payment.")
                Return amount
            End Using
        End Using
    End Function

    Private Function GetExistingRazorpayOrderID(localOrderID As Integer) As String
        Const query As String = "SELECT TOP 1 razorpayOrderID FROM payment WHERE orderID = ? AND status = ? ORDER BY ID DESC"
        Using connection As OleDbConnection = connectDB.GetConnection()
            connection.Open()
            Using command As New OleDbCommand(query, connection)
                command.Parameters.AddWithValue("@orderID", localOrderID)
                command.Parameters.AddWithValue("@status", "created")
                Dim result As Object = command.ExecuteScalar()
                Return If(result Is Nothing OrElse result Is DBNull.Value, String.Empty, result.ToString())
            End Using
        End Using
    End Function

    Private Sub SavePaymentAttempt(localOrderID As Integer, razorpayOrderID As String, amount As Decimal)
        Using connection As OleDbConnection = connectDB.GetConnection()
            connection.Open()
            Using command As New OleDbCommand("INSERT INTO payment(orderID, razorpayOrderID, amount, status) VALUES(?,?,?,?)", connection)
                command.Parameters.AddWithValue("@orderID", localOrderID)
                command.Parameters.AddWithValue("@razorpayOrderID", razorpayOrderID)
                command.Parameters.AddWithValue("@amount", amount.ToString(CultureInfo.InvariantCulture))
                command.Parameters.AddWithValue("@status", "created")
                command.ExecuteNonQuery()
            End Using
        End Using
    End Sub

    Private Sub CompletePayment(localOrderID As Integer, razorpayOrderID As String, razorpayPaymentID As String, razorpaySignature As String, amount As Decimal)
        Using connection As OleDbConnection = connectDB.GetConnection()
            connection.Open()
            Using transaction As OleDbTransaction = connection.BeginTransaction()
                Try
                    Using paymentCommand As New OleDbCommand("UPDATE payment SET razorpayPaymentID = ?, razorpaySignature = ?, amount = ?, status = ? WHERE orderID = ? AND razorpayOrderID = ?", connection, transaction)
                        paymentCommand.Parameters.AddWithValue("@razorpayPaymentID", razorpayPaymentID)
                        paymentCommand.Parameters.AddWithValue("@razorpaySignature", razorpaySignature)
                        paymentCommand.Parameters.AddWithValue("@amount", amount.ToString(CultureInfo.InvariantCulture))
                        paymentCommand.Parameters.AddWithValue("@status", "paid")
                        paymentCommand.Parameters.AddWithValue("@orderID", localOrderID)
                        paymentCommand.Parameters.AddWithValue("@razorpayOrderID", razorpayOrderID)
                        If paymentCommand.ExecuteNonQuery() <> 1 Then Throw New Exception("Payment attempt was not found.")
                    End Using
                    Using orderCommand As New OleDbCommand("UPDATE [order] SET order_status = ? WHERE ID = ? AND order_status = ?", connection, transaction)
                        orderCommand.Parameters.AddWithValue("@status", "paid")
                        orderCommand.Parameters.AddWithValue("@orderID", localOrderID)
                        orderCommand.Parameters.AddWithValue("@pendingStatus", "pending")
                        If orderCommand.ExecuteNonQuery() <> 1 Then Throw New Exception("Order status could not be updated.")
                    End Using
                    transaction.Commit()
                Catch
                    transaction.Rollback()
                    Throw
                End Try
            End Using
        End Using
    End Sub

    Private Function IsValidSignature(razorpayOrderID As String, razorpayPaymentID As String, razorpaySignature As String) As Boolean
        Using hmac As New HMACSHA256(Encoding.UTF8.GetBytes(GetRazorpaySecret()))
            Dim hash As Byte() = hmac.ComputeHash(Encoding.UTF8.GetBytes(razorpayOrderID & "|" & razorpayPaymentID))
            Dim generatedSignature As String = BitConverter.ToString(hash).Replace("-", String.Empty).ToLowerInvariant()
            Return String.Equals(generatedSignature, razorpaySignature, StringComparison.OrdinalIgnoreCase)
        End Using
    End Function

    Private Function GetRazorpaySecret() As String
        Return ConfigurationManager.AppSettings("RazorPaySecret")
    End Function
End Class
