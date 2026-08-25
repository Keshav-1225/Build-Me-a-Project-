Imports System.Data.OleDb

Public Class Users
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            loadUsers()
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click

    End Sub

    Private Sub loadUsers()
        Dim query As String = "SELECT [ID],[name],[email],[status],[role] FROM [user]"
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
            loadUsers()
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