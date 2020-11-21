Imports PacificLife.Life.Enterprise.Data
Imports System.Data
Imports SMARTSCommon.CommonClass

Public Class Device

    Inherits BaseClass

    Protected WithEvents ddlContainedByDeviceShape As System.Web.UI.WebControls.DropDownList
    Protected WithEvents ddlContainedByDeviceShapeType As System.Web.UI.WebControls.DropDownList
    Protected WithEvents ddlContainDeviceShape As System.Web.UI.WebControls.DropDownList
    Protected WithEvents ddlContainDeviceShapeType As System.Web.UI.WebControls.DropDownList
    Protected WithEvents ddlDeviceObjectShape As System.Web.UI.WebControls.DropDownList
    Protected WithEvents ddlDeviceObjectSystem As System.Web.UI.WebControls.DropDownList
    Protected WithEvents ddlDeviceObjectShapeType As System.Web.UI.WebControls.DropDownList
    Protected WithEvents ddlRelationDevice As System.Web.UI.WebControls.DropDownList
    Protected WithEvents ddlRelationType As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents ddlList As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents ddlTypeList As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents ddlIP As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents grdAttribute As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdAddress As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdArtifacts As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdContainDevice As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdContainedByDevice As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdDescription As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdLifecycle As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdName As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdRelations As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdDeviceObject As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents lblMessage As System.Web.UI.WebControls.Label
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
        dtTable.Columns.Add(New DataColumn("Shape_ID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("Shape_Name", GetType(String)))
        dtTable.Columns.Add(New DataColumn("ShapeType_ID", GetType(String)))
        dtTable.Columns.Add(New DataColumn("ShapeType_Name", GetType(String)))
        dtTable.AcceptChanges()
        Dim dtRow As DataRow = dtTable.NewRow
        dtRow("Shape_ID") = EMPTY_INT
        dtRow("Shape_Name") = ""
        dtRow("ShapeType_ID") = ddlTypeList.SelectedItem.Value
        dtRow("ShapeType_Name") = ddlTypeList.SelectedItem.Text
        dtTable.Rows.Add(dtRow)
        dtTable.AcceptChanges()

        Return dtTable

    End Function

    Protected Sub DataBindControl(ByVal Source As Object, ByVal sqlConn As PLDbConnection)

        Dim sqlCmd As PLDbCommand
        Dim sqlTable As New DataTable

        Select Case Source.ID
            Case "ddlList"
                sqlCmd = New PLDbCommand("GetShapeList NULL," & ddlTypeList.SelectedItem.Value, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
                Source.DataSource = sqlTable
                Source.DataBind()
                ddlList.Items.Insert(0, CreateListItem("CREATE NEW DEVICE"))
            Case "grdAttribute"
                sqlCmd = New PLDbCommand("GetItem_AttributeValue " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & ",NULL", sqlConn)
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
            Case "ddlDeviceObjectShape"
                sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlDeviceObjectSystem.SelectedItem.Value & "," & ABSTRACTION_SYSTEMOBJECT, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
                Dim drTemp As DataRow
                For Each drTemp In sqlTable.Rows
                    If CInt(drTemp.Item("Principal_TypeID").ToString) <> ddlDeviceObjectShapeType.SelectedItem.Value Then
                        drTemp.Delete()
                    End If
                Next
                Source.DataSource = sqlTable
                Source.DataBind()
            Case "grdName"
                If ddlList.SelectedItem.Value = EMPTY_INT Then
                    sqlTable = CreateDataTable()
                Else
                    sqlCmd = New PLDbCommand("GetItem " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value, sqlConn)
                    sqlTable = sqlCmd.ExecuteDataTable
                End If
                Source.DataSource = sqlTable
                Source.DataBind()
            Case Else
                Select Case Source.ID
                    Case "ddlTypeList", "ddlContainDeviceShapeType", "ddlContainedByDeviceShapeType", "ddlRelationType"
                        sqlCmd = New PLDbCommand("GetShapeTypeList " & ABSTRACTION_DEVICE, sqlConn)
                    Case "grdDescription", "grdLifecycle", "grdShapeType"
                        sqlCmd = New PLDbCommand("GetItem " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value, sqlConn)
                    Case "ddlDeviceObjectShapeType"
                        sqlCmd = New PLDbCommand("GetShapeTypeList " & ABSTRACTION_OBJECT, sqlConn)
                    Case "ddlRelationDevice"
                        sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_DEVICE & "," & ddlRelationType.SelectedItem.Value, sqlConn)
                    Case "ddlIP"
                        sqlCmd = New PLDbCommand("GetShapeList NULL," & SHAPETYPE_IP, sqlConn)
                    Case "ddlContainDeviceShape"
                        sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_DEVICE & "," & ddlContainDeviceShapeType.SelectedItem.Value, sqlConn)
                    Case "ddlContainedByDeviceShape"
                        sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_DEVICE & "," & ddlContainedByDeviceShapeType.SelectedItem.Value, sqlConn)
                    Case "ddlDeviceObjectSystem"
                        sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_SYSTEM & "," & SHAPETYPE_SYSTEM, sqlConn)
                    Case "grdAddress"
                        sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_IP, sqlConn)
                    Case "grdArtifacts"
                        sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_ARTIFACT, sqlConn)
                    Case "grdContainDevice"
                        sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_DEVICE, sqlConn)
                    Case "grdContainedByDevice"
                        sqlCmd = New PLDbCommand("GetItem_Container " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_DEVICE, sqlConn)
                    Case "grdDeviceObject"
                        sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_DEVICEOBJECT, sqlConn)
                    Case "grdRelations"
                        sqlCmd = New PLDbCommand("GetItem_Relation NULL," & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_DEVICE, sqlConn)
                End Select
                sqlTable = sqlCmd.ExecuteDataTable
                Source.DataSource = sqlTable
                Source.DataBind()
        End Select

        Source.SelectedIndex = Source.Items.Count - 1

    End Sub

    Public Sub ControlDeleteCommand(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        If E.CommandName = "Delete" Then

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            Dim strSQL As String

            Select Case Source.ID
                Case "grdAddress"
                    strSQL = "DeleteContainer " & TABLE_CONTAINER & "," & CInt(CType(E.Item.FindControl("lblAddressID"), Label).Text) & "," & LOGFUNCTION_DELETE_CONTAINER & "," & RewriteString(User.Identity.Name)
                Case "grdArtifacts"
                    strSQL = "DeleteItem_Artifact " & CInt(CType(E.Item.FindControl("lblArtifactID"), Label).Text) & "," & TABLE_SHAPE & "," & CInt(ddlList.SelectedItem.Value) & "," & LOGFUNCTION_DELETE_CONTAINER & "," & RewriteString(User.Identity.Name)
                Case "grdDeviceObject"
                    strSQL = "DeleteContainer " & TABLE_CONTAINER & "," & CInt(CType(E.Item.FindControl("lblDeviceObjectID"), Label).Text) & "," & LOGFUNCTION_DELETE_CONTAINER & "," & RewriteString(User.Identity.Name)
                Case "grdContainDevice"
                    strSQL = "DeleteContainer " & TABLE_CONTAINER & "," & CInt(CType(E.Item.FindControl("lblContainDeviceID"), Label).Text) & "," & LOGFUNCTION_DELETE_CONTAINER & "," & RewriteString(User.Identity.Name)
                Case "grdRelations"
                    strSQL = "DeleteRelation " & TABLE_RELATION & "," & CInt(CType(E.Item.FindControl("lblRelationID"), Label).Text) & "," & ABSTRACTION_DEVICE & "," & LOGFUNCTION_DELETE_RELATION & "," & RewriteString(User.Identity.Name)
            End Select
            Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
            sqlCmd.ExecuteNonQuery()

            DataBindControl(Source, sqlConn)
            If Source.ID = "grdAddress" Then
                DataBindControl(ddlIP, sqlConn)
            End If

            sqlConn.Close()

        End If

    End Sub

    Public Sub ControlItemCommand(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        If E.CommandName = "Insert" Then

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            Dim strSQL As String
            Dim intValue As Integer
            Dim strValue As String
            Dim sqlCmd As PLDbCommand

            Select Case Source.ID
                Case "grdAddress"
                    strValue = CType(E.Item.FindControl("txtIPName"), TextBox).Text
                    Dim itmIP As ListItem = ddlIP.Items.FindByText(strValue)
                    If itmIP Is Nothing Then
                        'insert new IP into DB first
                        sqlCmd = New PLDbCommand("SetItem", sqlConn)
                        sqlCmd.CommandType = CommandType.StoredProcedure
                        sqlCmd.AddParameter("@Table", SqlDbType.Int, 0).Value = TABLE_SHAPE
                        sqlCmd.AddParameter("@ShapeType", SqlDbType.Int, 0).Value = SHAPETYPE_IP
                        sqlCmd.AddParameter("@Lifecycle", SqlDbType.Int, 0).Value = LIFECYCLE_CURRENT
                        sqlCmd.AddParameter("@Function", SqlDbType.Int, 0).Value = LOGFUNCTION_SET_SHAPE
                        sqlCmd.AddParameter("@Value", SqlDbType.VarChar, 100).Value = Trim(Replace(CStr(strValue), "'", "''"))
                        sqlCmd.AddParameter("@Contact", SqlDbType.VarChar, 100).Value = Trim(Replace(CStr(User.Identity.Name), "'", "''"))
                        sqlCmd.AddParameter("@NewID", SqlDbType.Int, 0).Direction = ParameterDirection.Output
                        sqlCmd.ExecuteNonQuery()
                        Dim intID As Integer = sqlCmd.Parameters("@NewID").Value.ToString()
                        sqlCmd = Nothing
                        'set new IP to Server
                        strSQL = "SetContainer " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & TABLE_SHAPE & "," & intID & "," & ABSTRACTION_IP & "," & LOGFUNCTION_SET_CONTAINER & "," & RewriteString(User.Identity.Name)
                        sqlCmd = New PLDbCommand(strSQL, sqlConn)
                        sqlCmd.ExecuteNonQuery()
                        DataBindControl(Source, sqlConn)
                        DataBindControl(ddlIP, sqlConn)
                    Else
                        lblMessage.Text = "IP Address already exists. Please enter another."
                        lblMessage.Visible = True
                    End If
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
                Case "grdDeviceObject"
                    If CType(E.Item.FindControl("ddlDeviceObjectShape"), DropDownList).Items.Count <> EMPTY_INT Then
                        Dim intShape As Integer = Integer.Parse(CType(E.Item.FindControl("ddlDeviceObjectShape"), DropDownList).SelectedItem.Value)
                        strSQL = "SetContainer " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & TABLE_SHAPE & "," & intShape & "," & ABSTRACTION_DEVICEOBJECT & "," & LOGFUNCTION_SET_CONTAINER & "," & RewriteString(User.Identity.Name)
                        sqlCmd = New PLDbCommand(strSQL, sqlConn)
                        sqlCmd.ExecuteNonQuery()
                        DataBindControl(Source, sqlConn)
                    End If
                Case "grdContainDevice"
                    If CType(E.Item.FindControl("ddlContainDeviceShape"), DropDownList).Items.Count <> EMPTY_INT Then
                        Dim intShape As Integer = Integer.Parse(CType(E.Item.FindControl("ddlContainDeviceShape"), DropDownList).SelectedItem.Value)
                        strSQL = "SetContainer " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & TABLE_SHAPE & "," & intShape & "," & ABSTRACTION_DEVICE & "," & LOGFUNCTION_SET_CONTAINER & "," & RewriteString(User.Identity.Name)
                        sqlCmd = New PLDbCommand(strSQL, sqlConn)
                        sqlCmd.ExecuteNonQuery()
                        DataBindControl(Source, sqlConn)
                    End If
                Case "grdContainedByDevice"
                        If CType(E.Item.FindControl("ddlContainedByDeviceShape"), DropDownList).Items.Count <> EMPTY_INT Then
                            Dim intShape As Integer = Integer.Parse(CType(E.Item.FindControl("ddlContainedByDeviceShape"), DropDownList).SelectedItem.Value)
                            strSQL = "SetContainer " & TABLE_SHAPE & "," & intShape & "," & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_DEVICE & "," & LOGFUNCTION_SET_CONTAINER & ",'" & Replace(User.Identity.Name, "'", "''") & "'"
                            sqlCmd = New PLDbCommand(strSQL, sqlConn)
                            sqlCmd.ExecuteNonQuery()
                            DataBindControl(Source, sqlConn)
                        End If
                Case "grdRelations"
                        If CType(E.Item.FindControl("ddlRelationDevice"), DropDownList).Items.Count <> EMPTY_INT Then
                            intValue = Integer.Parse(CType(E.Item.FindControl("ddlRelationDevice"), DropDownList).SelectedItem.Value)
                            strValue = RewriteString(CType(E.Item.FindControl("txtRelation_Name"), TextBox).Text)
                            Dim intDirection As Integer = Integer.Parse(CType(E.Item.FindControl("ddlRelationDirection"), DropDownList).SelectedItem.Value)
                            If intDirection = DIRECTION_TO Then
                                strSQL = "SetRelation NULL," & strValue & "," & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & TABLE_SHAPE & "," & intValue & "," & ABSTRACTION_DEVICE & "," & LOGFUNCTION_SET_RELATION & "," & RewriteString(User.Identity.Name)
                            Else
                                strSQL = "SetRelation NULL," & strValue & "," & TABLE_SHAPE & "," & intValue & "," & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_DEVICE & "," & LOGFUNCTION_SET_RELATION & "," & RewriteString(User.Identity.Name)
                            End If
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

        Dim sqlconn As PLDbConnection = SMARTSConnectionOpen()
        DataBindControl(Source, sqlconn)
        sqlconn.Close()

        setFocus(Source, E)

    End Sub

    Public Sub ControlCancel(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        Dim sqlconn As PLDbConnection = SMARTSConnectionOpen()
        lblMessage.Visible = False
        Source.EditItemIndex = -1
        DataBindControl(Source, sqlconn)
        sqlconn.Close()

    End Sub

    Private Sub ToggleEditColumn(ByVal intValue As Integer)

        If intValue = LIFECYCLE_RETIRE Then
            grdName.Columns(0).Visible = False
            grdDescription.Columns(0).Visible = False
            grdAttribute.Columns(0).Visible = False
            grdArtifacts.Columns(0).Visible = False
            grdArtifacts.ShowFooter = False
            grdAddress.Columns(0).Visible = False
            grdAddress.ShowFooter = False
            grdRelations.Columns(0).Visible = False
            grdRelations.ShowFooter = False
            grdDeviceObject.Columns(0).Visible = False
            grdDeviceObject.ShowFooter = False
            grdContainDevice.Columns(0).Visible = False
            grdContainDevice.ShowFooter = False
        Else
            grdName.Columns(0).Visible = True
            grdDescription.Columns(0).Visible = True
            grdAttribute.Columns(0).Visible = True
            grdArtifacts.Columns(0).Visible = True
            grdArtifacts.ShowFooter = True
            grdAddress.Columns(0).Visible = True
            grdAddress.ShowFooter = True
            grdRelations.Columns(0).Visible = True
            grdRelations.ShowFooter = True
            grdDeviceObject.Columns(0).Visible = True
            grdDeviceObject.ShowFooter = True
            grdContainDevice.Columns(0).Visible = True
            grdContainDevice.ShowFooter = True
        End If

        grdContainedByDevice.Columns(0).Visible = False
        grdContainedByDevice.ShowFooter = False

    End Sub


    Private Sub SubmitToDB(ByVal strValue As String)

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Dim sqlCmd As PLDbCommand = New PLDbCommand("SetItem", sqlConn)
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
        sqlConn.Close()
        Dim strID As String = sqlCmd.Parameters("@NewID").Value.ToString()
        Response.Redirect("Device.aspx?type=" & ddlTypeList.SelectedItem.Value & "&id=" & strID, False)

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
                strValue = CType(E.Item.FindControl("txtDescription"), TextBox).Text
                strSQL = "SetItem_Desc " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_DESCRIPTION & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
            Case "grdName"
                strValue = CType(E.Item.FindControl("txtName"), TextBox).Text
                lblMessage.Visible = True
                If Len(Trim(strValue)) > EMPTY_INT Then
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
                'If Len(strValue) > EMPTY_INT Then
                '    '--- NON BLANK NAME ENTRY
                '    Dim booExists As Boolean = False
                '    For i As Integer = 0 To ddlList.Items.Count - 1
                '        If ddlList.SelectedIndex <> i And strValue.ToUpper = ddlList.Items(i).Text.ToUpper Then
                '            booExists = True
                '        End If
                '    Next
                '    If booExists = True Then
                '        '--- NAME ALREADY EXISTS
                '        lblMessage.Text = "Name already exists. Select another."
                '        Exit Sub
                '    Else
                '        If ddlList.SelectedIndex = EMPTY_INT Then
                '            lblMessage.Text = "Submitted."
                '            SubmitToDB(strValue)
                '            Exit Sub
                '        Else
                '            lblMessage.Text = "Revised."
                '            strSQL = "SetItem_Name " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_NAME & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
                '        End If
                '    End If
                'Else
                '    lblMessage.Text = "Name cannot be blank. Please re-enter"
                '    Exit Sub
                'End If
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

            'read results returned
            Try
                Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
                Try
                    DataBindControl(ddlIP, sqlConn)
                    DataBindControl(ddlTypeList, sqlConn)

                    If Len(CStr(Request.QueryString("id"))) > 0 Then
                        ddlTypeList.SelectedIndex = ddlTypeList.Items.IndexOf(ddlTypeList.Items.FindByValue(Request.QueryString("type")))
                        DataBindControl(ddlList, sqlConn)
                        ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByValue(Request.QueryString("id")))
                    Else
                        '--- DEFAULT SET DEVICE LIST TO SERVER
                        ddlTypeList.SelectedIndex = ddlTypeList.Items.IndexOf(ddlTypeList.Items.FindByValue(SHAPETYPE_SERVER))
                        DataBindControl(ddlList, sqlConn)
                        ddlList.SelectedIndex = 0
                    End If
                    DataBindPage(sqlConn)
                Catch ex As Exception
                    Response.Write(ex.Message)
                Finally
                    sqlConn.Close()
                End Try
            Catch ex As Exception
                Response.Write(ex.Message)
            End Try

        End If

    End Sub


    Public Sub DataBindDependentList(ByVal Sender As Object, ByVal E As System.EventArgs)

        'Get the Shape DropDown
        Dim sqlCmd As PLDbCommand
        Dim sqlTable As New DataTable
        Dim ddlShape As DropDownList
        Dim ddlType As DropDownList = CType(Sender, DropDownList)
        Dim intType As Integer = ddlType.SelectedItem.Value
        Dim item As DataGridItem = CType(ddlType.Parent.Parent, DataGridItem)
        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Select Case Sender.ID
            Case "ddlDeviceObjectSystem", "ddlDeviceObjectShapeType"
                ddlShape = CType(item.FindControl("ddlDeviceObjectShape"), DropDownList)
                If intType = EMPTY_INT Then
                    ddlShape.Items.Clear()
                Else
                    Dim drTemp As DataRow
                    Dim ddlSystem As DropDownList = CType(item.FindControl("ddlDeviceObjectSystem"), DropDownList)
                    Dim ddlShapeType As DropDownList = CType(item.FindControl("ddlDeviceObjectShapeType"), DropDownList)
                    sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlSystem.SelectedItem.Value & "," & ABSTRACTION_SYSTEMOBJECT, sqlConn)
                    sqlTable = sqlCmd.ExecuteDataTable
                    For Each drTemp In sqlTable.Rows
                        If CInt(drTemp.Item("Related_TypeID").ToString) <> ddlShapeType.SelectedItem.Value Then
                            drTemp.Delete()
                        End If
                    Next
                    ddlShape.DataSource = sqlTable
                    ddlShape.DataBind()
                End If
                grdDeviceObject.SelectedIndex = grdDeviceObject.Items.Count

            Case "ddlContainDeviceShapeType"

                ddlShape = CType(item.FindControl("ddlContainDeviceShape"), DropDownList)
                If intType = EMPTY_INT Then
                    ddlShape.Items.Clear()
                Else
                    Dim dsRow As DataRow
                    sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_DEVICE & "," & intType, sqlConn)
                    sqlTable = sqlCmd.ExecuteDataTable
                    Dim strSQL As String = ""
                    If sqlTable.Rows.Count > 0 Then
                        'SHAPES EXIST - FILTER OUT ANY SHAPES ON THE LIST THAT IS ALREADY CONTAINED BY ANOTHER 
                        For Each dsRow In sqlTable.Rows
                            'SHAPE CANNOT CONTAIN ITSELF
                            If ddlList.SelectedItem.Value = CInt(dsRow.Item("shape_id").ToString) Then
                                dsRow.Delete()
                            Else
                                strSQL = strSQL & "EXEC GetItem_Container " & CStr(TABLE_SHAPE) & "," & CStr(dsRow.Item("shape_id").ToString) & "," & CStr(ABSTRACTION_DEVICE) & "; "
                            End If
                        Next
                        sqlTable.AcceptChanges()
                        sqlCmd = New PLDbCommand(strSQL, sqlConn)
                        Dim sqlSet As New DataSet
                        Dim sqlAdapter As PLDbDataAdapter
                        sqlAdapter = New PLDbDataAdapter(sqlCmd)
                        sqlAdapter.Fill(sqlSet)
                        For i As Integer = 0 To sqlSet.Tables.Count - 1
                            If sqlSet.Tables(i).Rows.Count > 0 Then
                                sqlTable.Rows(i).Delete()
                            End If
                        Next
                        sqlTable.AcceptChanges()
                    End If
                    ddlShape.DataSource = sqlTable
                    ddlShape.DataBind()
                End If
                grdContainDevice.SelectedIndex = grdContainDevice.Items.Count

            Case "ddlContainedByDeviceShapeType"

                ddlShape = CType(item.FindControl("ddlContainedByDeviceShape"), DropDownList)
                If intType = EMPTY_INT Then
                    ddlShape.Items.Clear()
                Else
                    sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_DEVICE & "," & intType, sqlConn)
                    sqlTable = sqlCmd.ExecuteDataTable
                    ddlShape.DataSource = sqlTable
                    ddlShape.DataBind()
                End If
                'setFocus(Page.FindControl("grdContainedByDevice"))
                grdContainedByDevice.SelectedIndex = grdContainedByDevice.Items.Count

            Case "ddlRelationType"

                ddlShape = CType(item.FindControl("ddlRelationDevice"), DropDownList)
                If intType = EMPTY_INT Then
                    ddlShape.Items.Clear()
                Else
                    sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_DEVICE & "," & intType, sqlConn)
                    sqlTable = sqlCmd.ExecuteDataTable
                    ddlShape.DataSource = sqlTable
                    ddlShape.DataBind()
                End If
                grdRelations.SelectedIndex = grdRelations.Items.Count

        End Select

        sqlConn.Close()


    End Sub

    Private Sub ddlTypeList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlTypeList.SelectedIndexChanged

        Try
            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            Try
                DataBindControl(ddlList, sqlConn)
                ddlList.SelectedIndex = 0
                DataBindPage(sqlConn)
                grdName.EditItemIndex = -1
                grdDescription.EditItemIndex = -1
                grdAttribute.EditItemIndex = -1
            Catch ex As Exception
                Response.Write(ex.Message)
            Finally
                sqlConn.Close()
            End Try
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

    End Sub


    Private Sub ddlList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlList.SelectedIndexChanged

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        If ddlList.SelectedIndex = EMPTY_INT Then
            grdName.EditItemIndex = -1
            grdDescription.EditItemIndex = -1
            grdAttribute.EditItemIndex = -1
            DataBindPage(sqlConn)
            sqlConn.Close()
        Else
            sqlConn.Close()
            Response.Redirect("Device.aspx?type=" & ddlTypeList.SelectedItem.Value & "&id=" & ddlList.SelectedItem.Value, False)
        End If

    End Sub

    '--- GETS STA INFO : DESCRIPTION, CONSTRAINED VALUES, DEPENDENTS
    Public Sub DataBindPage(ByVal sqlConn As PLDbConnection)


        lblMessage.Visible = False
        DataBindControl(grdName, sqlConn)
        If ddlList.SelectedItem.Value = EMPTY_INT Then
            grdDescription.Visible = False
            grdLifecycle.Visible = False
            grdAttribute.Visible = False
            grdArtifacts.Visible = False
            grdRelations.Visible = False
            grdContainedByDevice.Visible = False
            grdContainDevice.Visible = False
            grdDeviceObject.Visible = False
            grdAddress.Visible = False
            urlHistory.Visible = False
            urlBrowseThis.Visible = False
        Else
            urlHistory.NavigateUrl = "history.aspx?page=device.aspx&id=" & Request.QueryString("id") & "&type=" & Request.QueryString("type")
            urlBrowseThis.NavigateUrl = "../SMARTSBROWSER/device.aspx?id=" & Request.QueryString("id") & "&type=" & Request.QueryString("type")

            If grdName.Items.Count = EMPTY_INT Then
                'GOT NOTHING BACK, GET LIST OF LATEST
                DataBindControl(ddlList, sqlConn)
                DataBindPage(sqlConn)
                lblMessage.Text = "Selection is unavailable. Please select another."
                lblMessage.Visible = True
            Else

                DataBindControl(grdDescription, sqlConn)
                grdDescription.Visible = True
                DataBindControl(grdLifecycle, sqlConn)
                grdLifecycle.Visible = True
                DataBindControl(grdAddress, sqlConn)
                grdAddress.Visible = True
                DataBindControl(grdAttribute, sqlConn)
                grdAttribute.Visible = True
                DataBindControl(grdArtifacts, sqlConn)
                grdArtifacts.Visible = True
                DataBindControl(grdRelations, sqlConn)
                grdRelations.Visible = True
                DataBindControl(grdContainDevice, sqlConn)
                grdContainDevice.Visible = True
                DataBindControl(grdDeviceObject, sqlConn)
                grdDeviceObject.Visible = True
                DataBindControl(grdContainedByDevice, sqlConn)
                grdContainedByDevice.Visible = True

                '--- TOGGLE THE EDIT COLUMNS DEPENDING ON LIFECYCLE STATE
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
                    Case "grdDeviceObject"
                        Dim ddlData As DropDownList = CType(E.Item.FindControl("ddlDeviceObjectSystem"), DropDownList)
                        strSQL = "EXEC GetShapeList " & ABSTRACTION_SYSTEM & "," & SHAPETYPE_SYSTEM
                        sqlCmd = New PLDbCommand(strSQL, sqlConn)
                        sqlTable = sqlCmd.ExecuteDataTable()
                        ddldata.DataSource = sqlTable
                        ddldata.DataBind()
                        Dim ddlData2 As DropDownList = CType(E.Item.FindControl("ddlDeviceObjectShapeType"), DropDownList)
                        strSQL = "EXEC GetShapeTypeList " & ABSTRACTION_OBJECT
                        sqlCmd = New PLDbCommand(strSQL, sqlConn)
                        sqlTable = sqlCmd.ExecuteDataTable()
                        ddlData2.DataSource = sqlTable
                        ddlData2.DataBind()
                        ddlData.Items.Insert(0, CreateListItem("SELECT"))
                        ddlData2.Items.Insert(0, CreateListItem("SELECT"))
                    Case "grdContainDevice"
                        Dim ddlData As DropDownList = CType(E.Item.FindControl("ddlContainDeviceShapeType"), DropDownList)
                        sqlCmd = New PLDbCommand("GetShapeTypeList " & ABSTRACTION_DEVICE, sqlConn)
                        sqlTable = sqlCmd.ExecuteDataTable()
                        If sqlTable.Rows.Count > 0 Then
                            ddlData.DataSource = sqlTable
                            ddlData.DataBind()
                        End If
                        ddlData.Items.Insert(0, CreateListItem("SELECT"))
                    Case "grdContainedByDevice"
                        Dim ddlData As DropDownList = CType(E.Item.FindControl("ddlContainedByDeviceShapeType"), DropDownList)
                        sqlCmd = New PLDbCommand("GetShapeTypeList " & ABSTRACTION_DEVICE, sqlConn)
                        sqlTable = sqlCmd.ExecuteDataTable()
                        If sqlTable.Rows.Count > 0 Then
                            ddlData.DataSource = sqlTable
                            ddlData.DataBind()
                        End If
                        ddlData.Items.Insert(0, CreateListItem("SELECT"))
                    Case "grdRelations"
                        Dim ddlData As DropDownList = CType(E.Item.FindControl("ddlRelationType"), DropDownList)
                        sqlCmd = New PLDbCommand("GetShapeTypeList " & ABSTRACTION_DEVICE, sqlConn)
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
                        If (grdRelations.Items.Count > 0) Then
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
