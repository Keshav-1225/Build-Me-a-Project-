Public Class Dashboard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserID") Is Nothing Then
            Response.Redirect("~/Pages/public/Login.aspx")
            Return
        End If
        If Session("Role").ToString() <> "admin" Then
            Response.Redirect("~/Default.aspx")
        End If
    End Sub

End Class