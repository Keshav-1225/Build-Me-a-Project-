Imports System.Data
Imports System.Data.OleDb

Public Class Purchases
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("UserID") Is Nothing Then
            Response.Redirect("~/Pages/public/Login.aspx")
            Return
        End If

        If Not IsPostBack Then
            LoadPurchases()
        End If
    End Sub

    Private Sub LoadPurchases()
        Const query As String = "SELECT project.title, project.githubURL, [user].name AS sellerName, order_item.total " &
                                "FROM (([order] INNER JOIN order_item ON [order].ID = order_item.orderID) " &
                                "INNER JOIN project ON order_item.projectID = project.ID) " &
                                "LEFT JOIN [user] ON order_item.sellerID = [user].ID " &
                                "WHERE [order].buyerID = ? AND [order].order_status = ? " &
                                "ORDER BY [order].createdAt DESC, order_item.ID DESC"

        Try
            Using connection As OleDbConnection = connectDB.GetConnection()
                connection.Open()
                Using command As New OleDbCommand(query, connection)
                    command.Parameters.AddWithValue("@buyerID", Convert.ToInt32(Session("UserID")))
                    command.Parameters.AddWithValue("@status", "paid")

                    Dim purchases As New DataTable()
                    Using reader As OleDbDataReader = command.ExecuteReader()
                        purchases.Load(reader)
                    End Using

                    If purchases.Rows.Count = 0 Then
                        pnlPurchases.Visible = False
                        pnlNoPurchases.Visible = True
                        Return
                    End If

                    rptPurchases.DataSource = purchases
                    rptPurchases.DataBind()
                End Using
            End Using
        Catch ex As Exception
            lblMessage.Text = "Unable to load purchases: " & ex.Message
        End Try
    End Sub

    Protected Function GetGitHubUrl(value As Object) As String
        If value Is Nothing OrElse value Is DBNull.Value Then Return String.Empty

        Dim repositoryUrl As String = value.ToString().Trim()
        Dim uri As Uri = Nothing
        If Uri.TryCreate(repositoryUrl, UriKind.Absolute, uri) AndAlso
           (uri.Scheme = Uri.UriSchemeHttp OrElse uri.Scheme = Uri.UriSchemeHttps) AndAlso
           uri.Host.EndsWith("github.com", StringComparison.OrdinalIgnoreCase) Then
            Return repositoryUrl
        End If

        Return String.Empty
    End Function
End Class
