Imports PacificLife.Life.Enterprise.Data

Public Class Artifact

    Inherits BaseClass

    Protected WithEvents lblPage As System.Web.UI.WebControls.Label
    Protected WithEvents lblArtifactAbstraction As System.Web.UI.WebControls.Label
    Protected WithEvents urlPrevious As System.Web.UI.WebControls.HyperLink
    Protected WithEvents grdDescription As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdName As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdNote As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdContact As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdLocation As System.Web.UI.WebControls.DataGrid

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        If Not Page.IsPostBack Then

            'read results returned
            Dim sqlConn As PLDBConnection = SMARTSConnectionOpen()

            DataBindPage(sqlConn)
            If Len(CStr(Request.QueryString("id"))) > 0 Then
                Select Case lblArtifactAbstraction.Text
                    Case ABSTRACTION_DEVICE
                        urlPrevious.NavigateUrl = "Device.aspx?id=" & CStr(Request.QueryString("id")) & "&type=" & CStr(Request.QueryString("type"))
                        urlPrevious.Text = "Return to Device"
                    Case ABSTRACTION_OBJECT
                        urlPrevious.NavigateUrl = "Object.aspx?id=" & CStr(Request.QueryString("id")) & "&type=" & CStr(Request.QueryString("type"))
                        urlPrevious.Text = "Return to Object"
                    Case ABSTRACTION_SYSTEM
                        urlPrevious.NavigateUrl = "Sys.aspx?id=" & CStr(Request.QueryString("id")) & "&type=" & CStr(Request.QueryString("type"))
                        urlPrevious.Text = "Return to System"
                    Case ABSTRACTION_BUSINESS
                        urlPrevious.NavigateUrl = "BusinessProcess.aspx?id=" & CStr(Request.QueryString("id")) & "&type=" & CStr(Request.QueryString("type"))
                        urlPrevious.Text = "Return to Business Process"
                    Case ABSTRACTION_STEP
                        urlPrevious.NavigateUrl = "Step.aspx?id=" & CStr(Request.QueryString("id")) & "&type=" & CStr(Request.QueryString("type"))
                        urlPrevious.Text = "Return to Process Step"
                End Select
                urlPrevious.Visible = True
                If CInt(Request.QueryString("artifact")) > 0 Then
                    lblPage.Text = "View Artifact"
                Else
                    lblPage.Text = "Create Artifact"
                End If
            Else
                '**** COMING FROM Default.aspx
                Select Case Request.QueryString("func")
                    Case FUNC_CREATE
                        lblPage.Text = "Create Artifact"
                    Case FUNC_UPDATE
                        lblPage.Text = "Update Artifact"
                    Case FUNC_DELETE
                        lblPage.Text = "Delete Artifact"
                End Select
                urlPrevious.Visible = False
            End If

            sqlConn.Close()

        End If

    End Sub


    '--- GETS STA INFO : DESCRIPTION, CONSTRAINED VALUES, DEPENDENTS
    Public Sub DataBindPage(ByVal sqlConn As PLDBConnection)


        Dim strSQL As String = "EXEC GetItem " & TABLE_ARTIFACT & "," & Request.QueryString("artifact")
        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable

        grdName.DataSource = sqlTable
        grdName.DataBind()
        grdDescription.DataSource = sqlTable
        grdDescription.DataBind()
        grdLocation.DataSource = sqlTable
        grdLocation.DataBind()
        grdNote.DataSource = sqlTable
        grdNote.DataBind()
        grdContact.DataSource = sqlTable
        grdContact.DataBind()

    End Sub




End Class
