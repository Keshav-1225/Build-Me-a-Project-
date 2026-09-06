Imports System.Data.OleDb

Public Class ClientProfile
    Inherits System.Web.UI.Page

    Private ReadOnly Property CurrentUserID As Integer
        Get
            Return Convert.ToInt32(Session("UserID"))
        End Get
    End Property

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("UserID") Is Nothing OrElse Not String.Equals(Convert.ToString(Session("Role")), "client", StringComparison.OrdinalIgnoreCase) Then
            Response.Redirect("~/Pages/public/Login.aspx")
            Return
        End If

        If Not IsPostBack Then
            LoadProfile()
        End If
    End Sub

    Private Sub LoadProfile()
        Const query As String = "SELECT [name], [username], [email], [contact_no] FROM [user] WHERE [ID] = ?"
        Try
            Using connection As OleDbConnection = connectDB.GetConnection()
                connection.Open()
                Using command As New OleDbCommand(query, connection)
                    command.Parameters.AddWithValue("@userID", CurrentUserID)
                    Using reader As OleDbDataReader = command.ExecuteReader()
                        If Not reader.Read() Then Throw New Exception("Your user account could not be found.")
                        txtName.Text = Convert.ToString(reader("name"))
                        txtUsername.Text = Convert.ToString(reader("username"))
                        txtEmail.Text = Convert.ToString(reader("email"))
                        txtContact.Text = Convert.ToString(reader("contact_no"))
                        SetProfileHeader()
                    End Using
                End Using
            End Using
        Catch ex As Exception
            lblMessage.Text = ex.Message
        End Try
    End Sub

    Protected Sub btnSaveProfile_Click(sender As Object, e As EventArgs)
        If Not Page.IsValid Then Return

        Try
            Using connection As OleDbConnection = connectDB.GetConnection()
                connection.Open()
                If ValueExists("username", txtUsername.Text.Trim(), connection) Then Throw New Exception("Username is already in use.")
                If ValueExists("email", txtEmail.Text.Trim(), connection) Then Throw New Exception("Email is already in use.")
                If ValueExists("contact_no", txtContact.Text.Trim(), connection) Then Throw New Exception("Contact number is already in use.")

                Const query As String = "UPDATE [user] SET [name] = ?, [username] = ?, [email] = ?, [contact_no] = ?, [updatedAt] = ? WHERE [ID] = ?"
                Using command As New OleDbCommand(query, connection)
                    command.Parameters.AddWithValue("@name", txtName.Text.Trim())
                    command.Parameters.AddWithValue("@username", txtUsername.Text.Trim())
                    command.Parameters.AddWithValue("@email", txtEmail.Text.Trim())
                    command.Parameters.AddWithValue("@contact", txtContact.Text.Trim())
                    command.Parameters.AddWithValue("@updatedAt", DateTime.Now)
                    command.Parameters.AddWithValue("@userID", CurrentUserID)
                    If command.ExecuteNonQuery() <> 1 Then Throw New Exception("Profile update failed.")
                End Using
            End Using

            Session("Name") = txtName.Text.Trim()
            Session("Email") = txtEmail.Text.Trim()
            SetProfileHeader()
            lblMessage.CssClass = "mt-4 block text-sm font-medium text-emerald-600"
            lblMessage.Text = "Profile updated successfully."
        Catch ex As Exception
            lblMessage.CssClass = "mt-4 block text-sm font-medium text-red-600"
            lblMessage.Text = ex.Message
        End Try
    End Sub

    Private Sub SetProfileHeader()
        lblProfileName.Text = txtName.Text.Trim()
        lblProfileEmail.Text = txtEmail.Text.Trim() & " · Client account"
    End Sub

    Private Function ValueExists(fieldName As String, value As String, connection As OleDbConnection) As Boolean
        Dim query As String = "SELECT COUNT(*) FROM [user] WHERE [" & fieldName & "] = ? AND [ID] <> ?"
        Using command As New OleDbCommand(query, connection)
            command.Parameters.AddWithValue("@value", value)
            command.Parameters.AddWithValue("@userID", CurrentUserID)
            Return Convert.ToInt32(command.ExecuteScalar()) > 0
        End Using
    End Function
End Class
