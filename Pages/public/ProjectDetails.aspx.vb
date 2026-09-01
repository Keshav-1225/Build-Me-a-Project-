Imports System.Data.OleDb
Imports System.Runtime.CompilerServices

Public Class ProjectDetails1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            loadProjectDetails()
        End If
    End Sub

    Protected Sub btnBuyNow_Click(sender As Object, e As EventArgs) Handles btnBuyNow.Click

    End Sub

    Protected Sub btnWishlist_Click(sender As Object, e As EventArgs) Handles btnWishlist.Click

    End Sub

    Private Sub loadProjectDetails()

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
            Dim projectID As Integer = Convert.ToInt16(Request.QueryString("id"))
            Using connection As OleDbConnection = connectDB.GetConnection()
                connection.Open()
                Using command As New OleDbCommand(query, connection)
                    command.Parameters.AddWithValue("@projectID", projectID)

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
                    categoryCommand.Parameters.AddWithValue("@projectID", projectID)
                    Using reader As OleDbDataReader = categoryCommand.ExecuteReader()
                        reader.Read()
                        lblCategory.Text = reader("category").ToString()
                    End Using
                End Using

                Dim ImageQuery = "SELECT image FROM project_ss WHERE projectID = ?"
                Dim imageURL As List(Of String) = New List(Of String)

                Using imageCommand As New OleDbCommand(ImageQuery, connection)
                    imageCommand.Parameters.AddWithValue("@projectID", projectID)

                    Using reader As OleDbDataReader = imageCommand.ExecuteReader()
                        While reader.Read()
                            imageURL.Add(reader("image").ToString)
                        End While
                    End Using
                End Using
                lblMessage.Text = imageURL(0).ToString()
                rptImages.DataSource = imageURL
                rptImages.DataBind()
            End Using
        Catch ex As Exception
            lblMessage.Text = ex.Message
        End Try
    End Sub

End Class