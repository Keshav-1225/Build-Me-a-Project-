Imports System.Web.Security
Public Class AuthHelper
    Public Shared Function isLoggedIn() As Boolean
        Return HttpContext.Current.Session("UserID") IsNot Nothing
    End Function

    Public Shared Sub logoutUser()
        HttpContext.Current.Session.Clear()
        HttpContext.Current.Session.Abandon()

        FormsAuthentication.SignOut()

        HttpContext.Current.Response.Redirect("~/Pages/public/Login.aspx")
    End Sub
End Class
