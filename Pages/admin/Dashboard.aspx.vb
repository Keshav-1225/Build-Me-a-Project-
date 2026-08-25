Imports System.Data.OleDb

Public Class Dashboard
    Inherits System.Web.UI.Page
    'ADMIN DASHBOARD BACKEND
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        loadUserCount()
    End Sub

    Private Sub loadUserCount()
        Using connection As OleDbConnection = connectDB.GetConnection()
            connection.Open()

            Dim qry As String = "select COUNT(*) FROM [user]"
            Using command As New OleDbCommand(qry, connection)
                Dim totalUserCount As Integer = Convert.ToInt32(command.ExecuteScalar())
                lblUsersCount.Text = totalUserCount.ToString()
            End Using

            Using showProjectCountCommand As New OleDbCommand("select COUNT(*) from [project]", connection)
                Dim projectCounter As Integer = Convert.ToInt32(showProjectCountCommand.ExecuteScalar())
                lblProjectsCount.Text = projectCounter.ToString()
            End Using
        End Using
    End Sub
End Class