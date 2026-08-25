Public Class AdminMaster
    Inherits MasterPage

    Protected WithEvents btnLogout As Global.System.Web.UI.WebControls.Button

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'If Session("UserID") Is Nothing Then
        '    Response.Redirect("~/Pages/public/Login.aspx")
        'End If
        'If Session("Role") <> "admin" Then
        '    Response.Redirect("~/Default.aspx")
        'End If

        AddHandler btnLogout.Click, AddressOf btnLogout_Click
    End Sub

    Protected Sub btnLogout_Click(sender As Object, e As EventArgs)
        AuthHelper.logoutUser()
    End Sub
End Class
