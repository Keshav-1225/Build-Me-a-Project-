Imports System.Data.OleDb

Public Class EditRequest
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("UserID") Is Nothing OrElse Not String.Equals(Convert.ToString(Session("Role")), "client", StringComparison.OrdinalIgnoreCase) Then
            Response.Redirect("~/Pages/public/Login.aspx")
            Return
        End If

        If Not IsPostBack Then
            LoadRequest()
        End If
    End Sub

    Private Sub LoadRequest()
        Dim requestID As Integer = GetRequestID()
        Const query As String = "SELECT title, description, tech_stack, budget, deadline, status FROM ProjectRequest WHERE ID = ? AND clientID = ?"

        Using connection As OleDbConnection = connectDB.GetConnection()
            connection.Open()
            Using command As New OleDbCommand(query, connection)
                command.Parameters.AddWithValue("@requestID", requestID)
                command.Parameters.AddWithValue("@clientID", Convert.ToInt32(Session("UserID")))
                Using reader As OleDbDataReader = command.ExecuteReader()
                    If Not reader.Read() Then Throw New Exception("The request was not found or you do not have permission to edit it.")

                    txtTopic.Text = Convert.ToString(reader("title"))
                    txtDescription.Text = Convert.ToString(reader("description"))
                    txtTechStack.Text = Convert.ToString(reader("tech_stack"))
                    txtBudget.Text = Convert.ToString(reader("budget"))

                    Dim deadline As DateTime
                    If DateTime.TryParse(Convert.ToString(reader("deadline")), deadline) Then txtDeadline.Text = deadline.ToString("yyyy-MM-dd")

                    Select Case Convert.ToString(reader("status")).Trim().ToLowerInvariant()
                        Case "open"
                            ddlStatus.SelectedValue = "Open"
                        Case "in progress"
                            ddlStatus.SelectedValue = "In Progress"
                        Case "completed"
                            ddlStatus.SelectedValue = "Completed"
                        Case "expired"
                            ddlStatus.SelectedValue = "Expired"
                    End Select
                End Using
            End Using
        End Using
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        Try
            Dim requestID As Integer = GetRequestID()
            Dim budget As Integer
            If String.IsNullOrWhiteSpace(txtTopic.Text) OrElse String.IsNullOrWhiteSpace(txtDescription.Text) Then Throw New Exception("Topic and description are required.")
            If Not Integer.TryParse(txtBudget.Text.Trim(), budget) OrElse budget < 0 Then Throw New Exception("Budget must be a valid positive number.")

            Dim deadline As DateTime
            If Not DateTime.TryParse(txtDeadline.Text, deadline) Then Throw New Exception("Please provide a valid deadline.")

            Const query As String = "UPDATE ProjectRequest SET title = ?, description = ?, tech_stack = ?, budget = ?, deadline = ?, status = ?, updatedAt = ? WHERE ID = ? AND clientID = ?"
            Using connection As OleDbConnection = connectDB.GetConnection()
                connection.Open()
                Using command As New OleDbCommand(query, connection)
                    command.Parameters.AddWithValue("@title", txtTopic.Text.Trim())
                    command.Parameters.AddWithValue("@description", txtDescription.Text.Trim())
                    command.Parameters.AddWithValue("@techStack", txtTechStack.Text.Trim())
                    command.Parameters.AddWithValue("@budget", budget)
                    command.Parameters.AddWithValue("@deadline", deadline)
                    command.Parameters.AddWithValue("@status", ddlStatus.SelectedValue)
                    command.Parameters.AddWithValue("@updatedAt", DateTime.Now)
                    command.Parameters.AddWithValue("@requestID", requestID)
                    command.Parameters.AddWithValue("@clientID", Convert.ToInt32(Session("UserID")))
                    If command.ExecuteNonQuery() <> 1 Then Throw New Exception("The request was not found or you do not have permission to update it.")
                End Using
            End Using

            Response.Redirect("~/Pages/client/MyRequests.aspx")
        Catch ex As Exception
            lblMessage.Text = ex.Message
        End Try
    End Sub

    Private Function GetRequestID() As Integer
        Dim requestID As Integer
        If Not Integer.TryParse(Request.QueryString("id"), requestID) OrElse requestID <= 0 Then Throw New Exception("Invalid request.")
        Return requestID
    End Function
End Class
