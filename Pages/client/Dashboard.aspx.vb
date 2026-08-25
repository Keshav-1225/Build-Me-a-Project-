Imports System.Data.OleDb

Public Class Dashboard2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserID") Is Nothing Then
            Response.Redirect("~/Pages/public/Login.aspx")
        End If
        If Session("Role") <> "client" Then
            Response.Redirect("~/Default.aspx")
        End If

        WelcomeLabel.Text = "Welcome " & Session("Name").ToString() & ","

        ' Project Count
        Try
            Dim clientID As String = Session("UserID").ToString()
            Using connection As OleDbConnection = connectDB.GetConnection()
                Dim qry As String = "SELECT COUNT(*) FROM ProjectRequest where clientID=? GROUP BY clientID"
                Using command As New OleDbCommand(qry, connection)
                    connection.Open()

                    command.Parameters.AddWithValue("@clientID", clientID)

                    Dim counter As Integer = Convert.ToInt32(command.ExecuteScalar())
                    lblRequestsCount.Text = counter
                End Using
            End Using
        Catch ex As Exception
            ErrLabel.Text = ex.Message
        End Try
        lblRequestsCount.Text = 123
    End Sub

End Class