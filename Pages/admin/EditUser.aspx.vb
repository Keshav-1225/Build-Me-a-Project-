Imports System.Data.OleDb

Public Class EditUser
    Inherits System.Web.UI.Page

    Private ReadOnly Property UserId As Integer
        Get
            Dim value As Integer
            Return If(Integer.TryParse(Request.QueryString("id"), value), value, 0)
        End Get
    End Property

    Protected Sub Page_Load(ByVal sender As Object, e As EventArgs) Handles Me.Load
        If UserId <= 0 Then
            Response.Redirect("~/Pages/admin/Users.aspx")
            Return
        End If
        If Not IsPostBack Then LoadUser()
    End Sub

    Private Sub LoadUser()
        Const query As String = "SELECT [name], [username], [email], [contact_no], [status] FROM [user] WHERE [ID] = ?"
        Try
            Using connection As OleDbConnection = connectDB.GetConnection()
                Using command As New OleDbCommand(query, connection)
                    command.Parameters.AddWithValue("@id", UserId)
                    connection.Open()
                    Using reader As OleDbDataReader = command.ExecuteReader()
                        If Not reader.Read() Then
                            Response.Redirect("~/Pages/admin/Users.aspx")
                            Return
                        End If
                        txtName.Text = reader("name").ToString()
                        txtUsername.Text = reader("username").ToString()
                        txtEmail.Text = reader("email").ToString()
                        txtContact.Text = reader("contact_no").ToString()
                        Dim status As String = reader("status").ToString().ToUpperInvariant()
                        If ddlStatus.Items.FindByValue(status) IsNot Nothing Then ddlStatus.SelectedValue = status
                    End Using
                End Using
            End Using
        Catch ex As Exception
            lblMessage.Text = "Unable to load this user."
        End Try
    End Sub

    Protected Sub btnSaveUser_Click(sender As Object, e As EventArgs)
        If Not Page.IsValid Then Return
        Try
            Using connection As OleDbConnection = connectDB.GetConnection()
                connection.Open()
                If ValueExists("username", txtUsername.Text.Trim(), connection) Then Throw New Exception("Username is already in use.")
                If ValueExists("email", txtEmail.Text.Trim(), connection) Then Throw New Exception("Email is already in use.")
                If ValueExists("contact_no", txtContact.Text.Trim(), connection) Then Throw New Exception("Contact number is already in use.")

                Const query As String = "UPDATE [user] SET [name] = ?, [username] = ?, [email] = ?, [contact_no] = ?, [status] = ?, [updatedAt] = ? WHERE [ID] = ?"
                Using command As New OleDbCommand(query, connection)
                    command.Parameters.AddWithValue("@name", txtName.Text.Trim())
                    command.Parameters.AddWithValue("@username", txtUsername.Text.Trim())
                    command.Parameters.AddWithValue("@email", txtEmail.Text.Trim())
                    command.Parameters.AddWithValue("@contact", txtContact.Text.Trim())
                    command.Parameters.AddWithValue("@status", ddlStatus.SelectedValue)
                    command.Parameters.AddWithValue("@updatedAt", DateTime.Now.ToString())
                    command.Parameters.AddWithValue("@id", UserId)
                    command.ExecuteNonQuery()
                End Using
            End Using
            Response.Redirect("~/Pages/admin/Users.aspx")
        Catch ex As Exception
            lblMessage.Text = ex.Message
        End Try
    End Sub

    Private Function ValueExists(fieldName As String, value As String, connection As OleDbConnection) As Boolean
        Dim query As String = "SELECT COUNT(*) FROM [user] WHERE [" & fieldName & "] = ? AND [ID] <> ?"
        Using command As New OleDbCommand(query, connection)
            command.Parameters.AddWithValue("@value", value)
            command.Parameters.AddWithValue("@id", UserId)
            Return Convert.ToInt32(command.ExecuteScalar()) > 0
        End Using
    End Function
End Class
