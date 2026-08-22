Public Class Dashboard2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserID") Is Nothing Then
            Response.Redirect("~/Pages/public/Login.aspx")
        End If

        WelcomeLabel.Text = "Welcome " & Session("Name").ToString() & ","
    End Sub

End Class