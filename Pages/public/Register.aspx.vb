Imports System.Data.OleDb

Public Class Register
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        Dim name As String = txtName.Text.Trim()
        Dim username As String = txtUsername.Text.Trim()
        Dim email As String = txtEmail.Text.Trim()
        Dim contact As String = txtContact.Text.Trim()
        Dim password As String = txtPassword.Text.Trim()
        Dim cnfrmPassword As String = txtConfirmPassword.Text.Trim()

        ' Validation-----------------------------------------
        If name = "" OrElse username = "" OrElse email = "" OrElse contact = "" OrElse password = "" OrElse cnfrmPassword = "" Then
            Response.Write("<script> alert('All the fields are mandatory'</script>")
            Return
        End If

        If password <> cnfrmPassword Then
            Response.Write("<script>alert('Passwords didnt matched')</script>")
            Return
        End If

        'Database connection-----------------------------------
        Using connection As OleDbConnection = connectDB.GetConnection()
            Try
                connection.Open()
                Dim checkQuery As String = "select count(*) from [user] where username = ?"

                Dim insertQuery As String =
                        "INSERT INTO [user] " &
                        "([name], username, role, email, contact_no, [password], createdAt, updatedAt) " &
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?)"


                Using checkCommand As New OleDbCommand(checkQuery, connection)
                    checkCommand.Parameters.AddWithValue("@username", username)

                    Dim count As Integer = Convert.ToInt32(checkCommand.ExecuteScalar())

                    If count > 0 Then
                        Response.Write("<script>alert('Username already taken')</script>")
                        Return
                    End If
                End Using

                Using insertCommand As New OleDbCommand(insertQuery, connection)
                    insertCommand.Parameters.AddWithValue("@name", name)
                    insertCommand.Parameters.AddWithValue("@username", username)
                    insertCommand.Parameters.AddWithValue("@role", "client")
                    insertCommand.Parameters.AddWithValue("@email", email)
                    insertCommand.Parameters.AddWithValue("@contact_no", contact)
                    insertCommand.Parameters.AddWithValue("@password", password)

                    Dim currentDateAndTime = DateTime.Now()
                    insertCommand.Parameters.AddWithValue("@createdAt", currentDateAndTime)
                    insertCommand.Parameters.AddWithValue("@updatedAt", currentDateAndTime)

                    Dim rowsAffected As Integer = insertCommand.ExecuteNonQuery()

                    If rowsAffected > 0 Then
                        Response.Write("<script>alert('User registered successfully');console.log('User registered successfully\n')</script>")
                        Response.Redirect("Login.aspx")
                    Else
                        Response.Write("<script>alert('Registration Failed');console.log('Database error in insert\n')</script>")
                    End If
                End Using

            Catch ex As Exception
                ErrMsgLbl.Text = ex.Message

            End Try
        End Using


    End Sub
End Class