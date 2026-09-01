Imports System.Data.OleDb

Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            loadProjects()
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        If Not String.IsNullOrWhiteSpace(txtSearch.Text) Then
            Response.Redirect("~/Pages/public/Projects.aspx?q=" & Server.UrlEncode(txtSearch.Text.Trim()))
        Else
            Response.Redirect("~/Pages/public/Projects.aspx")
        End If
    End Sub

    Private Sub loadProjects()
        Dim projects = ProjectRepository.GetProjects()
        rptProjectCard.DataSource = projects
        rptProjectCard.DataBind()
    End Sub
End Class