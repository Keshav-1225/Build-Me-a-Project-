Public Class authorization
    Public Shared Function isLoggedIn() As Boolean
        Return HttpContext.Current.Session("UserID") IsNot Nothing
    End Function

    Public Shared Function hasRole(requiredRole As String) As Boolean
        If Not isLoggedIn() Then
            Return False
        End If
    End Function
End Class
