Imports System
Imports System.Data.OleDb
Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim email As String = txtEmail.Text.Trim()
        Dim password As String = txtPassword.Text.Trim()

        ' Validation -----------------------
        Try
            If email = "" OrElse password = "" Then
                Throw New Exception("email and password cannot be empty")
            End If

            Using connection As OleDbConnection = connectDB.GetConnection()
                connection.Open()

                Dim checkQuery As String = "select [_id], [name], [username], [email], [role] from [user] where email=? AND password=?"

                Using checkCommand As New OleDbCommand(checkQuery, connection)
                    checkCommand.Parameters.AddWithValue("@email", email)
                    checkCommand.Parameters.AddWithValue("@password", password)

                    Using reader As OleDbDataReader = checkCommand.ExecuteReader()
                        If reader.Read Then  'LOGIN SUCCESS
                            Session("UserID") = reader("_id").ToString()
                            Session("Name") = reader("name").ToString()
                            Session("Email") = reader("email").ToString()
                            Session("Role") = reader("role").ToString()

                            Dim role As String = reader("role").ToString()

                            If role = "admin" Then
                                Response.Redirect("~/Pages/admin/Dashboard.aspx")
                            ElseIf role = "seller" Then
                                Response.Redirect("~/Pages/seller/Dashboard.aspx")
                            ElseIf role = "client" Then
                                Response.Redirect("~/Pages/client/Dashboard.aspx")
                            Else
                                Throw New Exception("Invalid role path or roles assigned")
                            End If
                        Else 'Login Failed
                            Throw New Exception("Login Failed: User not found")
                        End If

                    End Using
                End Using
                End Using
        Catch ex As Exception
            errMsgLabel.Text = ex.Message
        End Try
    End Sub
End Class