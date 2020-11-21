Imports PacificLife.Life.Enterprise.Data
Imports System.Data
Imports SMARTSCommon.CommonClass


Public Class LevelReports
    Inherits BaseClass

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'Protected WithEvents btnShow As System.Web.UI.WebControls.Button
    'Protected WithEvents btnPage As System.Web.UI.WebControls.Button
    'Protected WithEvents grdLevel As System.Web.UI.WebControls.DataGrid

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

            Dim sqlConn As PLDBConnection = SMARTSConnectionOpen()
            DatabindControl(sqlConn)
            grdLevel.AllowPaging = False

            sqlConn.Close()
        End If

    End Sub

    Private Sub DatabindControl(ByVal sqlConn As PLDBConnection)

        Dim strSQL As String

        Select Case Request.QueryString("abstraction")
            Case ABSTRACTION_SYSTEM, ABSTRACTION_OBJECT
                strSQL = "EXEC GetReport_LevelRelationSystem"
            Case ABSTRACTION_BUSINESS, ABSTRACTION_STEP
                strSQL = "EXEC GetReport_LevelRelationBusinessProcess"
            Case ABSTRACTION_DEVICE
                strSQL = "EXEC GetReport_LevelRelationInfrastructure"
        End Select

        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable

        grdLevel.DataSource = sqlTable
        grdLevel.DataBind()

    End Sub

    Private Sub btnShow_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnShow.Click

        grdLevel.AllowPaging = False

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        DatabindControl(sqlConn)
        sqlConn.Close()

    End Sub


    Private Sub btnPage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPage.Click

        grdLevel.AllowPaging = True
        grdLevel.PageSize = 5

        Dim sqlConn As PLDBConnection = SMARTSConnectionOpen()
        DatabindControl(sqlConn)
        sqlConn.Close()

    End Sub

    Sub grdLevel_Paged(ByVal sender As Object, ByVal e As DataGridPageChangedEventArgs)

        grdLevel.CurrentPageIndex = e.NewPageIndex

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        DatabindControl(sqlConn)
        sqlConn.Close()

    End Sub

End Class
