Imports PacificLife.Life.Enterprise.Data
Imports System.Data
Imports SMARTSCommon.CommonClass

Public Class ChangeContainer
    Inherits BaseClass

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    'Protected WithEvents lblRelationID As System.Web.UI.WebControls.Label
    'Protected WithEvents lblRelationAbstraction As System.Web.UI.WebControls.Label

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Protected WithEvents lblContainerName As System.Web.UI.WebControls.Label
    'Protected WithEvents grdName As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents ddlContainerList As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents btnSubmit As System.Web.UI.WebControls.Button

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        If Not Page.IsPostBack Then

            Dim sqlConn As PLDBConnection = SMARTSConnectionOpen()
            DataBindPage(sqlConn)
            sqlConn.Close()

        End If

    End Sub


    Public Sub DataBindPage(ByVal sqlConn As PLDbConnection)

        '--- grab the item abstraction id to get the container abstraction id
        Dim strSQL As String
        strSQL = "EXEC GetItem_Abstraction " & TABLE_SHAPE & "," & Request.QueryString("id")
        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable

        '--- prep according to abstraction type
        Dim strReturnPage As String
        Dim strAbstraction As String
        Dim strList As String
        Select Case CInt(sqlTable.Rows(0).Item("Abstraction_ID").ToString)
            Case ABSTRACTION_OBJECT
                strReturnPage = "object.aspx"
                strAbstraction = ABSTRACTION_SYSTEMOBJECT
                strList = "GetShapeList " & ABSTRACTION_SYSTEM & ",NULL"
            Case ABSTRACTION_STEP
                strReturnPage = "step.aspx"
                strAbstraction = ABSTRACTION_BUSINESSSTEP
                strList = "GetShapeList " & ABSTRACTION_BUSINESS & ",NULL"
        End Select

        '--- populate the grdName control
        strSQL = "EXEC GetItem_Container " & TABLE_SHAPE & "," & Request.QueryString("id") & "," & strAbstraction
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable()
        grdName.DataSource = sqlTable
        grdName.DataBind()

        '--- set returning page URL
        Dim urlItemPage As HyperLink = CType(grdName.Items(0).Cells(1).FindControl("urlName"), HyperLink)
        urlItemPage.NavigateUrl = strReturnPage & "?id=" & Request.QueryString("id") & "&type=" & Request.QueryString("type")

        '--- get list of systems/bps to switch to
        sqlCmd = New PLDbCommand(strList, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable()
        ddlContainerList.DataSource = sqlTable
        ddlContainerList.DataBind()

        '--- prevent user from switching to the current container
        Dim lblDeleteThis As Label = CType(grdName.Items(0).Cells(3).FindControl("lblRelatedName"), Label)
        ddlContainerList.Items.RemoveAt(ddlContainerList.Items.IndexOf(ddlContainerList.Items.FindByText(lblDeleteThis.Text)))


    End Sub


    Private Sub btnSumbit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        '--- get ds1 of old Container-Container relation(s)
        Dim lblAbstractionID As Label = CType(grdName.Items(0).Cells(3).FindControl("lblAbstractionID"), Label)
        Dim strSQL As String
        Dim sqlCmd As PLDbCommand

        '--- move Item to new Container
        Select Case CInt(lblAbstractionID.Text)
            Case ABSTRACTION_OBJECT
                strSQL = "EXEC SetContainer " & TABLE_SHAPE & "," & ddlContainerList.SelectedItem.Value & "," & TABLE_SHAPE & "," & CInt(Request.QueryString("id")) & "," & ABSTRACTION_SYSTEMOBJECT & "," & LOGFUNCTION_SET_CONTAINER & "," & RewriteString(User.Identity.Name)
            Case ABSTRACTION_STEP
                strSQL = "EXEC SetContainer " & TABLE_SHAPE & "," & ddlContainerList.SelectedItem.Value & "," & TABLE_SHAPE & "," & CInt(Request.QueryString("id")) & "," & ABSTRACTION_BUSINESSSTEP & "," & LOGFUNCTION_SET_CONTAINER & "," & RewriteString(User.Identity.Name)
        End Select
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()
        sqlConn.Close()

        Response.Redirect("changecontainer.aspx?id=" & Request.QueryString("id") & "&type=" & Request.QueryString("type"), False)

    End Sub

End Class
