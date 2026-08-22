Imports System.Data.OleDb

Public Class PostRequest
    Inherits System.Web.UI.Page
    ' CLIENT POST REQUEST BACKEND 
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserID") Is Nothing Then
            Response.Redirect("~/Pages/public/Login.aspx")
        End If
        If Session("role").ToString() <> "client" Then
            Response.Redirect("~/Default.aspx")
        End If
    End Sub

    Protected Sub btnPostRequest_Click(sender As Object, e As EventArgs) Handles btnPostRequest.Click
        'Input  -------------------------------------------------------------------------------------
        Dim clientID As Integer = Convert.ToInt32(Session("UserID"))
        Dim title As String = txtTopic.Text.Trim()
        Dim desc As String = txtProjectDescription.Text.Trim()
        Dim tech As String = txtTechStack.Text.Trim()
        Dim technologies As String() = tech.Split(","c).Select(Function(x) x.Trim()).ToArray()
        Dim budget As Integer?
        Dim completion As String = txtCompletionDate.Text.Trim()
        Dim status As String = "OPEN"
        Dim currentDateAndTime = DateTime.Now()

        'Basic Validation   --------------------------------------------------------------------------
        Try
            If title = "" OrElse desc = "" Then
                Throw New Exception("Title and description are mandatory")
            End If

            If String.IsNullOrWhiteSpace(txtBudget.Text) Then
                budget = 0
            Else
                budget = Convert.ToInt32(txtBudget.Text)
            End If

            Using connection As OleDbConnection = connectDB.GetConnection()
                connection.Open()
                Dim checkUserQry As String = "SELECT * from user where ID=?"
                Using checkUserCommand As New OleDbCommand(checkUserQry, connection)
                    checkUserCommand.Parameters.AddWithValue("@userID", clientID)
                    Dim count As Integer = Convert.ToInt32(checkUserCommand.ExecuteScalar())
                    If count > 0 Then
                        Throw New Exception("Unable to get the client from the session")
                    End If

                End Using

                Dim insertQry As String = "INSERT INTO ProjectRequest ([clientID], [title], [description], [tech_stack], [budget], [deadline], [status], [createdAt], [updatedAt]) VALUES (?,?,?,?,?,?,?,?,?)"
                Using insertCommand As New OleDbCommand(insertQry, connection)
                    insertCommand.Parameters.AddWithValue("@clientID", clientID)
                    insertCommand.Parameters.AddWithValue("@title", title)
                    insertCommand.Parameters.AddWithValue("@description", desc)
                    insertCommand.Parameters.AddWithValue("@tech_stack", tech)
                    insertCommand.Parameters.AddWithValue("@budget", budget)
                    insertCommand.Parameters.AddWithValue("@deadline", completion)
                    insertCommand.Parameters.AddWithValue("@status", status)
                    insertCommand.Parameters.AddWithValue("@createdAt", currentDateAndTime)
                    insertCommand.Parameters.AddWithValue("@updatedAt", currentDateAndTime)

                    Dim rowsAffected As Integer = insertCommand.ExecuteNonQuery()
                    If rowsAffected > 0 Then
                        Response.Write("<script>alert('Request Submitted Successfully')</script>")
                        Response.Redirect("~/Pages/client/Dashboard.aspx")
                    Else
                        Throw New Exception("Unable to create the request")
                    End If
                End Using
            End Using

        Catch ex As Exception
            ErrLabel.Text = ex.Message
        End Try


    End Sub
End Class