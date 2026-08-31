Public Class ProjectViewModel
    Public Property ID As Integer
    Public Property title As String
    Public Property description As String
    Public Property rating As Integer
    Public Property price As Decimal
    Public Property seller As String
    Public Property category As String

    Public Property images As List(Of String)
    Public Property technologies As List(Of String)

    Public ReadOnly Property technologyList() As String
        Get
            If technologies Is Nothing OrElse technologies.Count = 0 Then
                Return ""
            End If

            Dim maxTech As Integer = Math.Min(3, technologies.Count)
            Dim result As String = String.Join(" . ", technologies.Take(maxTech))

            If technologies.Count > 4 Then
                result &= " +" & (technologies.Count - 4).ToString() & " more"
            End If

            Return result
        End Get
    End Property

    Public ReadOnly Property firstImageUrl() As String
        Get
            If images IsNot Nothing AndAlso images.Count > 0 AndAlso Not String.IsNullOrWhiteSpace(images(0)) Then
                Dim imgPath As String = images(0).Trim()
                If imgPath.StartsWith("http://") OrElse imgPath.StartsWith("https://") OrElse imgPath.StartsWith("data:") Then
                    Return imgPath
                End If
                If imgPath.StartsWith("~") OrElse imgPath.StartsWith("/") Then
                    Return imgPath.Replace("\", "/")
                End If
                Dim fileName As String = System.IO.Path.GetFileName(imgPath)
                Return "~/Uploads/Screenshots/" & fileName
            End If
            Return ""
        End Get
    End Property

    Public ReadOnly Property hasImage() As Boolean
        Get
            Return Not String.IsNullOrEmpty(firstImageUrl)
        End Get
    End Property

End Class
