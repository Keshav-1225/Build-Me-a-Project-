Imports System.Data.OleDb

Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            loadProjects()
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click

    End Sub

    Private Sub loadProjects()
        ' project_ss = Images
        ' project = title, price, description, rating, category
        ' Technology =  techStack
        Dim projects As New Dictionary(Of Integer, ProjectViewModel)()



        Dim projectQuery As String = "SELECT [ID] AS projectID, [title], [description], [rating],[price] FROM project"
        Using connection As OleDbConnection = connectDB.GetConnection()
            connection.Open()
            Using projectCommand As New OleDbCommand(projectQuery, connection)
                Using projectReader As OleDbDataReader = projectCommand.ExecuteReader()

                    While projectReader.Read()
                        Dim project As New ProjectViewModel()

                        project.ID = Convert.ToInt32(projectReader("projectID"))
                        project.title = projectReader("title").ToString()
                        project.description = projectReader("description").ToString()
                        project.rating = Convert.ToInt16(projectReader("rating"))
                        project.price = Convert.ToDecimal(projectReader("price"))

                        project.technologies = New List(Of String)()
                        project.images = New List(Of String)()

                        projects.Add(project.ID, project)
                    End While
                End Using
            End Using

            'For technologies
            Dim techQuery = "SELECT
                                PT.ProjectID AS ProjectID,
                                Tech.Tech AS technology,
                                Tech.category AS category
                            FROM
                                ProjectTechnology AS PT
                            INNER JOIN
                                Technology AS Tech
                            ON
                                PT.TechnologyID = Tech.[ID]"
            Using techCommand As New OleDbCommand(techQuery, connection)

                Using techReader As OleDbDataReader = techCommand.ExecuteReader()
                    While techReader.Read()
                        Dim projectID As Integer = Convert.ToInt16(techReader("projectID"))
                        Dim technology As String = techReader("technology").ToString()

                        If projects.ContainsKey(projectID) Then
                            projects(projectID).technologies.Add(technology)
                            projects(projectID).category = techReader("category").ToString()
                        End If

                    End While
                End Using
            End Using

            'For Images
            Dim imageQuery = "SELECT ProjectID, image FROM project_ss"
            Using imagecommand As New OleDbCommand(imageQuery, connection)

                Using imageReader As OleDbDataReader = imagecommand.ExecuteReader()
                    While imageReader.Read()
                        Dim projectID As Integer = Convert.ToInt16(imageReader("ProjectID"))
                        Dim imageURl As String = imageReader("image").ToString()
                        If projects.ContainsKey(projectID) Then
                            projects(projectID).images.Add(imageURl)
                        End If
                    End While
                End Using
            End Using

        End Using
        ' Data binding
        rptProjectCard.DataSource = projects.Values.ToList()
        rptProjectCard.DataBind()
    End Sub
End Class