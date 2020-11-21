Imports PacificLife.Life.Enterprise.Data
Imports System.Data
Imports SMARTSCommon.CommonClass


Public Class Result
    Inherits BaseClass

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    'Protected WithEvents grdItem As System.Web.UI.WebControls.DataGrid

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

        Dim strSQL As String = "GetItem_Search "
        If Request.QueryString("field") = 0 Then
            strSQL = strSQL & " NULL,"
        Else
            strSQL = strSQL & Request.QueryString("field") & ", "
        End If
        If Request.QueryString("level") = 0 Then
            strSQL = strSQL & " NULL,"
        Else
            strSQL = strSQL & Request.QueryString("level") & ", "
        End If
        If Request.QueryString("type") = 0 Then
            strSQL = strSQL & " NULL,"
        Else
            strSQL = strSQL & Request.QueryString("type") & ", "
        End If
        If Request.QueryString("attribute") = 0 Then
            strSQL = strSQL & " NULL,"
        Else
            strSQL = strSQL & Request.QueryString("attribute") & ", "
        End If
        strSQL = strSQL & "'" & Request.QueryString("value") & "';"

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable
        grdItem.DataSource = sqlTable
        grdItem.DataBind()
        Dim dgiItem As DataGridItem
        For Each dgiItem In grdItem.Items
            Dim urllink As Hyperlink = CType(dgiItem.Cells(4).FindControl("urlItem"), Hyperlink)
            Dim lblValue As Label = CType(dgiItem.Cells(6).FindControl("lblAttributeValue"), Label)
            Dim urlValue As Hyperlink = CType(dgiItem.Cells(6).FindControl("urlAttributeValue"), Hyperlink)
            Select Case CInt(dgiItem.Cells(1).Text)
                Case ABSTRACTION_SYSTEM
                    urllink.NavigateUrl = "Sys.aspx?id=" & CStr(dgiItem.Cells(0).Text)
                Case ABSTRACTION_OBJECT
                    urllink.NavigateUrl = "Object.aspx?id=" & CStr(dgiItem.Cells(0).Text) & "&type=" & CStr(dgiItem.Cells(2).Text)
                Case ABSTRACTION_DEVICE
                    urllink.NavigateUrl = "Device.aspx?id=" & CStr(dgiItem.Cells(0).Text) & "&type=" & CStr(dgiItem.Cells(2).Text)
                Case ABSTRACTION_BUSINESS
                    urllink.NavigateUrl = "BusinessProcess.aspx?id=" & CStr(dgiItem.Cells(0).Text)
                Case ABSTRACTION_STEP
                    urllink.NavigateUrl = "Step.aspx?id=" & CStr(dgiItem.Cells(0).Text) & "&type=" & CStr(dgiItem.Cells(2).Text)
            End Select
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

        sqlConn.Close()

    End Sub


End Class
