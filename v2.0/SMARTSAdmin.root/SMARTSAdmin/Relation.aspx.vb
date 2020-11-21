Imports PacificLife.Life.Enterprise.Data
Imports System.Data
Imports SMARTSCommon.CommonClass

Public Class Relation
    Inherits BaseClass

    Protected WithEvents lblPrincipalContainer As System.Web.UI.WebControls.Label
    Protected WithEvents grdRelation As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents lblRelationID As System.Web.UI.WebControls.Label
    'Protected WithEvents grdRelations As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdName As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdDescription As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdAttribute As System.Web.UI.WebControls.DataGrid

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

    Protected Sub DataBindControl(ByVal Source As Object, ByVal sqlConn As PLDbConnection)

        Dim sqlCmd As PLDbCommand
        Dim sqlTable As New DataTable
        Dim strSQL As String

        Select Case Source.ID
            Case "grdAttribute"
                strSQL = "GetItem_AttributeValue " & TABLE_RELATION & "," & CInt(lblRelationID.Text) & ",NULL"
                sqlCmd = New PLDbCommand(strSQL, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
                Source.DataSource = sqlTable
                Source.DataBind()
                For i As Integer = 0 To Source.Items.Count - 1
                    Dim lblValue As Label = CType(Source.Items(i).Cells(2).FindControl("lblAttributeValue"), Label)
                    Dim urlValue As HyperLink = CType(Source.Items(i).Cells(2).FindControl("urlAttributeValue"), HyperLink)
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
            Case "grdName", "grdDescription"
                strSQL = "EXEC GetItem_Relation " & lblRelationID.Text & ", NULL, NULL, NULL "
                sqlCmd = New PLDbCommand(strSQL, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
                Source.DataSource = sqlTable
                Source.DataBind()
            Case "grdRelations"
                sqlTable = CreateRelationsTable(sqlConn)
                grdRelations.DataSource = sqlTable
                grdRelations.DataBind()
                Dim urlPrincipalID As HyperLink = CType(Source.Items(0).Cells(1).FindControl("urlRelationPrincipal"), HyperLink)
                Dim urlRelatedID As HyperLink = CType(Source.Items(0).Cells(1).FindControl("urlRelationRelated"), HyperLink)
                Dim urlPrincipalContainerID As HyperLink = CType(Source.Items(0).Cells(1).FindControl("urlRelationPrincipalContainer"), HyperLink)
                Dim urlRelatedContainerID As HyperLink = CType(Source.Items(0).Cells(1).FindControl("urlRelationRelatedContainer"), HyperLink)
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
        End Select

        Source.SelectedIndex = Source.Items.Count - 1


    End Sub

    Public Sub ControlEdit(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        Source.EditItemIndex = E.Item.ItemIndex

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        DataBindControl(Source, sqlConn)
        sqlConn.Close()

        setFocus(Source, E)

    End Sub

    Public Sub ControlCancel(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        Source.EditItemIndex = -1

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        DataBindControl(Source, sqlConn)
        sqlConn.Close()

    End Sub


    Public Sub ControlUpdate(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        Dim sqlCmd As PLDbCommand
        Dim strSQL As String
        Dim strValue As String
        Dim strID As String

        Select Case Source.ID
            Case "grdAttribute"
                Dim intSTA_ID As Integer = Integer.Parse(CType(E.Item.FindControl("lblSTA_ID"), Label).Text)
                Dim ddlValues As DropDownList = CType(E.Item.FindControl("ddlAttributeValue"), DropDownList)
                If ddlValues.Items.Count > 0 Then
                    strValue = RewriteString(CStr(ddlValues.SelectedItem.Text))
                Else
                    strValue = RewriteString(CType(E.Item.FindControl("txtAttributeValue"), TextBox).Text)
                End If
                strSQL = "SetAttributeValue " & TABLE_RELATION & "," & CInt(lblRelationID.Text) & "," & intSTA_ID & "," & strValue & "," & LOGFUNCTION_SET_ATTRIBUTEVALUE & "," & RewriteString(User.Identity.Name)
            Case "grdDescription"
                strValue = CType(E.Item.FindControl("txtDescription"), TextBox).Text
                strSQL = "SetRelation_Desc " & TABLE_RELATION & "," & CInt(lblRelationID.Text) & "," & LOGFUNCTION_SET_DESCRIPTION & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
            Case "grdName"
                strValue = CType(E.Item.FindControl("txtName"), TextBox).Text
                strSQL = "SetRelation_Name " & TABLE_RELATION & "," & CInt(lblRelationID.Text) & "," & LOGFUNCTION_SET_NAME & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
            Case "grdRelations"
                Dim intPrincipal_ID As Integer = Integer.Parse(CType(E.Item.FindControl("lblRelationPrincipalID"), Label).Text)
                strSQL = "SetRelation_Direction " & TABLE_RELATION & "," & CInt(Request.QueryString("relation")) & "," & LOGFUNCTION_SET_RELATION & "," & intPrincipal_ID & "," & RewriteString(User.Identity.Name)
        End Select

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

        Source.EditItemIndex = -1
        DataBindControl(Source, sqlConn)

        sqlConn.Close()
    End Sub


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        SetScroll()

        If Page.IsPostBack Then

            SaveScroll()

        Else

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

            'read results returned
            Try
                lblRelationID.Text = Request.QueryString("relation")
                DataBindPage(sqlConn)
            Catch exc As Exception
                Response.Write(exc.Message)
            Finally
                sqlConn.Close()
            End Try

        End If

    End Sub


    '--- GETS STA INFO : DESCRIPTION, CONSTRAINED VALUES, DEPENDENTS
    Public Sub DataBindPage(ByVal sqlConn As PLDbConnection)

        DataBindControl(grdRelations, sqlConn)
        DataBindControl(grdName, sqlConn)
        DataBindControl(grdDescription, sqlConn)
        DataBindControl(grdAttribute, sqlConn)

    End Sub


    Public Sub ControlItemDataBound(ByVal Source As Object, ByVal E As DataGridItemEventArgs)

        Dim typItem As ListItemType = E.Item.ItemType
        Select Case typItem
            Case ListItemType.EditItem

                Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
                Dim ddlValue As DropDownList = CType(E.Item.FindControl("ddlAttributeValue"), DropDownList)
                Dim txtValue As TextBox = CType(E.Item.FindControl("txtAttributeValue"), TextBox)
                Dim intSTA_ID As Integer = Integer.Parse(CType(E.Item.FindControl("lblSTA_ID"), Label).Text)
                Dim strSQL As String = "GetItem_ConstrainedValues " & TABLE_SHAPETYPEATTRIBUTE & "," & intSTA_ID
                Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
                Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable

                If sqlTable.Rows.Count > 0 Then
                    Dim strToParse As String = sqlTable.Rows(0).Item("ConstrainedValue_Values")
                    Dim arrValues As Array = Split(strToParse, ",")
                    For i As Integer = 0 To UBound(arrValues)
                        ddlValue.Items.Add(Trim(CStr(arrValues(i))))
                    Next
                    txtValue.Text = Trim(CStr(txtValue.Text))
                    If Len(txtValue.Text) > 0 Then
                        ddlValue.SelectedIndex = ddlValue.Items.IndexOf(ddlValue.Items.FindByText(txtValue.Text))
                    End If
                    ddlValue.Visible = True
                    txtValue.Visible = False
                Else
                    ddlValue.Visible = False
                    txtValue.Visible = True
                End If

                sqlConn.Close()

        End Select

    End Sub


End Class
