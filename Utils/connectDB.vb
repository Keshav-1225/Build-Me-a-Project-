Imports System.Data.OleDb
Imports System.Configuration
Public Class connectDB
    Private Shared ReadOnly connectionString As String = ConfigurationManager.ConnectionStrings("BuildMeAProjectConnection").ConnectionString

    Public Shared Function GetConnection() As OleDbConnection
        Return New OleDbConnection(connectionString)
    End Function
End Class
