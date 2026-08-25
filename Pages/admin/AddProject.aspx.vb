Imports System.Data.OleDb
Imports System.IO

Public Class AddProject
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnPublishProject_Click(sender As Object, e As EventArgs) Handles btnPublishProject.Click
        'Input
        Dim title As String = txtProjectTitle.Text.Trim()
        Dim description As String = txtDescription.Text.Trim()
        Dim category As String = ddlCategory.SelectedValue
        Dim price As Integer
        Dim tech_stack As String = txtTechStack.Text.Trim()
        Dim ghurl As String = txtGitHubURL.Text.Trim()
        Dim setupInstructions As String = txtSetupInstructions.Text.Trim()
        Dim rating As Integer = 0
        Dim userID As String = Session("UserID").ToString()
        Dim technologies As String() = tech_stack.Split(",").Select(Function(x) x.ToUpper().Trim()).ToArray()

        If String.IsNullOrWhiteSpace(txtPrice.Text) Then
            price = 0
        Else
            price = Convert.ToInt32(txtPrice.Text)
        End If

        Try

            'Validation
            If title = "" OrElse description = "" OrElse category = "" OrElse tech_stack = "" OrElse ghurl = "" Then
                Throw New Exception("All Fields are Mandatory")
            End If
            'Database conn and communication
            Using connection As OleDbConnection = connectDB.GetConnection()
                Dim insertSSqry As String = "INSERT into project_ss([ProjectID],[image]) VALUES (?,?)"
                Dim insertProjectQry As String = "INSERT into project([title], [description], [rating], [SI], [tech_stack], [price], [userID], [githubURL]) VALUES (?,?,?,?,?,?,?,?)"
                Dim insertTechnologyQry As String = "INSERT INTO Technology([tech], [category]) VALUES(?,?)"
                Dim ProjectID As Integer
                Dim TechnologyID As Integer = 0

                connection.Open()
                ' INSERT DATA IN PROJECT TABLE
                Using insertProjectCommand As New OleDbCommand(insertProjectQry, connection)
                    insertProjectCommand.Parameters.AddWithValue("@title", title)
                    insertProjectCommand.Parameters.AddWithValue("@description", description)
                    insertProjectCommand.Parameters.AddWithValue("@rating", rating)
                    insertProjectCommand.Parameters.AddWithValue("@SI", setupInstructions)
                    insertProjectCommand.Parameters.AddWithValue("@tech_stack", tech_stack)
                    insertProjectCommand.Parameters.AddWithValue("@price", price)
                    insertProjectCommand.Parameters.AddWithValue("@userID", userID)
                    insertProjectCommand.Parameters.AddWithValue("@githubURL", ghurl)

                    Dim rowsAffected As Integer = insertProjectCommand.ExecuteNonQuery()
                    If rowsAffected > 0 Then
                        ' GET PROJECT ID
                        Dim getProjectIDqry As String = "SELECT @@IDENTITY"
                        Try
                            Using getProjectIDCommand As New OleDbCommand(getProjectIDqry, connection)
                                ProjectID = Convert.ToInt32(getProjectIDCommand.ExecuteScalar())

                                'IMAGE UPLOAD PART
                                If fuScreenshots.HasFiles Then
                                    Dim uploadFolder As String = Server.MapPath("~/Uploads/Screenshots")
                                    If Not Directory.Exists(uploadFolder) Then
                                        Directory.CreateDirectory(uploadFolder)
                                    End If

                                    For Each file As HttpPostedFile In fuScreenshots.PostedFiles
                                        Dim originalFileName As String = Path.GetFileName(file.FileName)
                                        Dim uniqueFileName As String = Guid.NewGuid().ToString() & "_" & originalFileName
                                        Dim savePath As String = Path.Combine(uploadFolder, uniqueFileName)

                                        file.SaveAs(savePath) ' saved to server 

                                        ' INSERT IMAGES INTO PROJECT SS TABLE
                                        Try
                                            Using insertScreenshotCommand As New OleDbCommand(insertSSqry, connection)
                                                insertScreenshotCommand.Parameters.AddWithValue("@ProjectID", ProjectID)
                                                insertScreenshotCommand.Parameters.AddWithValue("@image", savePath)
                                                Dim ImagerowsAffected As Integer = insertScreenshotCommand.ExecuteNonQuery()
                                                If ImagerowsAffected <= 0 Then
                                                    Throw New Exception("Failed to insert Image")
                                                End If

                                            End Using
                                        Catch ex As Exception
                                            ErrLabel.Text = "Error in inserting data in project_ss table " & ex.Message
                                        End Try

                                    Next
                                End If

                                'TECHNOLOGY UPLOAD PART
                                For Each tech As String In technologies

                                    Dim findTechQry = "SELECT ID FROM Technology WHERE tech = ? AND category = ?"
                                    Try
                                        Using findTechCommand As New OleDbCommand(findTechQry, connection)
                                            findTechCommand.Parameters.AddWithValue("@tech", tech)
                                            findTechCommand.Parameters.AddWithValue("@category", category)

                                            Dim result = findTechCommand.ExecuteScalar()
                                            If result IsNot Nothing Then
                                                TechnologyID = Convert.ToInt32(result)
                                            Else
                                                Using insertTechCommand As New OleDbCommand("INSERT INTO Technology(tech, category) VALUES(?,?)", connection)
                                                    insertTechCommand.Parameters.AddWithValue("@tech", tech)
                                                    insertTechCommand.Parameters.AddWithValue("@category", category)

                                                    insertTechCommand.ExecuteNonQuery()
                                                End Using
                                                Using getTechIDCommand As New OleDbCommand("SELECT @@IDENTITY", connection)
                                                    TechnologyID = Convert.ToInt32(getTechIDCommand.ExecuteScalar())
                                                End Using
                                            End If
                                        End Using
                                    Catch ex As Exception
                                        ErrLabel.Text = "Error in Technology table findTechCommand" & ex.Message
                                    End Try

                                    Dim insertProjectTechQry As String = "INSERT INTO ProjectTechnology([ProjectID],[TechnologyID]) VALUES(?,?)"
                                    Try
                                        Using insertProjectTechCommand As New OleDbCommand(insertProjectTechQry, connection)
                                            insertProjectTechCommand.Parameters.AddWithValue("@ProjectID", ProjectID)
                                            insertProjectTechCommand.Parameters.AddWithValue("@TechnologyID", TechnologyID)

                                            insertProjectTechCommand.ExecuteNonQuery()
                                        End Using
                                    Catch ex As Exception
                                        ErrLabel.Text = "Error in ProjectTechnology table" & ex.Message
                                    End Try
                                Next
                            End Using

                        Catch ex As Exception
                            ErrLabel.Text = "Error in get Project ID" & ex.Message
                        End Try
                        Response.Redirect("~/Pages/admin/Dashboard.aspx")

                    Else
                        Throw New Exception("Error occured when inserting data in the project table")
                    End If

                End Using
            End Using
        Catch ex As Exception
            ErrLabel.Text = ex.StackTrace
        End Try


    End Sub
End Class