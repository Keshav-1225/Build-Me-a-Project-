Imports System.Data.OleDb

Public Class AddUser
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnCreateUser_Click(sender As Object, e As EventArgs) Handles btnCreateUser.Click

        ' INPUT
        Dim name As String = txtFullName.Text.Trim()
        Dim username As String = txtusername.Text.Trim()
        Dim email As String = txtEmail.Text.Trim()
        Dim password As String = txtPassword.Text.Trim()
        Dim contact As String = txtContact.Text.Trim()
        Dim role As String = ddlRole.SelectedValue.ToLower()
        Dim currentDateAndTime As String = DateTime.Now().ToString()

        'CONNECTION
        Try
            Using connection As OleDbConnection = connectDB.GetConnection()
                connection.Open()
                Dim insertQry As String = "INSERT INTO [user]([name],[username],[email],[password],[contact_no],[role],[createdAt],[updatedAt])" &
                                            "VALUES(?,?,?,?,?,?,?,?)"

                If uniquePropCheck("username", username, connection) Then
                    Throw New Exception("Username already Exists")
                End If
                If uniquePropCheck("email", email, connection) Then
                    Throw New Exception("Email already in use")
                End If
                If uniquePropCheck("contact_no", contact, connection) Then
                    Throw New Exception("Contact number already in use")
                End If
                Try
                    Using insertCommand As New OleDbCommand(insertQry, connection)
                        insertCommand.Parameters.AddWithValue("@name", name)
                        insertCommand.Parameters.AddWithValue("@username", username)
                        insertCommand.Parameters.AddWithValue("@email", email)
                        insertCommand.Parameters.AddWithValue("@password", password)
                        insertCommand.Parameters.AddWithValue("@contact", contact)
                        insertCommand.Parameters.AddWithValue("@role", role)
                        insertCommand.Parameters.AddWithValue("@createdAt", currentDateAndTime)
                        insertCommand.Parameters.AddWithValue("@updatedAt", currentDateAndTime)

                        insertCommand.ExecuteNonQuery()
                    End Using
                    Response.Redirect("~/Pages/admin/Users.aspx")
                Catch ex As Exception
                    lblMessage.Text = "ERROR while inserting the data \n" & ex.Message
                End Try
            End Using
        Catch ex As Exception
            lblMessage.Text = ex.Message
        End Try

    End Sub

    Private Function uniquePropCheck(fieldname As String, value As String, connectin As OleDbConnection)
        Dim query As String = $"SELECT COUNT(*) FROM [user] WHERE {fieldname} = ?"
        Using cmd As New OleDbCommand(query, connectin)
            cmd.Parameters.AddWithValue("@value", value)

            Return Convert.ToInt32(cmd.ExecuteScalar()) > 0
        End Using
    End Function
End Class