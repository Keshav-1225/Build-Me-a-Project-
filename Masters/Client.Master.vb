Public Class ClientMaster
    Inherits MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("UserID") Is Nothing Then
            Response.Redirect("~/Pages/public/Login.aspx")
        End If
        If Session("Role") <> "client" Then
            Response.Redirect("~/Default.aspx")
        End If
    End Sub
End Class
