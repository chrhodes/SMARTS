Imports PacificLife.Life.Enterprise.Data
Imports System.Data
Imports SMARTSCommon.CommonClass

Public Class _Object
    Inherits BaseClass

    Protected WithEvents ddlRelated As System.Web.UI.WebControls.DropDownList
    Protected WithEvents ddlRelatedSystem As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents ddlList As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents ddlSystemList As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents ddlTypeList As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents grdAttribute As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdName As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdArtifacts As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdRelations As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdDescription As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdLifecycle As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdDeviceObject As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdStepObject As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents lblStub As System.Web.UI.WebControls.Label
    'Protected WithEvents lblMessage As System.Web.UI.WebControls.Label
    'Protected WithEvents urlChangeContainer As System.Web.UI.WebControls.HyperLink
    'Protected WithEvents urlHistory As System.Web.UI.WebControls.HyperLink
    'Protected WithEvents urlBrowseThis As System.Web.UI.WebControls.HyperLink

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


    Protected Sub DataBindControl(ByVal Source As Object, ByVal sqlConn As PLDbConnection)

        Dim sqlCmd As PLDbCommand
        Dim sqlTable As New DataTable
        Dim drTemp As DataRow

        Select Case Source.ID
            Case "ddlSystemList", "ddlRelatedSystem"
                sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_SYSTEM & ",NULL", sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable()
            Case "ddlTypeList"
                sqlCmd = New PLDbCommand("GetShapeTypeList " & ABSTRACTION_OBJECT, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable()
            Case "ddlList"
                sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlSystemList.SelectedItem.Value & "," & ABSTRACTION_SYSTEMOBJECT, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable()
                For Each drTemp In sqlTable.Rows
                    If CInt(drTemp.Item("Related_TypeID").ToString) <> ddlTypeList.SelectedItem.Value Then
                        drTemp.Delete()
                    End If
                Next
            Case "grdName"
                If ddlList.SelectedIndex = EMPTY_INT Then
                    sqlTable = CreateDataTable()
                Else
                    sqlCmd = New PLDbCommand("GetItem_Container " & TABLE_SHAPE & "," & CInt(ddlList.SelectedItem.Value) & "," & ABSTRACTION_SYSTEMOBJECT & ";", sqlConn)
                    sqlTable = sqlCmd.ExecuteDataTable()
                End If
            Case "grdDescription", "grdLifecycle"
                sqlCmd = New PLDbCommand("GetItem " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable()
            Case "grdAttribute"
                sqlCmd = New PLDbCommand("GetItem_AttributeValue " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & ",NULL", sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable()
            Case "grdDeviceObject"
                sqlCmd = New PLDbCommand("GetItem_Container " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_DEVICEOBJECT, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable()
            Case "grdStepObject"
                sqlCmd = New PLDbCommand("GetItem_Container " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_STEPOBJECT, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable()
            Case "ddlRelated"
                sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlRelatedSystem.SelectedItem.Value & "," & ABSTRACTION_SYSTEMOBJECT, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable()
            Case "grdArtifacts"
                sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_ARTIFACT, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable()
            Case "grdRelations"
                sqlCmd = New PLDbCommand("GetItem_Relation NULL," & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_OBJECT, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable()
        End Select

        Source.DataSource = sqlTable
        Source.DataBind()

        Select Case Source.ID
            Case "ddlList"
                ddlList.Items.Insert(0, CreateListItem("CREATE NEW OBJECT"))
            Case "grdAttribute"
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
        End Select

    End Sub

    Public Sub ControlDeleteCommand(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        Dim strSQL As String

        If E.CommandName = "Delete" Then

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

            Select Case Source.ID
                Case "grdArtifacts"
                    strSQL = "DeleteItem_Artifact " & CInt(CType(E.Item.FindControl("lblArtifactID"), Label).Text) & "," & TABLE_SHAPE & "," & CInt(ddlList.SelectedItem.Value) & "," & LOGFUNCTION_DELETE_CONTAINER & "," & RewriteString(User.Identity.Name)
                Case "grdRelations"
                    strSQL = "DeleteRelation " & TABLE_RELATION & "," & CInt(CType(E.Item.FindControl("lblRelationID"), Label).Text) & "," & ABSTRACTION_OBJECT & "," & LOGFUNCTION_DELETE_RELATION & "," & RewriteString(User.Identity.Name)
            End Select
            Dim sqlCmd As New PLDbCommand(strSQL, sqlConn)
            sqlCmd.ExecuteNonQuery()
            DataBindControl(Source, sqlConn)

            sqlConn.Close()

        End If

    End Sub

    Public Sub ControlItemCommand(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)


        Dim strSQL As String
        Dim strValue As String
        Dim intValue As Integer
        Dim intDirection As Integer
        Dim sqlCmd As PLDbCommand

        If E.CommandName = "Insert" Then

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            Select Case Source.ID
                Case "grdArtifacts"
                    intValue = Integer.Parse(CType(E.Item.FindControl("ddlArtifacts"), DropDownList).SelectedItem.Value)
                    If intValue = EMPTY_INT Then
                        sqlConn.Close()
                        Response.Redirect("artifact.aspx?id=" & ddlList.SelectedItem.Value & "&type=" & ddlTypeList.SelectedItem.Value & "&artifact=" & EMPTY_INT, False)
                        Exit Sub
                    Else
                        '--- IF ARTIFACT IS NOT ALREADY ADDED, ADD IT
                        If booSetArtifact(sqlConn, ddlList.SelectedItem.Value, intValue) = True Then
                            DataBindControl(Source, sqlConn)
                        End If
                    End If
                Case "grdLifecycle"
                    subSetLifecycle(sqlConn, ddlList.SelectedItem.Value, E)
                    DataBindControl(Source, sqlConn)
                Case "grdRelations"
                        If CType(E.Item.FindControl("ddlRelated"), DropDownList).Items.Count <> EMPTY_INT Then
                            intValue = Integer.Parse(CType(E.Item.FindControl("ddlRelated"), DropDownList).SelectedItem.Value)
                            strValue = RewriteString(CType(E.Item.FindControl("txtRelation_Name"), TextBox).Text)
                            intDirection = Integer.Parse(CType(E.Item.FindControl("ddlDirection"), DropDownList).SelectedItem.Value)
                            If intDirection = DIRECTION_TO Then
                                strSQL = "SetRelation NULL," & strValue & "," & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & TABLE_SHAPE & "," & intValue & "," & ABSTRACTION_OBJECT & "," & LOGFUNCTION_SET_RELATION & "," & RewriteString(User.Identity.Name)
                            Else
                                strSQL = "SetRelation NULL," & strValue & "," & TABLE_SHAPE & "," & intValue & "," & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_OBJECT & "," & LOGFUNCTION_SET_RELATION & "," & RewriteString(User.Identity.Name)
                            End If
                            sqlCmd = New PLDbCommand(strSQL, sqlConn)
                            sqlCmd.ExecuteNonQuery()
                            DataBindControl(Source, sqlConn)
                        End If
            End Select

            sqlConn.Close()

        End If


    End Sub

    Private Sub ToggleEditColumn(ByVal intDivision As Integer, ByVal intLifecycle As Integer)

        Dim intSecurityLevel As Integer = SecureEditing(intDivision)

        '-- START MAKING EVERYTHING UNEDITABLE
        grdRelations.Columns(0).Visible = False
        grdRelations.ShowFooter = False
        grdAttribute.Columns(0).Visible = False
        grdArtifacts.Columns(0).Visible = False
        grdArtifacts.ShowFooter = False
        grdLifecycle.Columns(0).Visible = False
        grdName.Columns(0).Visible = False
        grdDescription.Columns(0).Visible = False

        '-- IF USER HAS SECURITY ACCESS, MAKE THIS VISIBLE
        If intSecurityLevel >= SECURITY_SHAPE Then
            grdLifecycle.Columns(0).Visible = True
        End If

        '-- IF NOT RETIRED, TOGGLE EDITING ACCORDING TO SECURITY ACCESS
        If intLifecycle <> LIFECYCLE_RETIRE Then
            If intSecurityLevel >= SECURITY_ASSOC Then
                grdRelations.Columns(0).Visible = True
                grdRelations.ShowFooter = True
                If intSecurityLevel >= SECURITY_ATTRIBUTE Then
                    grdAttribute.Columns(0).Visible = True
                    grdArtifacts.Columns(0).Visible = True
                    grdArtifacts.ShowFooter = True
                    If intSecurityLevel >= SECURITY_SHAPE Then
                        grdName.Columns(0).Visible = True
                        grdDescription.Columns(0).Visible = True
                    End If
                End If
            End If
        End If

    End Sub

    Sub ControlEdit(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        Source.EditItemIndex = E.Item.ItemIndex

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        DataBindControl(Source, sqlConn)
        sqlConn.Close()

        setFocus(Source, E)

    End Sub

    Public Sub ControlCancel(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        lblMessage.Visible = False
        Source.EditItemIndex = -1
        DataBindControl(Source, sqlConn)

        sqlConn.Close()

    End Sub


    Public Sub ControlUpdate(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        Dim strSQL As String
        Dim intValue As Integer
        Dim strValue As String

        Select Case Source.ID
            Case "grdLifecycle"
                Dim ddlValues As DropDownList = CType(E.Item.FindControl("ddlLifecycle"), DropDownList)
                intValue = CInt(ddlValues.SelectedItem.Value)
                strSQL = "SetItem_Lifecycle " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_LIFECYCLE & "," & intValue & "," & RewriteString(User.Identity.Name)
                ToggleEditColumn(gSTUB_intDivision, intValue)
            Case "grdAttribute"
                Dim intSTA_ID As Integer = Integer.Parse(CType(E.Item.FindControl("lblSTA_ID"), Label).Text)
                Dim ddlValues As DropDownList = CType(E.Item.FindControl("ddlAttributeValue"), DropDownList)
                If ddlValues.Items.Count > 0 Then
                    strValue = RewriteString(CStr(ddlValues.SelectedItem.Text))
                Else
                    strValue = RewriteString(CType(E.Item.FindControl("txtAttributeValue"), TextBox).Text)
                End If
                strSQL = "SetAttributeValue " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & intSTA_ID & "," & strValue & "," & LOGFUNCTION_SET_ATTRIBUTEVALUE & "," & RewriteString(User.Identity.Name)
            Case "grdDescription"
                strValue = CType(E.Item.FindControl("txtDescription"), TextBox).Text
                strSQL = "SetItem_Desc " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_DESCRIPTION & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
            Case "grdName"
                strValue = Trim(CType(E.Item.FindControl("txtName"), TextBox).Text)
                lblMessage.Visible = True
                If Len(strValue) > EMPTY_INT Then
                    '--- NON BLANK NAME ENTRY
                    Dim booExists As Boolean = False
                    For i As Integer = 0 To ddlList.Items.Count - 1
                        If ddlList.SelectedIndex <> i And strValue.ToUpper = ddlList.Items(i).Text.ToUpper Then
                            booExists = True
                        End If
                    Next
                    If booExists = True Then
                        '--- NAME ALREADY EXISTS
                        lblMessage.Text = "Name already exists. Select another."
                        Exit Sub
                    Else
                        If ddlList.SelectedIndex = EMPTY_INT Then
                            lblMessage.Text = "Submitted."
                            SubmitToDB(strValue)
                            Exit Sub
                        Else
                            lblMessage.Text = "Revised."
                            strSQL = "SetItem_Name " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_NAME & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
                        End If
                    End If
                Else
                    lblMessage.Text = "Name cannot be blank. Please re-enter"
                    Exit Sub
                End If
        End Select

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

        Source.EditItemIndex = -1
        DataBindControl(Source, sqlConn)
        If Source.ID = "grdDescription" Or Source.ID = "grdName" Then
            DataBindControl(grdRelations, sqlConn)
            If Source.ID = "grdName" Then
                DataBindControl(ddlList, sqlConn)
                ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByText(strValue))
            End If
        End If

        sqlConn.Close()

    End Sub


    Public Sub SubmitToDB(ByVal strName As String)

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Dim sqlCmd As PLDbCommand = New PLDbCommand("SetItem", sqlConn)

        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.AddParameter("@Table", SqlDbType.Int, 0).Value = TABLE_SHAPE
        sqlCmd.AddParameter("@ShapeType", SqlDbType.Int, 0).Value = ddlTypeList.SelectedItem.Value
        sqlCmd.AddParameter("@Lifecycle", SqlDbType.Int, 0).Value = LIFECYCLE_CURRENT
        sqlCmd.AddParameter("@Function", SqlDbType.Int, 0).Value = LOGFUNCTION_SET_SHAPE
        sqlCmd.AddParameter("@Value", SqlDbType.VarChar, 100).Value = Trim(Replace(CStr(strName), "'", "''"))
        sqlCmd.AddParameter("@Contact", SqlDbType.VarChar, 100).Value = Trim(Replace(CStr(User.Identity.Name), "'", "''"))
        sqlCmd.AddParameter("@NewID", SqlDbType.Int, 0).Direction = ParameterDirection.Output

        sqlCmd.ExecuteNonQuery()
        Dim strObject As String = sqlCmd.Parameters("@NewID").Value.ToString()
        sqlCmd = Nothing
        Dim strSQL As String = "SetContainer " & TABLE_SHAPE & "," & ddlSystemList.SelectedItem.Value & "," & TABLE_SHAPE & "," & CInt(strObject) & "," & ABSTRACTION_SYSTEMOBJECT & "," & LOGFUNCTION_SET_SHAPE & "," & RewriteString(User.Identity.Name)
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

        sqlConn.Close()

        Response.Redirect("object.aspx?type=" & ddlTypeList.SelectedItem.Value & "&id=" & strObject, False)

    End Sub


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        SetScroll()

        If Page.IsPostBack Then

            SaveScroll()

        Else

            'read results returned
            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

            DataBindControl(ddlTypeList, sqlConn)
            DataBindControl(ddlSystemList, sqlConn)
            If Len(CStr(Request.QueryString("id"))) > 0 Then
                ddlTypeList.SelectedIndex = ddlTypeList.Items.IndexOf(ddlTypeList.Items.FindByValue(Request.QueryString("type")))
                Dim sqlCmd As PLDbCommand = New PLDbCommand("GetItem_Container " & TABLE_SHAPE & "," & Request.QueryString("id") & "," & ABSTRACTION_SYSTEMOBJECT, sqlConn)
                Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable()
                Dim intID As Integer = sqlTable.Rows(0).Item("Related_ID")
                ddlSystemList.SelectedIndex = ddlSystemList.Items.IndexOf(ddlSystemList.Items.FindByValue(intID))
                DataBindControl(ddlList, sqlConn)
                ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByValue(Request.QueryString("id")))
            Else
                ddlTypeList.SelectedIndex = 0
                ddlSystemList.SelectedIndex = 0
                DataBindControl(ddlList, sqlConn)
                ddlList.SelectedIndex = 0
            End If

            DataBindPage(sqlConn)
            sqlConn.Close()

        End If

    End Sub

    Private Sub ddlList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlList.SelectedIndexChanged

        If ddlList.SelectedIndex = EMPTY_INT Then
            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            DataBindPage(sqlConn)
            grdName.EditItemIndex = -1
            grdDescription.EditItemIndex = -1
            grdAttribute.EditItemIndex = -1
            sqlConn.Close()
        Else
            Response.Redirect("object.aspx?type=" & ddlTypeList.SelectedItem.Value & "&id=" & ddlList.SelectedItem.Value, False)
            Exit Sub
        End If

    End Sub


    Private Sub ddlTypeList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlTypeList.SelectedIndexChanged

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        DataBindControl(ddlList, sqlConn)
        ddlList.SelectedIndex = 0
        DataBindPage(sqlConn)
        grdName.EditItemIndex = -1
        grdDescription.EditItemIndex = -1
        grdAttribute.EditItemIndex = -1

        sqlConn.Close()

    End Sub


    Private Sub ddlSystemList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlSystemList.SelectedIndexChanged

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        DataBindControl(ddlList, sqlConn)

        ddlList.SelectedIndex = 0
        DataBindPage(sqlConn)
        grdName.EditItemIndex = -1
        grdDescription.EditItemIndex = -1
        grdAttribute.EditItemIndex = -1

        sqlConn.Close()

    End Sub


    Public Sub DataBindDependentList(ByVal Sender As Object, ByVal E As System.EventArgs)

        If Sender.ID = "ddlRelatedSystem" Then
            'Get the Shape DropDown
            Dim ddlSys As DropDownList = CType(Sender, DropDownList)
            Dim intSys As Integer = ddlSys.SelectedItem.Value
            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            Dim sqlCmd As PLDbCommand = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & intSys & "," & ABSTRACTION_SYSTEMOBJECT, sqlConn)
            Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable()

            Dim item As DataGridItem = CType(ddlSys.Parent.Parent, DataGridItem)
            Dim ddlShape As DropDownList = CType(item.FindControl("ddlRelated"), DropDownList)
            ddlShape.DataSource = sqlTable
            ddlShape.DataBind()

            sqlConn.Close()

        End If


    End Sub


    Private Function CreateDataTable() As DataTable

        Dim dtTable As DataTable = New DataTable("Data")
        dtTable.Columns.Add(New DataColumn("Principal_ID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("Principal_Name", GetType(String)))
        dtTable.Columns.Add(New DataColumn("Principal_TypeName", GetType(String)))
        dtTable.Columns.Add(New DataColumn("PrincipalContainer_ID", GetType(String)))
        dtTable.Columns.Add(New DataColumn("PrincipalContainer_Name", GetType(String)))
        dtTable.AcceptChanges()
        Dim dtRow As DataRow = dtTable.NewRow
        dtRow("Principal_ID") = EMPTY_INT
        dtRow("Principal_Name") = ""
        dtRow("Principal_TypeName") = ddlTypeList.SelectedItem.Text
        dtRow("PrincipalContainer_ID") = ddlSystemList.SelectedItem.Value
        dtRow("PrincipalContainer_Name") = ddlSystemList.SelectedItem.Text
        dtTable.Rows.Add(dtRow)
        dtTable.AcceptChanges()

        Return dtTable

    End Function

    '--- GETS STA INFO : DESCRIPTION, CONSTRAINED VALUES, DEPENDENTS
    Public Sub DataBindPage(ByVal sqlConn As PLDbConnection)

        lblMessage.Visible = False

        DataBindControl(grdName, sqlConn)

        If ddlList.SelectedIndex = EMPTY_INT Then
            grdDescription.Visible = False
            grdLifecycle.Visible = False
            grdAttribute.Visible = False
            grdArtifacts.Visible = False
            grdRelations.Visible = False
            grdDeviceObject.Visible = False
            grdStepObject.Visible = False
            lblStub.Visible = False
            urlChangeContainer.Visible = False
            urlHistory.Visible = False
            urlBrowseThis.Visible = False
        Else
            urlHistory.NavigateUrl = "history.aspx?page=object.aspx&id=" & Request.QueryString("id") & "&type=" & Request.QueryString("type")
            urlChangeContainer.NavigateUrl = "changecontainer.aspx?page=object.aspx&id=" & Request.QueryString("id") & "&type=" & Request.QueryString("type")
            urlBrowseThis.NavigateUrl = "../SMARTSBROWSER/object.aspx?id=" & Request.QueryString("id") & "&type=" & Request.QueryString("type")

            If grdName.Items.Count = EMPTY_INT Then
                'GOT NOTHING BACK, GET LIST OF LATEST
                DataBindControl(ddlList, sqlConn)
                lblMessage.Text = "Selection is unavailable. Please select another."
                lblMessage.Visible = True
            Else
                DataBindControl(grdDescription, sqlConn)
                grdDescription.Visible = True
                DataBindControl(grdLifecycle, sqlConn)
                grdLifecycle.Visible = True
                DataBindControl(grdAttribute, sqlConn)
                grdAttribute.Visible = True
                DataBindControl(grdArtifacts, sqlConn)
                grdArtifacts.Visible = True
                DataBindControl(grdRelations, sqlConn)
                grdRelations.Visible = True
                DataBindControl(grdDeviceObject, sqlConn)
                grdDeviceObject.Visible = True
                DataBindControl(grdStepObject, sqlConn)
                grdStepObject.Visible = True

                '--- STUB FOR LATER
                lblStub.Visible = True

                '--- HIDE EDIT COLUMN IF SHAPE IS RETIRED, SHOW IF USER HAS CORRECT SECURITY LEVEL
                Dim lblLifecycle As Label = CType(grdLifecycle.Items.Item(0).FindControl("lblLifecycle_ID"), Label)
                ToggleEditColumn(gSTUB_intDivision, CInt(lblLifecycle.Text))

            End If
        End If

    End Sub


    Public Sub ControlItemDataBound(ByVal Source As Object, ByVal E As DataGridItemEventArgs)

        Dim typItem As ListItemType = E.Item.ItemType
        Dim sqlCmd As PLDbCommand
        Dim sqlTable As New DataTable
        Dim strSQL As String

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Select Case typItem
            Case ListItemType.Footer
                Select Case Source.id
                    Case "grdArtifacts"
                        Dim ddlData As DropDownList = CType(E.Item.FindControl("ddlArtifacts"), DropDownList)
                        ddlData = GetArtifacts(ddlData, sqlConn)
                    Case "grdRelations"
                        Dim ddlData As DropDownList = CType(E.Item.FindControl("ddlRelatedSystem"), DropDownList)
                        sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_SYSTEM & "," & SHAPETYPE_SYSTEM, sqlConn)
                        sqlTable = sqlCmd.ExecuteDataTable()
                        If sqlTable.Rows.Count > 0 Then
                            ddlData.DataSource = sqlTable
                            ddlData.DataBind()
                        End If
                        ddlData.Items.Insert(0, CreateListItem("SELECT"))
                End Select
            Case ListItemType.EditItem
                Select Case Source.id
                    Case "grdLifecycle"
                        Dim ddlValue As DropDownList = CType(E.Item.FindControl("ddlLifecycle"), DropDownList)
                        Dim lblValue As Label = CType(E.Item.FindControl("lblLifecycle_ID"), Label)
                        Dim intValue As Integer = CInt(lblValue.Text)
                        sqlCmd = New PLDbCommand("GetLifecycleList", sqlConn)
                        sqlTable = sqlCmd.ExecuteDataTable()
                        ddlValue.DataSource = sqlTable
                        ddlValue.DataBind()
                        ddlValue.Items.FindByValue(intValue).Selected = True
                        ddlValue.Visible = True
                        If grdRelations.Items.Count > 0 Then
                            ddlValue.Items.RemoveAt(ddlValue.Items.IndexOf(ddlValue.Items.FindByValue(LIFECYCLE_RETIRE)))
                        End If
                        ToggleEditColumn(gSTUB_intDivision, intValue)
                    Case "grdAttribute"
                        PopulateControl_Attributes(E, sqlConn, ddlList)
                End Select
        End Select

        sqlConn.Close()

    End Sub



End Class
