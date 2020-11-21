Imports PacificLife.Life.Enterprise.Data
Imports System.Web.UI.WebControls

Public Class EnterpriseReport
    Inherits BaseClass

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Protected WithEvents urlReturn As System.Web.UI.WebControls.HyperLink
    Protected WithEvents grdEnterprise As System.Web.UI.WebControls.DataGrid
    Protected WithEvents btnShow As System.Web.UI.WebControls.Button
    Protected WithEvents btnPage As System.Web.UI.WebControls.Button

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Sub grdEnterprise_Paged(ByVal sender As Object, ByVal e As DataGridPageChangedEventArgs)

        grdEnterprise.CurrentPageIndex = e.NewPageIndex

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        DatabindControl(sqlConn)
        sqlConn.Close()

    End Sub


    Private Sub DatabindControl(ByVal sqlConn As PLDBConnection)


        Dim strSQL As String = "EXEC GetReport_EnterpriseAttribute " & Request.QueryString("attributes")
        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable

        grdEnterprise.DataSource = sqlTable
        grdEnterprise.DataBind()

    End Sub

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here

        If Not Page.IsPostBack Then

            grdEnterprise.AllowPaging = False

            Dim sqlConn As PLDBConnection = SMARTSConnectionOpen()
            DatabindControl(sqlConn)
            sqlConn.Close()

        End If

    End Sub

    Private Sub btnShow_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnShow.Click

        grdEnterprise.AllowPaging = False

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        DatabindControl(sqlConn)
        sqlConn.Close()

    End Sub


    Private Sub btnPage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPage.Click

        grdEnterprise.AllowPaging = True
        grdEnterprise.PageSize = 5

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        DatabindControl(sqlConn)
        sqlConn.Close()

    End Sub

End Class
