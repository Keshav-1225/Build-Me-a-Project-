Option Strict On
Option Explicit On

Partial Public Class ClientProfile
    Protected WithEvents pnlMain As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents lblSection As Global.System.Web.UI.WebControls.Label
    Protected WithEvents lblPageTitle As Global.System.Web.UI.WebControls.Label
    Protected WithEvents pnlProfile As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents pnlIdentity As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents lblProfileName As Global.System.Web.UI.WebControls.Label
    Protected WithEvents lblProfileEmail As Global.System.Web.UI.WebControls.Label
    Protected WithEvents vsProfile As Global.System.Web.UI.WebControls.ValidationSummary
    Protected WithEvents lblMessage As Global.System.Web.UI.WebControls.Label
    Protected WithEvents pnlFields As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents pnlName As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents lblName As Global.System.Web.UI.WebControls.Label
    Protected WithEvents txtName As Global.System.Web.UI.WebControls.TextBox
    Protected WithEvents rfvName As Global.System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents pnlUsername As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents lblUsername As Global.System.Web.UI.WebControls.Label
    Protected WithEvents txtUsername As Global.System.Web.UI.WebControls.TextBox
    Protected WithEvents rfvUsername As Global.System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents pnlEmail As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents lblEmail As Global.System.Web.UI.WebControls.Label
    Protected WithEvents txtEmail As Global.System.Web.UI.WebControls.TextBox
    Protected WithEvents rfvEmail As Global.System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents revEmail As Global.System.Web.UI.WebControls.RegularExpressionValidator
    Protected WithEvents pnlContact As Global.System.Web.UI.WebControls.Panel
    Protected WithEvents lblContact As Global.System.Web.UI.WebControls.Label
    Protected WithEvents txtContact As Global.System.Web.UI.WebControls.TextBox
    Protected WithEvents rfvContact As Global.System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents revContact As Global.System.Web.UI.WebControls.RegularExpressionValidator
    Protected WithEvents btnSaveProfile As Global.System.Web.UI.WebControls.Button
End Class
