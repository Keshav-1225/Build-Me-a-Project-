Imports System.Data.OleDb

Public Class Users
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            loadUsers("SELECT [ID],[name],[email],[status],[role] FROM [user]")
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Dim search As String = txtSearch.Text.Trim()

        If String.IsNullOrWhiteSpace(search) Then
            loadUsers("SELECT [ID],[name],[email],[status],[role] FROM [user]")
        End If
        Dim query As String = $"SELECT [ID], [name], [email], [status], [role] FROM [user] where [name] LIKE '%{search}%' OR [email] LIKE '%{search}%' OR [username] LIKE '%{search}%'"

        loadUsers(query)
    End Sub

    Private Sub loadUsers(query As String)
        Try
            Using connection As OleDbConnection = connectDB.GetConnection()
                Try
                    Using command As New OleDbCommand(query, connection)
                        connection.Open()

                        Using reader As OleDbDataReader = command.ExecuteReader()
                            rptUsers.DataSource = reader
                            rptUsers.DataBind()
                        End Using
                    End Using
                Catch ex As Exception
                    lblMessage.Text = ex.Message
                End Try
            End Using
        Catch ex As Exception
            lblMessage.Text = "Edit in connection is making some problem"
        End Try
    End Sub

    Protected Sub rptUsers_ItemCommand(source As Object, e As RepeaterCommandEventArgs)
        Dim userID As Integer = Convert.ToInt32(e.CommandArgument)
        If e.CommandName = "EditUser" Then
            Response.Redirect("~/Pages/admin/editUser.aspx?id=" & userID)
        ElseIf e.CommandName = "DeleteUser" Then
            DeleteUser(userID)
            loadUsers("SELECT [ID],[name],[email],[status],[role] FROM [user]")
        End If
    End Sub

    Private Sub DeleteUser(UserId As Integer)

        Dim query As String = "DELETE FROM [user] WHERE [ID] = ?"
        Using connection As OleDbConnection = connectDB.GetConnection()
            Try
                connection.Open()
                Using command As New OleDbCommand(query, connection)
                    command.Parameters.AddWithValue("@ID", UserId)

                    command.ExecuteNonQuery()
                End Using
            Catch ex As Exception
                lblMessage.Text = "Could not delete user" & ex.Message
            End Try
        End Using
    End Sub
End Class