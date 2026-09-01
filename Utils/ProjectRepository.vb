Imports System.Data.OleDb

Public Class ProjectRepository
    Public Shared Function GetProjects(Optional projectQuery As String = "SELECT [ID] AS projectID, [title], [description], [rating],[price] FROM project",
                                       Optional techQuery As String = "SELECT " &
                                     "PT.ProjectID AS ProjectID, " &
                                     "Tech.Tech AS technology, " &
                                     "Tech.category AS category " &
                                     "FROM ProjectTechnology AS PT " &
                                     "INNER JOIN Technology AS Tech " &
                                     "ON PT.TechnologyID = Tech.[ID]",
                                     Optional imageQuery As String = "SELECT ProjectID, image FROM project_ss") As List(Of ProjectViewModel)
        Dim projects As New Dictionary(Of Integer, ProjectViewModel)()

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

            ' For technologies
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

            ' For Images
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

        Return projects.Values.ToList()
    End Function
End Class
