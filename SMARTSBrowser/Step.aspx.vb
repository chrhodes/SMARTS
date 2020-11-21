Imports PacificLife.Life.Enterprise.Data

Public Class _Step
    Inherits BaseClass

    Protected WithEvents grdAttribute As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdName As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdArtifacts As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdRelations As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdDescription As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdLifecycle As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdBusiness As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdShapeType As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdStepObject As System.Web.UI.WebControls.DataGrid
    Protected WithEvents urlHistory As System.Web.UI.WebControls.HyperLink


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

            Dim sqlConn As PLDBConnection = SMARTSConnectionOpen()
            DataBindPage(sqlConn)
            sqlConn.Close()
            
        End If

    End Sub

    '--- GETS STA INFO : DESCRIPTION, CONSTRAINED VALUES, DEPENDENTS
    Public Sub DataBindPage(ByVal sqlConn As PLDBConnection)


        urlHistory.NavigateUrl = "history.aspx?page=step.aspx&id=" & Request.QueryString("id") & "&type=" & Request.QueryString("type")

        Dim strSQL As String = "EXEC GetItem " & TABLE_SHAPE & "," & Request.QueryString("id")
        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable
        grdDescription.DataSource = sqlTable
        grdDescription.DataBind()
        grdLifecycle.DataSource = sqlTable
        grdLifecycle.DataBind()

        strSQL = "EXEC GetItem_Container " & TABLE_SHAPE & "," & Request.QueryString("id") & "," & ABSTRACTION_BUSINESSSTEP
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        grdName.DataSource = sqlTable
        grdName.DataBind()

        strSQL = "EXEC GetItem_AttributeValue " & TABLE_SHAPE & "," & Request.QueryString("id") & ",NULL "
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        grdAttribute.DataSource = sqlTable
        grdAttribute.DataBind()

        strSQL = "EXEC GetItem_Contained " & TABLE_SHAPE & "," & Request.QueryString("id") & "," & ABSTRACTION_ARTIFACT
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        grdArtifacts.DataSource = sqlTable
        grdArtifacts.DataBind()

        strSQL = "EXEC GetItem_Relation NULL," & TABLE_SHAPE & "," & Request.QueryString("id") & "," & ABSTRACTION_STEP
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        grdRelations.DataSource = sqlTable
        grdRelations.DataBind()

        strSQL = "EXEC GetItem_Contained " & TABLE_SHAPE & "," & Request.QueryString("id") & "," & ABSTRACTION_STEPOBJECT
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        grdStepObject.DataSource = sqlTable
        grdStepObject.DataBind()

        For i As Integer = 0 To grdAttribute.Items.Count - 1
            Dim lblValue As Label = CType(grdAttribute.Items(i).Cells(1).FindControl("lblAttributeValue"), Label)
            Dim urlValue As HyperLink = CType(grdAttribute.Items(i).Cells(1).FindControl("urlAttributeValue"), HyperLink)
            If Not lblValue Is Nothing Then
                Try
                    Dim u As New Uri(lblValue.Text)
                    urlValue.Visible = True
                    lblValue.Visible = False
                Catch ex As UriFormatException
                    urlValue.Visible = False
                    lblValue.Visible = True
                End Try
            End If
        Next

    End Sub



End Class
