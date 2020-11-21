Imports PacificLife.Life.Enterprise.Data


Public Class Reports
    Inherits BaseClass

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents urlReturn As System.Web.UI.WebControls.HyperLink
    Protected WithEvents grdAttributeValues As System.Web.UI.WebControls.DataGrid
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


    Sub grdAttributeValues_Paged(ByVal sender As Object, ByVal e As DataGridPageChangedEventArgs)

        grdAttributeValues.CurrentPageIndex = e.NewPageIndex

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        DatabindControl(sqlConn)
        sqlConn.Close()

    End Sub


    Private Sub DatabindControl(ByVal sqlConn As PLDBConnection)

        Dim strSQL As String = "EXEC GetReport_ShapeTypeAttribute " & Request.QueryString("type")
        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable

        grdAttributeValues.DataSource = sqlTable
        grdAttributeValues.DataBind()

    End Sub

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here

        If Not Page.IsPostBack Then

            grdAttributeValues.AllowPaging = False

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            DatabindControl(sqlConn)
            sqlConn.Close()

        End If


    End Sub

    Private Sub btnShow_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnShow.Click

        grdAttributeValues.AllowPaging = False

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        DatabindControl(sqlConn)
        sqlConn.Close()

    End Sub

    Private Sub btnPage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPage.Click

        grdAttributeValues.AllowPaging = True
        grdAttributeValues.PageSize = 5

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        DatabindControl(sqlConn)
        sqlConn.Close()

    End Sub

End Class
