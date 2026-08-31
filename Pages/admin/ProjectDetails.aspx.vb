Imports System.Data.OleDb

Public Class ProjectDetails
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowProjectDetails()
        End If
    End Sub

    Protected Sub btnHideProject_Click(sender As Object, e As EventArgs) Handles btnHideProject.Click

    End Sub


    Private Sub ShowProjectDetails()
        Dim projectID As Integer
        If Not Integer.TryParse(Request.QueryString("id"), projectID) Then
            lblMessage.Text = "Invalid project ID."
            Return
        End If

        Using connection As OleDbConnection = connectDB.GetConnection()
            Dim query = "SELECT project.title as title, project.description as description, [user].name as seller, project.price as price, project.status as status FROM project INNER JOIN [user] ON project.userID = [user].ID where project.ID = ?"
            Try
                connection.Open()
                Using command As New OleDbCommand(query, connection)
                    command.Parameters.AddWithValue("@projectID", projectID)
                    Using reader As OleDbDataReader = command.ExecuteReader()
                        If reader.Read() Then
                            lblProjectTitle.Text = reader("title").ToString()
                            lblProjectDescription.Text = reader("description").ToString()
                            lblSellerName.Text = reader("seller").ToString()
                            lblPrice.Text = "₹" & reader("price").ToString()
                            lblProjectStatus.Text = reader("status").ToString()
                            lblMessage.Text = ""
                        Else
                            lblMessage.Text = "Project not found."
                        End If
                    End Using
                End Using
            Catch ex As Exception
                lblMessage.Text = ex.Message
            End Try
        End Using
    End Sub
End Class