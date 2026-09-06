Option Strict On
Option Explicit On

Partial Public Class EditRequest
    Protected WithEvents pnlMain As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents lnkBack As Global.System.Web.UI.WebControls.HyperLink
    Protected WithEvents pnlForm As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents lblTitle As Global.System.Web.UI.WebControls.Label
    Protected WithEvents lblMessage As Global.System.Web.UI.WebControls.Label
    Protected WithEvents pnlFields As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents lblTopic As Global.System.Web.UI.WebControls.Label
    Protected WithEvents txtTopic As Global.System.Web.UI.WebControls.TextBox
    Protected WithEvents lblDescription As Global.System.Web.UI.WebControls.Label
    Protected WithEvents txtDescription As Global.System.Web.UI.WebControls.TextBox
    Protected WithEvents pnlDetails As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents pnlTechStack As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents lblTechStack As Global.System.Web.UI.WebControls.Label
    Protected WithEvents txtTechStack As Global.System.Web.UI.WebControls.TextBox
    Protected WithEvents pnlBudget As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents lblBudget As Global.System.Web.UI.WebControls.Label
    Protected WithEvents txtBudget As Global.System.Web.UI.WebControls.TextBox
    Protected WithEvents pnlDeadline As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents lblDeadline As Global.System.Web.UI.WebControls.Label
    Protected WithEvents txtDeadline As Global.System.Web.UI.WebControls.TextBox
    Protected WithEvents pnlStatus As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents lblStatus As Global.System.Web.UI.WebControls.Label
    Protected WithEvents ddlStatus As Global.System.Web.UI.WebControls.DropDownList
    Protected WithEvents pnlActions As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents btnSave As Global.System.Web.UI.WebControls.Button
    Protected WithEvents lnkCancel As Global.System.Web.UI.WebControls.HyperLink
End Class
