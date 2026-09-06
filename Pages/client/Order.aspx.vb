Imports System.Data.OleDb
Imports Microsoft.Ajax.Utilities

Public Class Order
    Inherits System.Web.UI.Page
    Public Shared projectID As Integer
    Public Shared orderID As Integer
    Public Shared sellerID As Integer
    Public Shared subtotal As Integer
    Public Shared discount As Integer = 0
    Public Shared total As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim projectID As Integer = Convert.ToInt16(Request.QueryString("projectID"))
        If Session("userID") Is Nothing Then
            Response.Redirect("~/Pages/public/Login.aspx")
        End If
        If Not IsPostBack Then

            loadOrder()
        End If
    End Sub

    Private Sub loadOrder()
        Dim fetchDataQuery = "SELECT
                                project.ID as projectID,
	                            project.title AS title,
	                            cart_item.price AS price
                            FROM
	                            cart_item
                            INNER JOIN 
	                            project
                            ON
	                            cart_item.projectID = project.ID"

        Try
            Using connection As OleDbConnection = connectDB.GetConnection()
                connection.Open()

                Using fetchDataCommand As New OleDbCommand(fetchDataQuery, connection)

                    Using reader As OleDbDataReader = fetchDataCommand.ExecuteReader()

                        rptProject.DataSource = reader
                        rptProject.DataBind()
                    End Using
                End Using
            End Using
        Catch ex As Exception
            lblMessage.Text = ex.Message
        End Try
        orderSummary()
    End Sub

    Protected Sub rptProject_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles rptProject.ItemCommand
        Dim projectId As Integer = Convert.ToInt16(e.CommandArgument)
        DeleteProject(projectId)
        loadOrder()
    End Sub

    Private Sub DeleteProject(projectID As Integer)
        Try
            Dim deleteProjectQuery = "DELETE FROM cart_item WHERE projectID = ?"
            Using connection As OleDbConnection = connectDB.GetConnection()
                connection.Open()
                Using deleteProjectCommand As New OleDbCommand(deleteProjectQuery, connection)
                    deleteProjectCommand.Parameters.AddWithValue("@projectID", projectID)
                    deleteProjectCommand.ExecuteNonQuery()
                End Using
            End Using
        Catch ex As Exception
            lblMessage.Text = ex.Message
        End Try
    End Sub

    Private Sub orderSummary()
        Try
            Dim query As String = "SELECT
	                                    SUM(price) AS subtotal
                                    FROM
	                                    cart_item
                                    WHERE
	                                    cartID = (
		                                    SELECT 
			                                    ID
		                                    FROM
			                                    cart
		                                    WHERE
			                                    userID = ?
	                                    )"
            Using connection As OleDbConnection = connectDB.GetConnection()
                connection.Open()
                Using cmd As New OleDbCommand(query, connection)
                    cmd.Parameters.AddWithValue("@userID", Session("userID"))

                    Using reader As OleDbDataReader = cmd.ExecuteReader()
                        reader.Read()
                        subtotal = Convert.ToInt32(reader("subtotal"))
                    End Using
                    total = subtotal - discount
                    lblDiscount.Text = discount.ToString()
                    lblSubtotal.Text = subtotal.ToString()
                    lblTotal.Text = total.ToString()
                End Using
            End Using
        Catch ex As Exception
            lblMessage.Text = "Order summary: " & ex.Message
        End Try
    End Sub

    Protected Sub btnProceedToPayment_Click(sender As Object, e As EventArgs)
        Try
            Using connection As OleDbConnection = connectDB.GetConnection()
                connection.Open()
                Using transaction As OleDbTransaction = connection.BeginTransaction()
                    Try
                        Dim userID As Integer = Convert.ToInt32(Session("userID"))
                        Dim cartItems As New DataTable()
                        Dim cartItemsQuery As String = "SELECT cart_item.projectID, project.userID AS sellerID, cart_item.price " &
                                                       "FROM (cart_item INNER JOIN cart ON cart_item.cartID = cart.ID) " &
                                                       "INNER JOIN project ON cart_item.projectID = project.ID " &
                                                       "WHERE cart.userID = ?"

                        Using cartItemsCommand As New OleDbCommand(cartItemsQuery, connection, transaction)
                            cartItemsCommand.Parameters.AddWithValue("@userID", userID)
                            Using reader As OleDbDataReader = cartItemsCommand.ExecuteReader()
                                cartItems.Load(reader)
                            End Using
                        End Using

                        If cartItems.Rows.Count = 0 Then
                            Throw New Exception("Your cart is empty.")
                        End If

                        Dim orderTotal As Decimal = 0D
                        For Each cartItem As DataRow In cartItems.Rows
                            orderTotal += Convert.ToDecimal(cartItem("price"))
                        Next

                        Dim insertOrderQuery As String = "INSERT INTO [order](buyerID, order_status, total_amt, createdAt) VALUES(?,?,?,?)"
                        Using insertOrderCommand As New OleDbCommand(insertOrderQuery, connection, transaction)
                            insertOrderCommand.Parameters.AddWithValue("@buyerID", userID)
                            insertOrderCommand.Parameters.AddWithValue("@order_status", "pending")
                            insertOrderCommand.Parameters.AddWithValue("@total_amt", orderTotal.ToString())
                            insertOrderCommand.Parameters.AddWithValue("@createdAt", DateTime.Now)
                            insertOrderCommand.ExecuteNonQuery()
                        End Using

                        Using getOrderIDCommand As New OleDbCommand("SELECT @@IDENTITY", connection, transaction)
                            orderID = Convert.ToInt32(getOrderIDCommand.ExecuteScalar())
                        End Using

                        'The Access table's column is intentionally named "subtotoal".
                        Dim insertOrderItemQuery As String = "INSERT INTO order_item(orderID, projectID, sellerID, subtotoal, discount, total) VALUES(?,?,?,?,?,?)"
                        For Each cartItem As DataRow In cartItems.Rows
                            Dim itemPrice As Decimal = Convert.ToDecimal(cartItem("price"))
                            Using insertOrderItemCommand As New OleDbCommand(insertOrderItemQuery, connection, transaction)
                                insertOrderItemCommand.Parameters.AddWithValue("@orderID", orderID)
                                insertOrderItemCommand.Parameters.AddWithValue("@projectID", Convert.ToInt32(cartItem("projectID")))
                                insertOrderItemCommand.Parameters.AddWithValue("@sellerID", Convert.ToInt32(cartItem("sellerID")))
                                insertOrderItemCommand.Parameters.AddWithValue("@subtotoal", Convert.ToInt32(itemPrice))
                                insertOrderItemCommand.Parameters.AddWithValue("@discount", 0)
                                insertOrderItemCommand.Parameters.AddWithValue("@total", itemPrice.ToString())
                                insertOrderItemCommand.ExecuteNonQuery()
                            End Using
                        Next

                        transaction.Commit()
                    Catch
                        transaction.Rollback()
                        Throw
                    End Try
                End Using
            End Using
            Response.Redirect("~/Pages/client/Payment.aspx?orderID=" & orderID)
        Catch ex As Exception
            lblMessage.Text = ex.Message
        End Try
    End Sub
End Class
