Public Class Dashboard1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserID") Is Nothing Then
            Response.Redirect("~/Pages/public/login.aspx")
        End If
        If Session("Role").ToString() <> "seller" Then
            Response.Redirect("~/Default.aspx")
        End If
    End Sub

End Class