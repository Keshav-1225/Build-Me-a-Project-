Imports System.Data.OleDb

Public Class MyRequests
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserID") Is Nothing Then
            Response.Redirect("~/Pages/public/Login.aspx")
        End If
        If Session("Role") <> "client" Then
            Response.Redirect("~/Default.aspx")
        End If

        If Not IsPostBack Then
            LoadRequest()
        End If
    End Sub

    Private Sub LoadRequest()
        Try
            Dim clientID As Integer = Convert.ToInt32(Session("UserID"))

            Using connection As OleDbConnection = connectDB.GetConnection()

                Dim qry As String = "SELECT ID, title, description, tech_stack, budget, deadline, status FROM ProjectRequest WHERE clientID = ? ORDER BY updatedAt DESC"
                Using command As New OleDbCommand(qry, connection)
                    command.Parameters.AddWithValue("@clientID", clientID)

                    connection.Open()

                    Dim adapter As New OleDbDataAdapter(command)
                    Dim table As New DataTable()
                    adapter.Fill(table)

                    rptRequests.DataSource = table
                    rptRequests.DataBind()

                    ' Open Requests
                    lblTotalRequests.Text = table.Rows.Count.ToString() & " active request" & If(table.Rows.Count = 1, "", "s")

                    Dim openCount As Integer = table.Select("status = 'Open'").Length
                    Dim inProgressCount As Integer = table.Select("status = 'In Progress'").Length
                    Dim completedCount As Integer = table.Select("status = 'Completed'").Length

                    lblOpenRequestsCount.Text = openCount.ToString()
                    lblInProgressCount.Text = inProgressCount.ToString()
                    lblCompletedCount.Text = completedCount.ToString()
                End Using
            End Using
        Catch ex As Exception

        End Try
    End Sub

    Protected Function FormatDeadline(value As Object) As String
        If value Is Nothing OrElse Convert.IsDBNull(value) OrElse String.IsNullOrWhiteSpace(value.ToString()) Then
            Return "Not set"
        End If

        Dim deadline As DateTime
        If DateTime.TryParse(value.ToString(), deadline) Then
            Return deadline.ToString("dd MMM yyyy")
        End If

        Return value.ToString()
    End Function

End Class
