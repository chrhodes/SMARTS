Imports PacificLife.Life.Enterprise.Data

Public Class Artifact
    Inherits BaseClass

    Protected WithEvents lblPage As System.Web.UI.WebControls.Label
    Protected WithEvents grdNote As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdContact As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdLocation As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdName As System.Web.UI.WebControls.DataGrid
    Protected WithEvents lblArtifactAbstraction As System.Web.UI.WebControls.Label
    Protected WithEvents urlPrevious As System.Web.UI.WebControls.HyperLink
    Protected WithEvents grdDescription As System.Web.UI.WebControls.DataGrid
    Protected WithEvents ddlList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents lblArtifactID As System.Web.UI.WebControls.Label
    Protected WithEvents btnSubmit As System.Web.UI.WebControls.Button

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


    Public Sub DeleteArtifact(ByVal sender As Object, ByVal e As EventArgs)

        Dim lblLoc As Label = CType(grdLocation.Items.Item(0).FindControl("lblLocation"), Label)

        Dim strSQL As String = "DeleteArtifact " & TABLE_ARTIFACT & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_DELETE_ARTIFACT & "," & RewriteString(CStr(ddlList.SelectedItem.Text)) & "," & RewriteString(CStr(lblLoc.Text)) & "," & RewriteString(User.Identity.Name)
        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)

        sqlCmd.ExecuteNonQuery()

        DataBindControl(ddlList, sqlConn)
        ddlList.SelectedIndex = 0
        DataBindPage(sqlConn)

        sqlConn.Close()

    End Sub


    Protected Sub DataBindControl(ByVal Source As Object, ByVal sqlConn As PLDbConnection)

        Dim sqlCmd As PLDbCommand
        Dim sqlTable As New DataTable

        Select Case Source.ID
            Case "grdName", "grdDescription", "grdNote", "grdLocation", "grdContact"
                If ddlList.SelectedItem.Value = EMPTY_INT Then
                    sqlTable = CreateDataTable()
                Else
                    sqlCmd = New PLDbCommand("GetItem " & TABLE_ARTIFACT & "," & ddlList.SelectedItem.Value, sqlConn)
                    sqlTable = sqlCmd.ExecuteDataTable
                End If
            Case "ddlList"
                sqlCmd = New PLDbCommand("GetArtifactList", sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
        End Select

        Source.DataSource = sqlTable
        Source.DataBind()

        If Source.ID = "ddlList" And Request.QueryString("func") <> FUNC_DELETE Then
            ddlList.Items.Insert(0, CreateListItem("CREATE NEW ARTIFACT"))
        End If

        Source.SelectedIndex = Source.Items.Count - 1

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

        Source.EditItemIndex = -1
        DataBindControl(Source, sqlConn)

        sqlConn.Close()

    End Sub


    Public Sub ControlUpdate(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)


        Dim sqlCmd As PLDbCommand
        Dim strSQL As String
        Dim intItemSelected As Integer
        Dim intValue As Integer
        Dim strValue As String
        Dim strID As String

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Select Case Source.ID
            Case "grdName"
                strValue = CType(E.Item.FindControl("txtName"), TextBox).Text
                If ddlList.SelectedIndex = EMPTY_INT Then
                    sqlCmd = New PLDbCommand("SetArtifact ", sqlConn)
                    sqlCmd.CommandType = CommandType.StoredProcedure
                    sqlCmd.AddParameter("@Table", SqlDbType.Int, 0).Value = TABLE_ARTIFACT
                    sqlCmd.AddParameter("@ID", SqlDbType.Int, 0).Value = ddlList.SelectedIndex
                    sqlCmd.AddParameter("@Function", SqlDbType.Int, 0).Value = LOGFUNCTION_SET_ARTIFACT
                    sqlCmd.AddParameter("@Name", SqlDbType.VarChar, 100).Value = Trim(Replace(CStr(strValue), "'", "''"))
                    sqlCmd.AddParameter("@Contact", SqlDbType.VarChar, 1000).Value = Trim(Replace(CStr(User.Identity.Name), "'", "''"))
                    sqlCmd.AddParameter("@NewID", SqlDbType.Int, 0).Direction = ParameterDirection.Output
                    sqlCmd.ExecuteNonQuery()
                    strID = sqlCmd.Parameters("@NewID").Value.ToString()
                    sqlCmd = Nothing
                    sqlConn.Close()
                    Response.Redirect("artifact.aspx?id=" & Request.QueryString("id") & "&type=" & Request.QueryString("type") & "&artifact=" & strID, False)
                    Exit Sub
                Else
                    intItemSelected = ddlList.SelectedItem.Value
                    strSQL = "SetArtifact_Name " & TABLE_ARTIFACT & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_NAME & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
                End If
            Case "grdDescription"
                strValue = CType(E.Item.FindControl("txtDescription"), TextBox).Text
                strSQL = "SetArtifact_Desc " & TABLE_ARTIFACT & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_DESCRIPTION & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
            Case "grdLocation"
                strValue = CType(E.Item.FindControl("txtLocation"), TextBox).Text
                strSQL = "SetArtifact_Loc " & TABLE_ARTIFACT & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_LOCATION & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
            Case "grdContact"
                strValue = CType(E.Item.FindControl("txtContact"), TextBox).Text
                strSQL = "SetArtifact_Contact " & TABLE_ARTIFACT & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_CONTACT & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
            Case "grdNote"
                strValue = CType(E.Item.FindControl("txtNote"), TextBox).Text
                strSQL = "SetArtifact_Note " & TABLE_ARTIFACT & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_NOTE & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
        End Select

        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

        Source.EditItemIndex = -1
        DataBindControl(Source, sqlConn)
        If Source.ID = "grdName" Then
            DataBindControl(ddlList, sqlConn)
            ddlList.SelectedValue = intItemSelected
        End If

        sqlConn.Close()

    End Sub


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        SetScroll()

        If Page.IsPostBack Then

            SaveScroll()

        Else

            'read results returned
            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            DataBindControl(ddlList, sqlConn)
            If CInt(Request.QueryString("artifact")) > 0 Then
                ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByValue(Request.QueryString("artifact")))
            Else
                ddlList.SelectedIndex = 0
            End If
            DataBindPage(sqlConn)
            If Len(CStr(Request.QueryString("id"))) > 0 Then
                Select Case lblArtifactAbstraction.Text
                    Case ABSTRACTION_DEVICE
                        urlPrevious.NavigateUrl = "Device.aspx?id=" & CStr(Request.QueryString("id")) & "&type=" & CStr(Request.QueryString("type"))
                        urlPrevious.Text = "Return to Device"
                    Case ABSTRACTION_OBJECT
                        urlPrevious.NavigateUrl = "Object.aspx?id=" & CStr(Request.QueryString("id")) & "&type=" & CStr(Request.QueryString("type"))
                        urlPrevious.Text = "Return to Object"
                    Case ABSTRACTION_SYSTEM
                        urlPrevious.NavigateUrl = "Sys.aspx?id=" & CStr(Request.QueryString("id")) & "&type=" & CStr(Request.QueryString("type"))
                        urlPrevious.Text = "Return to System"
                    Case ABSTRACTION_BUSINESS
                        urlPrevious.NavigateUrl = "BusinessProcess.aspx?id=" & CStr(Request.QueryString("id")) & "&type=" & CStr(Request.QueryString("type"))
                        urlPrevious.Text = "Return to Business Process"
                    Case ABSTRACTION_STEP
                        urlPrevious.NavigateUrl = "Step.aspx?id=" & CStr(Request.QueryString("id")) & "&type=" & CStr(Request.QueryString("type"))
                        urlPrevious.Text = "Return to Process Step"
                End Select
                urlPrevious.Visible = True
                ddlList.Visible = False
                If CInt(Request.QueryString("artifact")) > 0 Then
                    lblPage.Text = "View Artifact"
                Else
                    lblPage.Text = "Create Artifact"
                End If
            Else
                '**** COMING FROM Default.aspx
                Select Case Request.QueryString("func")
                    Case FUNC_CREATE
                        lblPage.Text = "Create Artifact"
                    Case FUNC_UPDATE
                        lblPage.Text = "Update Artifact"
                    Case FUNC_DELETE
                        lblPage.Text = "Delete Artifact"
                End Select
                urlPrevious.Visible = False
            End If
            If Request.QueryString("func") = FUNC_DELETE Then
                btnSubmit.Visible = True
                grdName.Columns(0).Visible = False
                grdLocation.Columns(0).Visible = False
                grdContact.Columns(0).Visible = False
                grdNote.Columns(0).Visible = False
                grdDescription.Columns(0).Visible = False
            Else
                btnSubmit.Visible = False
            End If

            sqlConn.Close()


        End If

    End Sub

    Private Sub ddlList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlList.SelectedIndexChanged

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        DataBindPage(sqlConn)
        grdName.EditItemIndex = -1
        grdDescription.EditItemIndex = -1

        sqlConn.Close()

    End Sub


    Private Function CreateDataTable() As DataTable

        Dim dtTable As DataTable = New DataTable("Data")
        dtTable.Columns.Add(New DataColumn("Artifact_ID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("Artifact_Name", GetType(String)))
        dtTable.AcceptChanges()
        Dim dtRow As DataRow = dtTable.NewRow
        dtRow("Artifact_ID") = EMPTY_INT
        dtRow("Artifact_Name") = ""
        dtTable.Rows.Add(dtRow)
        dtTable.AcceptChanges()

        Return dtTable

    End Function


    '--- GETS STA INFO : DESCRIPTION, CONSTRAINED VALUES, DEPENDENTS
    Public Sub DataBindPage(ByVal sqlConn As PLDbConnection)

        Dim sqlCmd As PLDbCommand
        Dim sqlTable As New DataTable
        Dim strSQL As String
        Dim i As Integer

        If ddlList.SelectedIndex = EMPTY_INT And Request.QueryString("func") <> FUNC_DELETE Then
            DataBindControl(grdName, sqlConn)
        Else
            DataBindControl(grdName, sqlConn)
            DataBindControl(grdDescription, sqlConn)
            DataBindControl(grdLocation, sqlConn)
            DataBindControl(grdNote, sqlConn)
            DataBindControl(grdContact, sqlConn)
        End If

        If Len(CStr(Request.QueryString("type"))) > 0 Then
            strSQL = "EXEC GetItem_Abstraction " & TABLE_SHAPETYPE & "," & Request.QueryString("type")
            sqlCmd = New PLDbCommand(strSQL, sqlConn)
            sqlTable = sqlCmd.ExecuteDataTable
            If sqlTable.Rows.Count > 0 Then
                lblArtifactAbstraction.Text = CInt(sqlTable.Rows(0).Item("Abstraction_ID").ToString)
            End If
        End If


        If ddlList.SelectedItem.Value = EMPTY_INT Then
            grdDescription.Visible = False
            grdLocation.Visible = False
            grdContact.Visible = False
            grdNote.Visible = False
        Else
            grdDescription.Visible = True
            grdLocation.Visible = True
            grdContact.Visible = True
            grdNote.Visible = True
        End If

    End Sub




End Class
