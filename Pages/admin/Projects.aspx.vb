Imports System.Data.OleDb

Public Class Projects
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            loadProjects()
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click

    End Sub
    Private Sub loadProjects()
        Dim query As String = "SELECT project.[ID] AS projectID, project.title AS title, [user].name AS seller, project.status AS status FROM project INNER JOIN [user] ON project.userID = [user].ID"
        Using connection As OleDbConnection = connectDB.GetConnection()
            connection.Open()
            Try
                Using command As New OleDbCommand(query, connection)
                    Using reader As OleDbDataReader = command.ExecuteReader()
                        rptProjects.DataSource = reader
                        rptProjects.DataBind()
                    End Using
                End Using
            Catch ex As Exception
                lblMessage.Text = ex.Message
            End Try
        End Using
    End Sub

    Protected Sub ViewBtn_Command(sender As Object, e As CommandEventArgs)
        Dim projectID As Integer = Convert.ToInt32(e.CommandArgument)
        Response.Redirect("~/Pages/admin/ProjectDetails.aspx?id=" & projectID)
    End Sub
End Class