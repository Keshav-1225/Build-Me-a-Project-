Imports System.Data.OleDb
Imports System.Runtime.CompilerServices

Public Class ProjectDetails1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim projectID As Integer = Convert.ToInt16(Request.QueryString("id"))
        If Not IsPostBack Then
            loadProjectDetails(projectID)
        End If
        'If project is there in the cart then show view cart
        btnWishlist.Text = "Add to cart"
    End Sub

    Protected Sub btnBuyNow_Click(sender As Object, e As EventArgs) Handles btnBuyNow.Click
        Dim projectID As Integer = Convert.ToInt16(Request.QueryString("id"))
        If Session("userID") Is Nothing Then
            Response.Redirect("~/Pages/public/Login.aspx")
        End If
        AddToCart(projectID)
        Response.Redirect("~/Pages/client/Order.aspx")
    End Sub

    Protected Sub btnWishlist_Click(sender As Object, e As EventArgs) Handles btnWishlist.Click
        Dim projectID As Integer = Convert.ToInt16(Request.QueryString("id"))
        If Session("userID") Is Nothing Then
            Response.Redirect("~/Pages/public/Login.aspx")
        End If
        AddToCart(projectID)
    End Sub

    Private Sub loadProjectDetails(projectId As Integer)

        Dim query As String = " SELECT 
                                    project.[ID] AS projectID,
                                    project.[title] AS title,
                                    project.[description] AS description,
                                    project.[rating] AS rating,
                                    project.[SI] AS SI,
                                    project.[tech_stack] as tech,
                                    project.[price] AS price,
                                    [user].[name] AS seller
                                FROM
                                    project
                                INNER JOIN
                                    [user]
                                ON
                                    project.[userID] = [user].[ID]
                                WHERE project.[ID] = ?"
        Try
            Using connection As OleDbConnection = connectDB.GetConnection()
                connection.Open()
                Using command As New OleDbCommand(query, connection)
                    command.Parameters.AddWithValue("@projectID", projectId)

                    Using reader As OleDbDataReader = command.ExecuteReader()
                        reader.Read()
                        lblProjectName.Text = reader("title").ToString()
                        lblProjectDescription.Text = reader("description").ToString()
                        lblSetupInstructions.Text = reader("SI").ToString()
                        lblPrice.Text = "₹ " & reader("price").ToString()
                        lblSeller.Text = reader("seller").ToString()
                        Dim techstring = reader("tech").ToString()
                        Dim technologies As List(Of String) = techstring.Split(","c).ToList()
                        rptTechnologies.DataSource = technologies
                        rptTechnologies.DataBind()
                    End Using
                End Using
                Dim categoryQUery = "SELECT 
                                        [Technology].[category] AS category
                                    FROM 
                                        [Technology] 
                                    INNER JOIN 
                                        [ProjectTechnology]
ON
    ProjectTechnology.TechnologyID = Technology.ID
                                    WHERE
                                        [ProjectTechnology].[projectID] = ?
                                    GROUP BY
                                        [category]"
                Using categoryCommand As New OleDbCommand(categoryQUery, connection)
                    categoryCommand.Parameters.AddWithValue("@projectID", projectId)
                    Using reader As OleDbDataReader = categoryCommand.ExecuteReader()
                        reader.Read()
                        lblCategory.Text = reader("category").ToString()
                    End Using
                End Using

                Dim ImageQuery = "SELECT image FROM project_ss WHERE projectID = ?"
                Dim imageURL As List(Of String) = New List(Of String)

                Using imageCommand As New OleDbCommand(ImageQuery, connection)
                    imageCommand.Parameters.AddWithValue("@projectID", projectId)

                    Using reader As OleDbDataReader = imageCommand.ExecuteReader()
                        While reader.Read()
                            Dim rawPath As String = reader("image").ToString()
                            If Not String.IsNullOrWhiteSpace(rawPath) Then
                                If rawPath.StartsWith("~") OrElse rawPath.StartsWith("/") OrElse rawPath.StartsWith("http") Then
                                    imageURL.Add(rawPath)
                                Else
                                    Dim fileName As String = System.IO.Path.GetFileName(rawPath)
                                    imageURL.Add("~/Uploads/Screenshots/" & fileName)
                                End If
                            End If
                        End While
                    End Using
                End Using
                rptImages.DataSource = imageURL
                rptImages.DataBind()
            End Using
        Catch ex As Exception
            lblMessage.Text = ex.Message
        End Try
    End Sub

    Private Sub AddToCart(projectID As Integer)
        Dim cartID As String = String.Empty

        ' Check if user exists
        If Session("userID") Is Nothing Then
            Response.Redirect("~/Pages/public/Login.aspx")
        End If

        Try
            'Check if a cart is there linked with the user
            Dim checkCartQuery = "SELECT ID FROM cart WHERE userID = ?"
            Using connection As OleDbConnection = connectDB.GetConnection()
                connection.Open()

                Using checkCartCommand As New OleDbCommand(checkCartQuery, connection)
                    checkCartCommand.Parameters.AddWithValue("@userID", Session("userID").ToString())

                    Dim result = checkCartCommand.ExecuteScalar()

                    ' If there is no cart then create one
                    If result Is Nothing Then
                        Dim createCartQuery = "INSERT INTO cart(userID) VALUES(?)"
                        Using createCartCommand As New OleDbCommand(createCartQuery, connection)
                            createCartCommand.Parameters.AddWithValue("@userID", Session("userID").ToString())

                            result = createCartCommand.ExecuteNonQuery()
                            If result Is Nothing Then
                                Throw New Exception("Unable to create cart")
                            End If
                            Using cmd As New OleDbCommand("SELECT @@IDENTITY", connection)
                                cartID = Convert.ToInt32(cmd.ExecuteScalar())
                            End Using
                        End Using
                    Else
                        cartID = result.ToString()
                    End If
                End Using

                ' Check if the cart_item contains the project or not
                Dim CheckProjectInCart = "SELECT COUNT(*) FROM cart_item WHERE projectID = ?"
                Using checkCartItemCommand As New OleDbCommand(CheckProjectInCart, connection)
                    checkCartItemCommand.Parameters.AddWithValue("@projectID", projectID)

                    Dim result = Convert.ToInt32(checkCartItemCommand.ExecuteScalar())

                    If result = 0 Then
                        Dim insertCart_itemQuery = "INSERT INTO cart_item(cartID, projectID, price, addedAt) VALUES(?,?,?,?)"
                        Using insertCartItemCommand As New OleDbCommand(insertCart_itemQuery, connection)
                            insertCartItemCommand.Parameters.AddWithValue("@cartID", cartID)
                            insertCartItemCommand.Parameters.AddWithValue("@projectID", projectID)
                            insertCartItemCommand.Parameters.AddWithValue("@price", lblPrice.Text.Trim())
                            insertCartItemCommand.Parameters.AddWithValue("@addedAt", DateTime.Now())

                            insertCartItemCommand.ExecuteNonQuery()
                            btnWishlist.Text = "Added to Cart"
                            btnWishlist.Enabled = False
                        End Using
                    End If

                End Using
            End Using

            'If project is there go to page load cart comment else add the project to the cart
        Catch ex As Exception
            lblMessage.Text = ex.Message
        End Try
    End Sub

End Class