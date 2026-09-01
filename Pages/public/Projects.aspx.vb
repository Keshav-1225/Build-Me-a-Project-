Public Class Projects1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Not String.IsNullOrEmpty(Request.QueryString("q")) Then
                txtSearch.Text = Request.QueryString("q")
            End If

            If Not String.IsNullOrEmpty(Request.QueryString("category")) Then
                Dim cat As String = Request.QueryString("category").Trim().ToLower()
                Select Case cat
                    Case "web"
                        chkWeb.Checked = True
                    Case "app"
                        chkApp.Checked = True
                    Case "python"
                        chkPython.Checked = True
                    Case "ai", "ml", "aiml"
                        chkAI.Checked = True
                End Select
            End If

            ApplyFilters()
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        ApplyFilters()
    End Sub

    Protected Sub Filter_Changed(sender As Object, e As EventArgs)
        ApplyFilters()
    End Sub

    Protected Sub btnClearFilters_Click(sender As Object, e As EventArgs) Handles btnClearFilters.Click
        txtSearch.Text = ""
        chkWeb.Checked = False
        chkApp.Checked = False
        chkPython.Checked = False
        chkAI.Checked = False
        chkFree.Checked = False
        chkPaid.Checked = False
        chkUnder500.Checked = False
        ddlSort.SelectedIndex = 0
        ApplyFilters()
    End Sub

    Private Sub ApplyFilters()
        ' Load all projects from repository
        Dim projects As List(Of ProjectViewModel) = ProjectRepository.GetProjects()

        ' 1. Search Query Filter
        Dim searchQuery As String = txtSearch.Text.Trim().ToLower()
        If Not String.IsNullOrEmpty(searchQuery) Then
            projects = projects.Where(Function(p) _
                (p.title IsNot Nothing AndAlso p.title.ToLower().Contains(searchQuery)) OrElse _
                (p.description IsNot Nothing AndAlso p.description.ToLower().Contains(searchQuery)) OrElse _
                (p.category IsNot Nothing AndAlso p.category.ToLower().Contains(searchQuery)) OrElse _
                (p.technologies IsNot Nothing AndAlso p.technologies.Any(Function(t) t.ToLower().Contains(searchQuery))) _
            ).ToList()
        End If

        ' 2. Category Filter
        Dim selectedCategories As New List(Of String)()
        If chkWeb.Checked Then selectedCategories.Add("web")
        If chkApp.Checked Then selectedCategories.Add("app")
        If chkPython.Checked Then selectedCategories.Add("python")
        If chkAI.Checked Then
            selectedCategories.Add("ai")
            selectedCategories.Add("ml")
        End If

        If selectedCategories.Count > 0 Then
            projects = projects.Where(Function(p)
                Dim catMatch As Boolean = p.category IsNot Nothing AndAlso selectedCategories.Any(Function(c) p.category.ToLower().Contains(c))
                Dim techMatch As Boolean = p.technologies IsNot Nothing AndAlso p.technologies.Any(Function(t) selectedCategories.Any(Function(c) t.ToLower().Contains(c)))
                Return catMatch OrElse techMatch
            End Function).ToList()
        End If

        ' 3. Price Filter
        Dim hasPriceFilter As Boolean = chkFree.Checked OrElse chkPaid.Checked OrElse chkUnder500.Checked
        If hasPriceFilter Then
            projects = projects.Where(Function(p)
                Dim freeMatch As Boolean = chkFree.Checked AndAlso p.price = 0
                Dim paidMatch As Boolean = chkPaid.Checked AndAlso p.price > 0
                Dim under500Match As Boolean = chkUnder500.Checked AndAlso p.price < 500
                Return freeMatch OrElse paidMatch OrElse under500Match
            End Function).ToList()
        End If

        ' 4. Sorting
        If ddlSort IsNot Nothing Then
            Select Case ddlSort.SelectedValue
                Case "Newest"
                    projects = projects.OrderByDescending(Function(p) p.ID).ToList()
                Case "PriceLowHigh"
                    projects = projects.OrderBy(Function(p) p.price).ToList()
                Case Else ' "Popular"
                    projects = projects.OrderByDescending(Function(p) p.rating).ThenByDescending(Function(p) p.ID).ToList()
            End Select
        End If

        ' 5. Data Binding
        rptProjects.DataSource = projects
        rptProjects.DataBind()

        If lblProjectCount IsNot Nothing Then
            lblProjectCount.Text = "Showing " & projects.Count & " project" & If(projects.Count = 1, "", "s")
        End If
    End Sub
End Class