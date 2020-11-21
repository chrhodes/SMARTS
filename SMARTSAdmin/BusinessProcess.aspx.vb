Imports PacificLife.Life.Enterprise.Data

Public Class BusinessProcess

    Inherits BaseClass

    Protected WithEvents ddlList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents grdAttribute As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdDescription As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdName As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdSteps As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdArtifacts As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdRelations As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdLifecycle As System.Web.UI.WebControls.DataGrid
    Protected WithEvents lblMessage As System.Web.UI.WebControls.Label
    Protected WithEvents urlHistory As System.Web.UI.WebControls.HyperLink
    Protected WithEvents urlBrowseThis As System.Web.UI.WebControls.HyperLink


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


    Private Sub ToggleEditColumn(ByVal intValue As Integer)

        If intValue = LIFECYCLE_RETIRE Then
            grdName.Columns(0).Visible = False
            grdDescription.Columns(0).Visible = False
            grdAttribute.Columns(0).Visible = False
            grdArtifacts.Columns(0).Visible = False
            grdArtifacts.ShowFooter = False
        Else
            grdName.Columns(0).Visible = True
            grdDescription.Columns(0).Visible = True
            grdAttribute.Columns(0).Visible = True
            grdArtifacts.Columns(0).Visible = True
            grdArtifacts.ShowFooter = True
        End If
    End Sub

    Protected Sub DataBindControl(ByVal Source As Object, ByVal sqlConn As PLDbConnection)

        Dim sqlCmd As PLDbCommand
        Dim sqlTable As New DataTable


        Select Case Source.ID
            Case "grdName", "ctrlName"
                If ddlList.SelectedIndex = EMPTY_INT Then
                    sqlTable = CreateDataTable()
                Else
                    sqlCmd = New PLDbCommand("GetItem " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value, sqlConn)
                    sqlTable = sqlCmd.ExecuteDataTable
                End If
            Case "ddlList"
                sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_BUSINESS & ",NULL", sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
            Case "grdDescription", "grdLifecycle"
                sqlCmd = New PLDbCommand("GetItem " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
            Case "grdAttribute"
                sqlCmd = New PLDbCommand("GetItem_AttributeValue " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & ",NULL", sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
            Case "grdArtifacts"
                sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_ARTIFACT, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
            Case "grdSteps"
                sqlCmd = New PLDbCommand("GetItem_Contained " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_BUSINESSSTEP, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
            Case "grdRelations"
                sqlCmd = New PLDbCommand("GetItem_Relation NULL," & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_BUSINESS, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
        End Select

        Source.DataSource = sqlTable
        Source.DataBind()

        Select Case Source.ID
            Case "ddlList"
                ddlList.Items.Insert(0, CreateListItem("CREATE NEW BUSINESS PROCESS"))
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

        Source.SelectedIndex = Source.Items.Count - 1

    End Sub

    Public Sub ControlDeleteCommand(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        If E.CommandName = "Delete" Then

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

            '--- PROPAGATE ARTIFACT DELETION TO THE STEPS OF THIS BUSINESS PROCESS TOO
            Dim strSQL As String = "GetItem_Contained " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_BUSINESSSTEP
            Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
            Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable
            Dim sqlRow As DataRow
            strSQL = "EXEC DeleteItem_Artifact " & CInt(CType(E.Item.FindControl("lblArtifactID"), Label).Text) & "," & TABLE_SHAPE & "," & CInt(ddlList.SelectedItem.Value) & "," & LOGFUNCTION_DELETE_CONTAINER & "," & RewriteString(User.Identity.Name) & "; "
            For Each sqlRow In sqlTable.Rows
                strSQL = strSQL & "EXEC DeleteItem_Artifact " & CInt(CType(E.Item.FindControl("lblArtifactID"), Label).Text) & "," & CInt(sqlRow.Item("Related_TableID").ToString) & "," & CInt(sqlRow.Item("Related_ID").ToString) & "," & LOGFUNCTION_DELETE_CONTAINER & "," & RewriteString(User.Identity.Name) & "; "
            Next

            sqlCmd = New PLDbCommand(strSQL, sqlConn)
            sqlCmd.ExecuteNonQuery()

            DataBindControl(Source, sqlConn)

            sqlConn.Close()


        End If

    End Sub

    Public Sub ControlItemCommand(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)


        If E.CommandName = "Insert" Then

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            Dim strSQL As String
            Dim intValue As Integer
            Dim sqlCmd As PLDbCommand

            Select Case Source.ID
                Case "grdArtifacts"
                    intValue = Integer.Parse(CType(E.Item.FindControl("ddlArtifacts"), DropDownList).SelectedItem.Value)
                    If intValue = EMPTY_INT Then
                        sqlConn.Close()
                        Response.Redirect("artifact.aspx?id=" & ddlList.SelectedItem.Value & "&type=" & SHAPETYPE_BUSINESS & "&artifact=" & EMPTY_INT)
                        Exit Sub
                    Else
                        '--- IF ARTIFACT IS NOT ALREADY ADDED, ADD IT
                        If booSetArtifact(sqlConn, ddlList.SelectedItem.Value, intValue) = True Then
                            DataBindControl(Source, sqlConn)
                            '--- ADD ARTIFACT TO ALL ITS CONTAINED ITEMS TOO
                            strSQL = "GetItem_Contained " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & ABSTRACTION_BUSINESSSTEP
                            sqlCmd = New PLDbCommand(strSQL, sqlConn)
                            Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable
                            For i As Integer = 0 To sqlTable.Rows.Count - 1
                                booSetArtifact(sqlConn, sqlTable.Rows(i).Item("Related_ID"), intValue)
                            Next
                        End If
                    End If
                Case "grdLifecycle"
                    subSetLifecycle(sqlConn, ddlList.SelectedItem.Value, E)
                    DataBindControl(Source, sqlConn)
            End Select

            sqlConn.Close()

        End If


    End Sub

    Public Sub ControlEdit(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        Source.EditItemIndex = E.Item.ItemIndex
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


    'Public Sub ControlUpdate(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

    '    Dim strSQL As String
    '    Dim strValue As String

    '    Select Case Source.ID
    '        Case "grdLifecycle"
    '            Dim ddlValues As DropDownList = CType(E.Item.FindControl("ddlLifecycle"), DropDownList)
    '            Dim intValue As Integer = CInt(ddlValues.SelectedItem.Value)
    '            strSQL = "SetItem_Lifecycle " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_LIFECYCLE & "," & intValue & "," & RewriteString(User.Identity.Name)
    '            ToggleEditColumn(intValue)
    '        Case "grdAttribute"
    '            Dim intSTA_ID As Integer = Integer.Parse(CType(E.Item.FindControl("lblSTA_ID"), Label).Text)
    '            Dim ddlValues As DropDownList = CType(E.Item.FindControl("ddlAttributeValue"), DropDownList)
    '            If ddlValues.Items.Count > 0 Then
    '                strValue = RewriteString(CStr(ddlValues.SelectedItem.Text))
    '            Else
    '                strValue = RewriteString(CType(E.Item.FindControl("txtAttributeValue"), TextBox).Text)
    '            End If
    '            strSQL = "SetAttributeValue " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & intSTA_ID & "," & strValue & "," & LOGFUNCTION_SET_ATTRIBUTEVALUE & "," & RewriteString(User.Identity.Name)
    '        Case "grdDescription"
    '            strValue = CType(E.Item.FindControl("txtDescription"), TextBox).Text
    '            strSQL = "SetItem_Desc " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_DESCRIPTION & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
    '        Case "grdName"
    '            lblMessage.Visible = True
    '            strValue = Trim(CType(E.Item.FindControl("txtName"), TextBox).Text)
    '            If Len(Trim(strValue)) > EMPTY_INT Then
    '                '--- NON BLANK NAME ENTRY
    '                Dim booExists As Boolean = False
    '                For i As Integer = 0 To ddlList.Items.Count - 1
    '                    If ddlList.SelectedIndex <> i And strValue.ToUpper = ddlList.Items(i).Text.ToUpper Then
    '                        booExists = True
    '                    End If
    '                Next
    '                If booExists = True Then
    '                    '--- NAME ALREADY EXISTS
    '                    lblMessage.Text = "Name already exists. Select another."
    '                    Exit Sub
    '                Else
    '                    If ddlList.SelectedIndex = EMPTY_INT Then
    '                        lblMessage.Text = "Submitted."
    '                        SubmitToDB(strValue)
    '                        Exit Sub
    '                    Else
    '                        lblMessage.Text = "Revised."
    '                        strSQL = "SetItem_Name " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_NAME & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
    '                    End If
    '                End If
    '            Else
    '                lblMessage.Text = "Name cannot be blank. Please re-enter"
    '                Exit Sub
    '            End If
    '    End Select


    '    Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
    '    Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
    '    sqlCmd.ExecuteNonQuery()

    '    Source.EditItemIndex = -1
    '    DataBindControl(Source, sqlConn)

    '    If Source.ID = "grdDescription" Or Source.ID = "grdName" Then
    '        DataBindControl(grdSteps, sqlConn)
    '        DataBindControl(grdRelations, sqlConn)
    '        If Source.ID = "grdName" Then
    '            DataBindControl(ddlList, sqlConn)
    '            ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByText(strValue))
    '        End If
    '    End If

    '    sqlConn.Close()

    'End Sub


    Public Sub ControlUpdate(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        Dim strSQL As String
        Dim strValue As String
        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Dim sqlCmd As PLDbCommand

        Select Case Source.ID
            Case "grdLifecycle"
                Dim ddlValues As DropDownList = CType(E.Item.FindControl("ddlLifecycle"), DropDownList)
                Dim intValue As Integer = CInt(ddlValues.SelectedItem.Value)
                strSQL = "SetItem_Lifecycle " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_LIFECYCLE & "," & intValue & "," & RewriteString(User.Identity.Name)
                ToggleEditColumn(intValue)
                sqlCmd = New PLDbCommand(strSQL, sqlConn)
                sqlCmd.ExecuteNonQuery()
                Source.EditItemIndex = -1
                DataBindControl(Source, sqlConn)
            Case "grdAttribute"
                Dim intSTA_ID As Integer = Integer.Parse(CType(E.Item.FindControl("lblSTA_ID"), Label).Text)
                Dim ddlValues As DropDownList = CType(E.Item.FindControl("ddlAttributeValue"), DropDownList)
                If ddlValues.Items.Count > 0 Then
                    strValue = RewriteString(CStr(ddlValues.SelectedItem.Text))
                Else
                    strValue = RewriteString(CType(E.Item.FindControl("txtAttributeValue"), TextBox).Text)
                End If
                strSQL = "SetAttributeValue " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & intSTA_ID & "," & strValue & "," & LOGFUNCTION_SET_ATTRIBUTEVALUE & "," & RewriteString(User.Identity.Name)
                sqlCmd = New PLDbCommand(strSQL, sqlConn)
                sqlCmd.ExecuteNonQuery()
            Case "grdDescription"
                strValue = CType(E.Item.FindControl("txtDescription"), TextBox).Text
                strSQL = "SetItem_Desc " & TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_DESCRIPTION & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
                sqlCmd = New PLDbCommand(strSQL, sqlConn)
                sqlCmd.ExecuteNonQuery()
                DataBindControl(grdSteps, sqlConn)
                DataBindControl(grdRelations, sqlConn)
            Case "grdName"
                lblMessage.Visible = True
                strValue = Trim(CType(E.Item.FindControl("txtName"), TextBox).Text)
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
                sqlCmd = New PLDbCommand(strSQL, sqlConn)
                sqlCmd.ExecuteNonQuery()
                DataBindControl(grdSteps, sqlConn)
                DataBindControl(grdRelations, sqlConn)
                DataBindControl(ddlList, sqlConn)
                ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByText(strValue))
        End Select

        sqlConn.Close()

    End Sub

    Public Sub SubmitToDB(ByVal strName As String)

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        Dim sqlCmd As PLDbCommand = New PLDbCommand("SetItem", sqlConn)
        With sqlCmd
            .CommandType = CommandType.StoredProcedure
            .AddParameter("@Table", SqlDbType.Int, 0).Value = TABLE_SHAPE
            .AddParameter("@ShapeType", SqlDbType.Int, 0).Value = SHAPETYPE_BUSINESS
            .AddParameter("@Lifecycle", SqlDbType.Int, 0).Value = LIFECYCLE_CURRENT
            .AddParameter("@Function", SqlDbType.Int, 0).Value = LOGFUNCTION_SET_SHAPE
            .AddParameter("@Value", SqlDbType.VarChar, 100).Value = Trim(Replace(CStr(strName), "'", "''"))
            .AddParameter("@Contact", SqlDbType.VarChar, 100).Value = Trim(Replace(CStr(User.Identity.Name), "'", "''"))
            .AddParameter("@NewID", SqlDbType.Int, 0).Direction = ParameterDirection.Output
            .ExecuteNonQuery()
        End With

        sqlConn.Close()
        Response.Redirect("businessprocess.aspx?id=" & sqlCmd.Parameters("@NewID").Value.ToString() & "&type=" & CStr(SHAPETYPE_BUSINESS))

    End Sub



    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        SaveScroll()

        If Page.IsPostBack Then

            SetScroll()

        Else

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

            'read results returned
            DataBindControl(ddlList, sqlConn)
            If Len(CStr(Request.QueryString("id"))) > 0 Then
                ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByValue(Request.QueryString("id")))
            Else
                ddlList.SelectedIndex = 0
            End If
            DataBindPage(sqlConn)

            sqlConn.Close()

        End If

    End Sub


    Private Sub ddlList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlList.SelectedIndexChanged

        Response.Redirect("businessprocess.aspx?id=" & ddlList.SelectedItem.Value & "&type=" & CStr(SHAPETYPE_BUSINESS))

    End Sub


    Private Function CreateDataTable() As DataTable

        Dim sqlTable As DataTable = New DataTable("Data")

        sqlTable.Columns.Add(New DataColumn("Shape_ID", GetType(Integer)))
        sqlTable.Columns.Add(New DataColumn("Shape_Name", GetType(String)))
        sqlTable.AcceptChanges()
        Dim dtRow As DataRow = sqlTable.NewRow
        dtRow("Shape_ID") = EMPTY_INT
        dtRow("Shape_Name") = ""
        sqlTable.Rows.Add(dtRow)
        sqlTable.AcceptChanges()

        Return sqlTable

    End Function


    '--- GETS STA INFO : DESCRIPTION, CONSTRAINED VALUES, DEPENDENTS
    Protected Sub DataBindPage(ByVal sqlConn As PLDbConnection)

        lblMessage.Visible = False

        DataBindControl(grdName, sqlConn)
        If ddlList.SelectedIndex = EMPTY_INT Then
            grdDescription.Visible = False
            grdLifecycle.Visible = False
            grdAttribute.Visible = False
            grdArtifacts.Visible = False
            grdSteps.Visible = False
            grdRelations.Visible = False
            urlHistory.Visible = False
            urlBrowseThis.Visible = False
        Else

            urlHistory.NavigateUrl = "history.aspx?page=businessprocess.aspx&id=" & Request.QueryString("id") & "&type=" & Request.QueryString("type")
            urlBrowseThis.NavigateUrl = "../SMARTSBROWSER/businessprocess.aspx?id=" & Request.QueryString("id") & "&type=" & Request.QueryString("type")

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
                DataBindControl(grdSteps, sqlConn)
                grdSteps.Visible = True
                DataBindControl(grdRelations, sqlConn)
                grdRelations.Visible = True

                Dim lblLifecycle As Label = CType(grdLifecycle.Items.Item(0).FindControl("lblLifecycle_ID"), Label)
                ToggleEditColumn(CInt(lblLifecycle.Text))

            End If

        End If

    End Sub


    Public Sub ControlItemDataBound(ByVal Source As Object, ByVal E As DataGridItemEventArgs)

        Dim typItem As ListItemType = E.Item.ItemType
        Dim sqlTable As New DataTable
        Dim sqlReader As PLDbDataReader
        Dim strSQL As String

        Dim sqlCmd As PLDbCommand
        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        Select Case typItem
            Case ListItemType.Footer
                Select Case Source.id
                    Case "grdArtifacts"
                        Dim ddlData As DropDownList = CType(E.Item.FindControl("ddlArtifacts"), DropDownList)
                        ddlData = GetArtifacts(ddlData, sqlConn)
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
                        If grdRelations.Items.Count > 0 Or grdSteps.Items.Count Then
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
