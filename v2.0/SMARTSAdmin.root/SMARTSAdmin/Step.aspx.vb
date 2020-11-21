Imports PacificLife.Life.Enterprise.Data
Imports System.Data
Imports SMARTSCommon.CommonClass

Public Class _Step
    Inherits BaseClass

    Protected WithEvents ddlStepObjectSystem As System.Web.UI.WebControls.DropDownList
    Protected WithEvents ddlStepObjectShape As System.Web.UI.WebControls.DropDownList
    Protected WithEvents ddlStepObjectShapeType As System.Web.UI.WebControls.DropDownList
    Protected WithEvents ddlRelated As System.Web.UI.WebControls.DropDownList
    Protected WithEvents ddlRelatedBusiness As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents ddlList As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents ddlTypeList As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents ddlBusinessList As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents grdAttribute As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdName As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdArtifacts As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdRelations As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdDescription As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdLifecycle As System.Web.UI.WebControls.DataGrid
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
        dtRow("PrincipalContainer_ID") = ddlBusinessList.SelectedItem.Value
        dtRow("PrincipalContainer_Name") = ddlBusinessList.SelectedItem.Text
        dtTable.Rows.Add(dtRow)
        dtTable.AcceptChanges()

        Return dtTable

    End Function

    Private Sub ToggleEditColumn(ByVal intValue As Integer)

        If intValue = LIFECYCLE_RETIRE Then
            grdName.Columns(0).Visible = False
            grdDescription.Columns(0).Visible = False
            grdAttribute.Columns(0).Visible = False
            grdArtifacts.Columns(0).Visible = False
            grdArtifacts.ShowFooter = False
            grdStepObject.Columns(0).Visible = False
            grdStepObject.ShowFooter = False
            grdRelations.Columns(0).Visible = False
            grdRelations.ShowFooter = False
        Else
            grdName.Columns(0).Visible = True
            grdDescription.Columns(0).Visible = True
            grdAttribute.Columns(0).Visible = True
            grdArtifacts.Columns(0).Visible = True
            grdArtifacts.ShowFooter = True
            grdStepObject.Columns(0).Visible = True
            grdStepObject.ShowFooter = True
            grdRelations.Columns(0).Visible = True
            grdRelations.ShowFooter = True
        End If

    End Sub

    Protected Sub DataBindControl(ByVal Source As Object, ByVal sqlConn As PLDbConnection)

        Dim sqlCmd As PLDbCommand
        Dim sqlTable As New DataTable
        Dim drTemp As DataRow

        Select Case Source.ID
            Case "grdName"
                If ddlList.SelectedIndex = EMPTY_INT Then
                    sqlTable = CreateDataTable()
                Else
                    sqlCmd = New PLDbCommand("GetItem_Container " & TABLE_SHAPE & "," & CInt(ddlList.SelectedItem.Value) & "," & ABSTRACTION_BUSINESSSTEP & ";", sqlConn)
                    sqlTable = sqlCmd.ExecuteDataTable
                End If
            Case "ddlBusinessList", "ddlRelatedBusiness"
                sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_BUSINESS & ",NULL", sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
            Case "ddlTypeList"
                sqlCmd = New PLDbCommand("GetShapeTypeList " & ABSTRACTION_STEP, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
            Case "ddlList"
                sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlBusinessList.SelectedItem.Value & "," & ABSTRACTION_BUSINESSSTEP, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
                For Each drTemp In sqlTable.Rows
                    If CInt(drTemp.Item("Related_TypeID").ToString) <> ddlTypeList.SelectedItem.Value Then
                        drTemp.Delete()
                    End If
                Next
            Case "ddlStepObjectShapeType"
                sqlCmd = New PLDbCommand("GetShapeTypeList " & ABSTRACTION_OBJECT, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
            Case "ddlStepObjectSystem"
                sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_SYSTEM & "," & SHAPETYPE_SYSTEM, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
            Case "ddlStepObjectShape"
                sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlStepObjectSystem.SelectedItem.Value & "," & ABSTRACTION_SYSTEMOBJECT, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
                For Each drTemp In sqlTable.Rows
                    If CInt(drTemp.Item("Related_TypeID").ToString) <> ddlStepObjectShapeType.SelectedItem.Value Then
                        drTemp.Delete()
                    End If
                Next
            Case "ddlRelated"
                sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlRelatedBusiness.SelectedItem.Value & "," & ABSTRACTION_BUSINESSSTEP, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
            Case "grdDescription", "grdLifecycle"
                sqlCmd = New PLDbCommand("GetItem " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
            Case "grdAttribute"
                sqlCmd = New PLDbCommand("GetItem_AttributeValue " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & ",NULL", sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
            Case "grdStepObject"
                sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_STEPOBJECT, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
            Case "grdArtifacts"
                sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_ARTIFACT, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
            Case "grdRelations"
                sqlCmd = New PLDbCommand("GetItem_Relation NULL," & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_STEP, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
        End Select

        Source.DataSource = sqlTable
        Source.DataBind()

        Select Case Source.ID
            Case "ddlList"
                ddlList.Items.Insert(0, CreateListItem("CREATE NEW PROCESS STEP"))
            Case "grdAttribute"
                Dim i As Integer
                For i = 0 To Source.Items.Count - 1
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

        If E.CommandName = "Delete" Then

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            Dim strSQL As String

            Select Case Source.ID
                Case "grdStepObject"
                    strSQL = "DeleteContainer " & TABLE_CONTAINER & "," & CInt(CType(E.Item.FindControl("lblStepObjectID"), Label).Text) & "," & LOGFUNCTION_DELETE_CONTAINER & "," & RewriteString(User.Identity.Name)
                Case "grdArtifacts"
                    strSQL = "DeleteItem_Artifact " & CInt(CType(E.Item.FindControl("lblArtifactID"), Label).Text) & "," & TABLE_SHAPE & "," & CInt(ddlList.SelectedItem.Value) & "," & LOGFUNCTION_DELETE_CONTAINER & "," & RewriteString(User.Identity.Name)
                Case "grdRelations"
                    strSQL = "DeleteRelation " & TABLE_RELATION & "," & CInt(CType(E.Item.FindControl("lblRelationID"), Label).Text) & "," & ABSTRACTION_STEP & "," & LOGFUNCTION_DELETE_RELATION & "," & RewriteString(User.Identity.Name)
            End Select
            Dim sqlCmd As New PLDbCommand(strSQL, sqlConn)
            sqlCmd.ExecuteNonQuery()
            DataBindControl(Source, sqlConn)

            sqlConn.Close()

        End If

    End Sub

    Public Sub ControlItemCommand(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)



        If E.CommandName = "Insert" Then

            Dim intValue As Integer
            Dim intDirection As Integer
            Dim strSQL As String
            Dim strValue As String
            Dim sqlCmd As PLDbCommand
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
                            strSQL = "SetRelation NULL," & strValue & "," & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & TABLE_SHAPE & "," & intValue & "," & ABSTRACTION_STEP & "," & LOGFUNCTION_SET_RELATION & "," & RewriteString(User.Identity.Name)
                        Else
                            strSQL = "SetRelation NULL," & strValue & "," & TABLE_SHAPE & "," & intValue & "," & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_STEP & "," & LOGFUNCTION_SET_RELATION & "," & RewriteString(User.Identity.Name)
                        End If
                        sqlCmd = New PLDbCommand(strSQL, sqlConn)
                        sqlCmd.ExecuteNonQuery()
                        DataBindControl(Source, sqlConn)
                    End If
                Case "grdStepObject"
                    If CType(E.Item.FindControl("ddlStepObjectShape"), DropDownList).Items.Count <> EMPTY_INT Then
                        intValue = Integer.Parse(CType(E.Item.FindControl("ddlStepObjectShape"), DropDownList).SelectedItem.Value)
                        strSQL = "SetContainer " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & TABLE_SHAPE & "," & intValue & "," & ABSTRACTION_STEPOBJECT & "," & LOGFUNCTION_SET_CONTAINER & "," & RewriteString(User.Identity.Name)
                        sqlCmd = New PLDbCommand(strSQL, sqlConn)
                        sqlCmd.ExecuteNonQuery()
                        DataBindControl(Source, sqlConn)
                    End If
            End Select

            sqlConn.Close()

        End If

    End Sub

    Public Sub ControlEdit(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

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


    Public Sub SubmitToDB(ByVal strValue As String)

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Dim sqlCmd As PLDbCommand

        '--- SET SHAPE INTO DB
        sqlCmd = New PLDbCommand("SetItem", sqlConn)
        With sqlCmd
            .CommandType = CommandType.StoredProcedure
            .AddParameter("@Table", SqlDbType.Int, 0).Value = TABLE_SHAPE
            .AddParameter("@ShapeType", SqlDbType.Int, 0).Value = ddlTypeList.SelectedItem.Value
            .AddParameter("@Lifecycle", SqlDbType.Int, 0).Value = LIFECYCLE_CURRENT
            .AddParameter("@Function", SqlDbType.Int, 0).Value = LOGFUNCTION_SET_SHAPE
            .AddParameter("@Value", SqlDbType.VarChar, 100).Value = Trim(Replace(CStr(strValue), "'", "''"))
            .AddParameter("@Contact", SqlDbType.VarChar, 100).Value = Trim(Replace(CStr(User.Identity.Name), "'", "''"))
            .AddParameter("@NewID", SqlDbType.Int, 0).Direction = ParameterDirection.Output
            .ExecuteNonQuery()
        End With

        Dim strObject As String = sqlCmd.Parameters("@NewID").Value.ToString()
        Dim strSQL As String = "SetContainer " & TABLE_SHAPE & "," & ddlBusinessList.SelectedItem.Value & "," & TABLE_SHAPE & "," & CInt(strObject) & "," & ABSTRACTION_BUSINESSSTEP & "," & LOGFUNCTION_SET_SHAPE & "," & RewriteString(User.Identity.Name)

        '--- SET CONTAINER THE SHAPE BELONGS IN
        sqlCmd = Nothing
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

        sqlConn.Close()

        Response.Redirect("step.aspx?type=" & ddlTypeList.SelectedItem.Value & "&id=" & strObject, False)

    End Sub


    Public Sub ControlUpdate(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        Dim strSQL As String
        Dim strValue As String

        Select Case Source.ID
            Case "grdLifecycle"
                Dim ddlValues As DropDownList = CType(E.Item.FindControl("ddlLifecycle"), DropDownList)
                Dim intValue As Integer = CInt(ddlValues.SelectedItem.Value)
                strSQL = "SetItem_Lifecycle " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_LIFECYCLE & "," & intValue & "," & RewriteString(User.Identity.Name)
                ToggleEditColumn(intValue)
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
                strValue = RewriteString(CType(E.Item.FindControl("txtDescription"), TextBox).Text)
                strSQL = "SetItem_Desc " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_DESCRIPTION & "," & strValue & "," & RewriteString(User.Identity.Name)
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


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        SetScroll()

        If Page.IsPostBack Then

            SaveScroll()

        Else

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

            DataBindControl(ddlTypeList, sqlConn)
            DataBindControl(ddlBusinessList, sqlConn)
            If Len(CStr(Request.QueryString("id"))) > 0 Then
                ddlTypeList.SelectedIndex = ddlTypeList.Items.IndexOf(ddlTypeList.Items.FindByValue(Request.QueryString("type")))
                Dim sqlCmd As PLDbCommand = New PLDbCommand("GetItem_Container " & TABLE_SHAPE & "," & Request.QueryString("id") & "," & ABSTRACTION_BUSINESSSTEP, sqlConn)
                Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable()
                Dim intID As Integer = sqlTable.Rows(0).Item("Related_ID")
                ddlBusinessList.SelectedIndex = ddlBusinessList.Items.IndexOf(ddlBusinessList.Items.FindByValue(intID))
                DataBindControl(ddlList, sqlConn)
                ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByValue(Request.QueryString("id")))
            Else
                ddlTypeList.SelectedIndex = 0
                ddlBusinessList.SelectedIndex = 0
                DataBindControl(ddlList, sqlConn)
                ddlList.SelectedIndex = 0
            End If

            DataBindPage(sqlConn)
            sqlConn.Close()


            'Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            'Dim sqlCmd As PLDbCommand
            'Dim sqlTable As New DataTable
            'Dim strSQL As String

            ''read results returned
            'DataBindControl(ddlTypeList, sqlConn)
            'If Len(CStr(Request.QueryString("id"))) > 0 Then
            '    ddlTypeList.SelectedIndex = ddlTypeList.Items.IndexOf(ddlTypeList.Items.FindByValue(Request.QueryString("type")))
            '    sqlCmd = New PLDbCommand("GetItem_Container " & TABLE_SHAPE & "," & Request.QueryString("id") & "," & ABSTRACTION_BUSINESSSTEP, sqlConn)
            '    sqlTable = sqlCmd.ExecuteDataTable
            '    ddlBusinessList.DataValueField = "Related_ID"
            '    ddlBusinessList.DataTextField = "Related_Name"
            '    ddlBusinessList.DataSource = sqlTable
            '    ddlBusinessList.DataBind()
            '    DataBindControl(ddlList, sqlConn)
            '    ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByValue(Request.QueryString("id")))
            'Else
            '    ddlTypeList.SelectedIndex = 0
            '    sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_BUSINESS & ",NULL", sqlConn)
            '    sqlTable = sqlCmd.ExecuteDataTable
            '    ddlBusinessList.DataValueField = "Shape_ID"
            '    ddlBusinessList.DataTextField = "Shape_Name"
            '    ddlBusinessList.DataSource = sqlTable
            '    ddlBusinessList.DataBind()
            '    ddlBusinessList.SelectedIndex = 0
            '    DataBindControl(ddlList, sqlConn)
            '    ddlList.SelectedIndex = 0
            'End If
            'DataBindPage(sqlConn)

            'sqlConn.Close()

        End If

    End Sub

    Private Sub ddlBusinessList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlBusinessList.SelectedIndexChanged

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        DataBindControl(ddlList, sqlConn)
        DataBindPage(sqlConn)
        grdName.EditItemIndex = -1
        grdDescription.EditItemIndex = -1
        grdAttribute.EditItemIndex = -1

        sqlConn.Close()

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

    Private Sub ddlList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlList.SelectedIndexChanged

        If ddlList.SelectedIndex = EMPTY_INT Then
            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            DataBindPage(sqlConn)
            grdName.EditItemIndex = -1
            grdDescription.EditItemIndex = -1
            grdAttribute.EditItemIndex = -1
            sqlConn.Close()
        Else
            Response.Redirect("step.aspx?type=" & ddlTypeList.SelectedItem.Value & "&id=" & ddlList.SelectedItem.Value, False)
        End If

    End Sub


    Public Sub DataBindDependentList(ByVal Sender As Object, ByVal E As System.EventArgs)

        Dim ddlType As DropDownList = CType(Sender, DropDownList)
        Dim intType As Integer = ddlType.SelectedItem.Value
        Dim ddlShape As DropDownList
        Dim item As DataGridItem = CType(ddlType.Parent.Parent, DataGridItem)
        Dim sqlTable As New DataTable
        Dim sqlCmd As PLDbCommand
        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        Select Case Sender.ID
            Case "ddlRelatedBusiness"
                ddlShape = CType(item.FindControl("ddlRelated"), DropDownList)
                sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & intType & "," & ABSTRACTION_BUSINESSSTEP, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
                ddlShape.DataSource = sqlTable
                ddlShape.DataBind()

            Case "ddlStepObjectSystem", "ddlStepObjectShapeType"
                ddlShape = CType(item.FindControl("ddlStepObjectShape"), DropDownList)
                If intType = EMPTY_INT Then
                    ddlShape.Items.Clear()
                Else
                    Dim ddlSystem As DropDownList = CType(item.FindControl("ddlStepObjectSystem"), DropDownList)
                    sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlSystem.SelectedItem.Value & "," & ABSTRACTION_SYSTEMOBJECT, sqlConn)
                    sqlTable = sqlCmd.ExecuteDataTable
                    Dim drTemp As DataRow
                    Dim ddlShapeType As DropDownList = CType(item.FindControl("ddlStepObjectShapeType"), DropDownList)
                    For Each drTemp In sqlTable.Rows
                        If CInt(drTemp.Item("Related_TypeID").ToString) <> ddlShapeType.SelectedItem.Value Then
                            drTemp.Delete()
                        End If
                    Next
                    With ddlShape
                        .DataSource = sqlTable
                        .DataBind()
                    End With

                End If

                grdStepObject.SelectedIndex = grdStepObject.Items.Count

        End Select

        sqlConn.Close()

    End Sub


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
            grdStepObject.Visible = False
            lblStub.Visible = False
            urlChangeContainer.Visible = False
            urlHistory.Visible = False
            urlBrowseThis.Visible = False
        Else
            urlChangeContainer.NavigateUrl = "changecontainer.aspx?page=step.aspx&id=" & Request.QueryString("id") & "&type=" & Request.QueryString("type")
            urlHistory.NavigateUrl = "history.aspx?page=step.aspx&id=" & Request.QueryString("id") & "&type=" & Request.QueryString("type")
            urlBrowseThis.NavigateUrl = "../SMARTSBROWSER/step.aspx?id=" & Request.QueryString("id") & "&type=" & Request.QueryString("type")

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
                DataBindControl(grdStepObject, sqlConn)
                grdStepObject.Visible = True

                lblStub.Visible = True

                '--- HIDE EDIT COLUMN IF SHAPE IS RETIRED
                Dim lblLifecycle As Label = CType(grdLifecycle.Items.Item(0).FindControl("lblLifecycle_ID"), Label)
                ToggleEditColumn(CInt(lblLifecycle.Text))

            End If

        End If

    End Sub


    Public Sub ControlItemDataBound(ByVal Source As Object, ByVal E As DataGridItemEventArgs)

        Dim typItem As ListItemType = E.Item.ItemType
        Dim sqlTable As New DataTable
        Dim sqlCmd As PLDbCommand
        Dim sqlReader As PLDbDataReader
        Dim strSQL As String

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Select Case typItem
            Case ListItemType.Footer
                Select Case Source.id
                    Case "grdArtifacts"
                        Dim ddlData As DropDownList = CType(E.Item.FindControl("ddlArtifacts"), DropDownList)
                        ddlData = GetArtifacts(ddlData, sqlConn)
                    Case "grdRelations"
                        strSQL = "EXEC GetShapeList " & ABSTRACTION_BUSINESS & "," & SHAPETYPE_BUSINESS & ";"
                        sqlCmd = New PLDbCommand(strSQL, sqlConn)
                        sqlTable = sqlCmd.ExecuteDataTable
                        Dim ddlData As DropDownList = CType(E.Item.FindControl("ddlRelatedBusiness"), DropDownList)
                        ddlData.DataSource = sqlTable
                        ddlData.DataBind()
                        ddlData.Items.FindbyValue(ddlBusinessList.SelectedValue).Selected = True
                        strSQL = "EXEC GetItem_Contained " & TABLE_SHAPE & "," & ddlData.SelectedItem.Value & "," & ABSTRACTION_BUSINESSSTEP & ";"
                        sqlCmd = New PLDbCommand(strSQL, sqlConn)
                        sqlTable = sqlCmd.ExecuteDataTable
                        Dim ddlData2 As DropDownList = CType(E.Item.FindControl("ddlRelated"), DropDownList)
                        ddlData2.DataSource = sqlTable
                        ddlData2.DataBind()
                    Case "grdStepObject"
                        strSQL = "EXEC GetShapeList " & ABSTRACTION_SYSTEM & "," & SHAPETYPE_SYSTEM
                        sqlCmd = New PLDbCommand(strSQL, sqlConn)
                        sqlTable = sqlCmd.ExecuteDataTable
                        Dim ddlData As DropDownList = CType(E.Item.FindControl("ddlStepObjectSystem"), DropDownList)
                        ddlData.DataSource = sqlTable
                        ddlData.DataBind()
                        strSQL = "EXEC GetShapeTypeList " & ABSTRACTION_OBJECT
                        sqlCmd = New PLDbCommand(strSQL, sqlConn)
                        sqlTable = sqlCmd.ExecuteDataTable
                        Dim ddlData2 As DropDownList = CType(E.Item.FindControl("ddlStepObjectShapeType"), DropDownList)
                        ddlData2.DataSource = sqlTable
                        ddlData2.DataBind()
                        ddlData.Items.Insert(0, CreateListItem("SELECT"))
                        ddlData2.Items.Insert(0, CreateListItem("SELECT"))
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
                        ToggleEditColumn(intValue)
                    Case "grdAttribute"
                        PopulateControl_Attributes(E, sqlConn, ddlList)
                End Select
        End Select

        sqlConn.Close()

    End Sub

End Class
