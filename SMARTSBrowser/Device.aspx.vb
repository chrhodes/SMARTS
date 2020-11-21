Imports PacificLife.Life.Enterprise.Data

Public Class Device

    Inherits BaseClass

    Protected WithEvents grdAttribute As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdAddress As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdArtifacts As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdContainDevice As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdContainedByDevice As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdDescription As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdLifecycle As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdDeviceObject As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdName As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdRelations As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdShapeType As System.Web.UI.WebControls.DataGrid
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

        Dim sqlCmd As PLDbCommand
        Dim sqlTable As New DataTable
        Dim strSQL As String

        urlHistory.NavigateUrl = "history.aspx?page=device.aspx&id=" & Request.QueryString("id") & "&type=" & Request.QueryString("type")

        strSQL = "EXEC GetItem " & TABLE_SHAPE & "," & Request.QueryString("id") & ";"
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        grdName.DataSource = sqlTable
        grdName.DataBind()
        grdDescription.DataSource = sqlTable
        grdDescription.DataBind()
        grdLifecycle.DataSource = sqlTable
        grdLifecycle.DataBind()

        strSQL = "EXEC GetItem_Contained " & TABLE_SHAPE & "," & Request.QueryString("id") & "," & ABSTRACTION_IP & ";"
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        grdAddress.DataSource = sqlTable
        grdAddress.DataBind()

        strSQL = "EXEC GetItem_AttributeValue " & TABLE_SHAPE & "," & Request.QueryString("id") & ",NULL ;"
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        grdAttribute.DataSource = sqlTable
        grdAttribute.DataBind()

        strSQL = "EXEC GetItem_Contained " & TABLE_SHAPE & "," & Request.QueryString("id") & "," & ABSTRACTION_ARTIFACT & ";"
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        grdArtifacts.DataSource = sqlTable
        grdArtifacts.DataBind()

        strSQL = "EXEC GetItem_Relation NULL," & TABLE_SHAPE & "," & Request.QueryString("id") & "," & ABSTRACTION_DEVICE & ";"
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        grdRelations.DataSource = sqlTable
        grdRelations.DataBind()

        strSQL = "EXEC GetItem_Contained " & TABLE_SHAPE & "," & Request.QueryString("id") & "," & ABSTRACTION_DEVICEOBJECT & ";"
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        grdDeviceObject.DataSource = sqlTable
        grdDeviceObject.DataBind()

        strSQL = "EXEC GetItem_Contained " & TABLE_SHAPE & "," & Request.QueryString("id") & "," & ABSTRACTION_DEVICE & ";"
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        grdContainDevice.DataSource = sqlTable
        grdContainDevice.DataBind()

        strSQL = "EXEC GetItem_Container " & TABLE_SHAPE & "," & Request.QueryString("id") & "," & ABSTRACTION_DEVICE & ";"
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        grdContainedByDevice.DataSource = sqlTable
        grdContainedByDevice.DataBind()

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
