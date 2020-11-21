Imports PacificLife.Life.Enterprise.Data
Imports System.Data
Imports SMARTSCommon.CommonClass


Public Class Relation
    Inherits BaseClass

    'Protected WithEvents lblRelationID As System.Web.UI.WebControls.Label
    'Protected WithEvents grdRelations As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdName As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdDescription As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdAttribute As System.Web.UI.WebControls.DataGrid
    Protected WithEvents urlHistory As System.Web.UI.WebControls.Hyperlink

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

            lblRelationID.Text = Request.QueryString("relation")
            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            DataBindPage(sqlConn)
            sqlConn.Close()

        End If

    End Sub

    Private Function CreateRelationsTable(ByVal sqlConn As PLDbConnection) As DataTable

        Dim dtTable As DataTable = New DataTable("Data")
        dtTable.Columns.Add(New DataColumn("Assoc_Direction", GetType(String)))
        dtTable.Columns.Add(New DataColumn("Assoc_AbstractionID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("Principal_ID", GetType(String)))
        dtTable.Columns.Add(New DataColumn("Principal_Name", GetType(String)))
        dtTable.Columns.Add(New DataColumn("Principal_TypeID", GetType(String)))
        dtTable.Columns.Add(New DataColumn("Principal_TypeName", GetType(String)))
        dtTable.Columns.Add(New DataColumn("PrincipalContainer_ID", GetType(String)))
        dtTable.Columns.Add(New DataColumn("PrincipalContainer_Name", GetType(String)))
        dtTable.Columns.Add(New DataColumn("PrincipalContainer_TypeID", GetType(String)))
        dtTable.Columns.Add(New DataColumn("PrincipalContainer_TypeName", GetType(String)))
        dtTable.Columns.Add(New DataColumn("Related_ID", GetType(String)))
        dtTable.Columns.Add(New DataColumn("Related_Name", GetType(String)))
        dtTable.Columns.Add(New DataColumn("Related_TypeID", GetType(String)))
        dtTable.Columns.Add(New DataColumn("Related_TypeName", GetType(String)))
        dtTable.Columns.Add(New DataColumn("RelatedContainer_ID", GetType(String)))
        dtTable.Columns.Add(New DataColumn("RelatedContainer_Name", GetType(String)))
        dtTable.Columns.Add(New DataColumn("RelatedContainer_TypeID", GetType(String)))
        dtTable.Columns.Add(New DataColumn("RelatedContainer_TypeName", GetType(String)))

        dtTable.AcceptChanges()

        Dim dtRow As DataRow = dtTable.NewRow

        '--- GET THE RELATION INFO FIRST
        '        Dim strSQL As String = "EXEC GetItem_Relation " & lblRelationID.Text & "," & TABLE_SHAPE & "," & Request.QueryString("id") & ", NULL "
        Dim strSQL As String = "EXEC GetItem_Relation " & lblRelationID.Text & ", NULL, NULL, NULL"
        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable
        dtRow("Assoc_Direction") = sqlTable.Rows(0).Item("Assoc_Direction")
        dtRow("Assoc_AbstractionID") = sqlTable.Rows(0).Item("Assoc_AbstractionID")
        dtRow("Principal_ID") = sqlTable.Rows(0).Item("Principal_ID").ToString
        dtRow("Principal_Name") = sqlTable.Rows(0).Item("Principal_Name").ToString
        dtRow("Principal_TypeID") = sqlTable.Rows(0).Item("Principal_TypeID").ToString
        dtRow("Principal_TypeName") = sqlTable.Rows(0).Item("Principal_TypeName").ToString
        dtRow("PrincipalContainer_ID") = sqlTable.Rows(0).Item("PrincipalContainer_ID").ToString
        dtRow("PrincipalContainer_Name") = sqlTable.Rows(0).Item("PrincipalContainer_Name").ToString
        dtRow("PrincipalContainer_TypeID") = sqlTable.Rows(0).Item("PrincipalContainer_TypeID").ToString
        dtRow("PrincipalContainer_TypeName") = sqlTable.Rows(0).Item("PrincipalContainer_TypeName").ToString
        dtRow("Related_ID") = sqlTable.Rows(0).Item("Related_ID").ToString
        dtRow("Related_Name") = sqlTable.Rows(0).Item("Related_Name").ToString
        dtRow("Related_TypeID") = sqlTable.Rows(0).Item("Related_TypeID").ToString
        dtRow("Related_TypeName") = sqlTable.Rows(0).Item("Related_TypeName").ToString
        dtRow("RelatedContainer_ID") = sqlTable.Rows(0).Item("RelatedContainer_ID").ToString
        dtRow("RelatedContainer_Name") = sqlTable.Rows(0).Item("RelatedContainer_Name").ToString
        dtRow("RelatedContainer_TypeID") = sqlTable.Rows(0).Item("RelatedContainer_TypeID").ToString
        dtRow("RelatedContainer_TypeName") = sqlTable.Rows(0).Item("RelatedContainer_TypeName").ToString

        dtTable.Rows.Add(dtRow)
        dtTable.AcceptChanges()

        Return dtTable

    End Function

    '--- GETS STA INFO : DESCRIPTION, CONSTRAINED VALUES, DEPENDENTS
    Public Sub DataBindPage(ByVal sqlConn As PLDbConnection)

        Dim strSQL As String

        strSQL = "EXEC GetItem_Relation " & lblRelationID.Text & ", NULL, NULL, NULL ;"
        'If Len(Request.QueryString("id")) = EMPTY_INT Then
        '    strSQL = "EXEC GetItem_Relation " & lblRelationID.Text & "," & TABLE_SHAPE & ", NULL, NULL ;"
        'Else
        '    strSQL = "EXEC GetItem_Relation " & lblRelationID.Text & "," & TABLE_SHAPE & "," & Request.QueryString("id") & ", NULL ;"
        'End If
        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable
        grdName.DataSource = sqlTable
        grdName.DataBind()
        grdDescription.DataSource = sqlTable
        grdDescription.DataBind()

        sqlTable = CreateRelationsTable(sqlConn)
        grdRelations.DataSource = sqlTable
        grdRelations.DataBind()
        Dim urlPrincipalID As Hyperlink = CType(grdRelations.Items(0).Cells(0).FindControl("urlRelationPrincipal"), Hyperlink)
        Dim urlRelatedID As Hyperlink = CType(grdRelations.Items(0).Cells(0).FindControl("urlRelationRelated"), Hyperlink)
        Dim urlPrincipalContainerID As Hyperlink = CType(grdRelations.Items(0).Cells(0).FindControl("urlRelationPrincipalContainer"), Hyperlink)
        Dim urlRelatedContainerID As Hyperlink = CType(grdRelations.Items(0).Cells(0).FindControl("urlRelationRelatedContainer"), Hyperlink)
        Select Case CInt(sqlTable.Rows(0).Item("Assoc_AbstractionID").ToString)
            Case ABSTRACTION_DEVICE
                urlPrincipalID.NavigateUrl = "device.aspx?id=" & sqlTable.Rows(0).Item("Principal_ID").ToString & "&type=" & sqlTable.Rows(0).Item("Principal_TypeID").ToString
                urlRelatedID.NavigateUrl = "device.aspx?id=" & sqlTable.Rows(0).Item("Related_ID").ToString & "&type=" & sqlTable.Rows(0).Item("Related_TypeID").ToString
            Case ABSTRACTION_OBJECT
                urlPrincipalID.NavigateUrl = "object.aspx?id=" & sqlTable.Rows(0).Item("Principal_ID").ToString & "&type=" & sqlTable.Rows(0).Item("Principal_TypeID").ToString
                urlRelatedID.NavigateUrl = "object.aspx?id=" & sqlTable.Rows(0).Item("Related_ID").ToString & "&type=" & sqlTable.Rows(0).Item("Related_TypeID").ToString
                urlPrincipalContainerID.NavigateUrl = "sys.aspx?id=" & sqlTable.Rows(0).Item("PrincipalContainer_ID").ToString & "&type=" & sqlTable.Rows(0).Item("PrincipalContainer_TypeID").ToString
                urlRelatedContainerID.NavigateUrl = "sys.aspx?id=" & sqlTable.Rows(0).Item("RelatedContainer_ID").ToString & "&type=" & sqlTable.Rows(0).Item("RelatedContainer_TypeID").ToString
            Case ABSTRACTION_STEP
                urlPrincipalID.NavigateUrl = "step.aspx?id=" & sqlTable.Rows(0).Item("Principal_ID").ToString & "&type=" & sqlTable.Rows(0).Item("Principal_TypeID").ToString
                urlRelatedID.NavigateUrl = "step.aspx?id=" & sqlTable.Rows(0).Item("Related_ID").ToString & "&type=" & sqlTable.Rows(0).Item("Related_TypeID").ToString
                urlPrincipalContainerID.NavigateUrl = "businessprocess.aspx?id=" & sqlTable.Rows(0).Item("PrincipalContainer_ID").ToString & "&type=" & sqlTable.Rows(0).Item("PrincipalContainer_TypeID").ToString
                urlRelatedContainerID.NavigateUrl = "businessprocess.aspx?id=" & sqlTable.Rows(0).Item("RelatedContainer_ID").ToString & "&type=" & sqlTable.Rows(0).Item("RelatedContainer_TypeID").ToString
        End Select

        strSQL = "EXEC GetItem_AttributeValue " & TABLE_RELATION & "," & lblRelationID.Text & ", NULL ;"
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        grdAttribute.DataSource = sqlTable
        grdAttribute.DataBind()

        For i As Integer = 0 To grdAttribute.Items.Count - 1
            Dim lblValue As Label = CType(grdAttribute.Items(i).Cells(1).FindControl("lblAttributeValue"), Label)
            Dim urlValue As Hyperlink = CType(grdAttribute.Items(i).Cells(1).FindControl("urlAttributeValue"), Hyperlink)
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
