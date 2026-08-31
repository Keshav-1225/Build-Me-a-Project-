Imports System.Data.OleDb

Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

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
            Using projectCommand As New OleDbCommand(projectQuery, connection)
                Using projectReader As OleDbDataReader = projectCommand.ExecuteReader()

                    While projectReader.Read()
                        Dim project As New ProjectViewModel()

                        project.ID = Convert.ToInt32(projectReader("ID"))
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
            Dim techQuery = "SELECT projectTechnology.projectID, Techonology.Tech FROM projectTechnology INNER JOIN Technology On projectTechnology.projectID = ?"
        End Using
    End Sub
End Class