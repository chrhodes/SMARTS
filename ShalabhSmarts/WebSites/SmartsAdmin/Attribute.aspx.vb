Imports PacificLife.Life.Enterprise.Data
Imports System.Data
Imports SMARTSCommon.CommonClass

Public Class Attribute
    Inherits BaseClass

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    'Protected WithEvents lblLog As System.Web.UI.WebControls.Label
    'Protected WithEvents lblPage As System.Web.UI.WebControls.Label

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    'Protected WithEvents btnSubmit As System.Web.UI.WebControls.Button
    'Protected WithEvents ddlList As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents grdName As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdDependents As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents txtLog As System.Web.UI.WebControls.TextBox
    'Protected WithEvents lblMessage As System.Web.UI.WebControls.Label

    Protected Sub DataBindControl(ByVal Source As Object, ByVal sqlConn As PLDbConnection)

        Dim sqlCmd As PLDbCommand
        Dim sqlTable As New DataTable

        Select Case Source.ID
            Case "grdName"
                If ddlList.SelectedIndex = EMPTY_INT Then
                    sqlTable = CreateDataTable()
                Else
                    sqlCmd = New PLDbCommand("GetItem " & TABLE_ATTRIBUTE & "," & ddlList.SelectedItem.Value, sqlConn)
                    sqlTable = sqlCmd.ExecuteDataTable
                End If
            Case "ddlList"
                sqlCmd = New PLDbCommand("GetAttributeList ", sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
            Case "grdDependents"
                sqlCmd = New PLDbCommand("GetShapeTypeAttributeList " & EMPTY_INT & "," & ddlList.SelectedItem.Value, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
                Dim DR As DataRow
                For Each DR In sqlTable.Rows
                    If DR("ShapeTypeAttribute_ID") Is DBNull.Value Then
                        DR.Delete()
                    End If
                Next
        End Select

        Source.DataSource = sqlTable
        Source.DataBind()

        If Request.QueryString("func") <> FUNC_DELETE Then
            Select Case Source.ID
                Case "ddlList"
                    ddlList.Items.Insert(0, CreateListItem("CREATE NEW ATTRIBUTE"))
            End Select
        End If

        Source.SelectedIndex = Source.Items.Count - 1

        If Request.QueryString("func") = FUNC_DELETE And grdDependents.Items.Count = 0 Then
            btnSubmit.Visible = True
            txtLog.Visible = True
        Else
            btnSubmit.Visible = False
            txtLog.Visible = False
        End If

    End Sub


    Public Sub DeleteItem(ByVal sender As Object, ByVal e As EventArgs)

        If Trim(txtLog.Text.Length) > EMPTY_INT Then

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            Dim strSQL As String = "DeleteAttribute " & TABLE_ATTRIBUTE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_DELETE_ATTRIBUTE & "," & RewriteString(ddlList.SelectedItem.Text) & "," & RewriteString(txtLog.Text) & "," & RewriteString(User.Identity.Name)
            Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
            sqlCmd.ExecuteNonQuery()

            txtLog.Text = ""
            DataBindControl(ddlList, sqlConn)
            DataBindPage(sqlConn)
            lblMessage.Visible = False

            sqlConn.Close()

        Else
            lblMessage.Text = "Enter reason for deletion."
            lblMessage.Visible = True
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


    Public Sub ControlUpdate(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        Dim strSQL As String

        Dim strValue As String = Trim(CType(E.Item.FindControl("txtName"), TextBox).Text)
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
                    strSQL = "SetAttribute_Name " & TABLE_ATTRIBUTE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_NAME & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
                End If
            End If
        Else
            lblMessage.Text = "Name cannot be blank. Please re-enter"
            Exit Sub
        End If

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

        Source.EditItemIndex = -1
        DataBindControl(Source, sqlConn)
        If Source.ID = "grdName" Then
            DataBindControl(ddlList, sqlConn)
            ddlList.SelectedValue = ddlList.Items.IndexOf(ddlList.Items.FindByText(strValue))
            DataBindControl(grdDependents, sqlConn)
        End If

        sqlConn.Close()

    End Sub

    Private Sub SubmitToDB(ByVal strValue As String)

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Dim sqlCmd As PLDbCommand = New PLDbCommand("SetAttribute", sqlConn)
        sqlCmd.CommandType = CommandType.StoredProcedure
        sqlCmd.AddParameter("@Table", SqlDbType.Int, 0).Value = TABLE_ATTRIBUTE
        sqlCmd.AddParameter("@Function", SqlDbType.Int, 0).Value = LOGFUNCTION_SET_ATTRIBUTE
        sqlCmd.AddParameter("@Value", SqlDbType.VarChar, 100).Value = Trim(Replace(CStr(strValue), "'", "''"))
        sqlCmd.AddParameter("@Contact", SqlDbType.VarChar, 100).Value = Trim(Replace(CStr(User.Identity.Name), "'", "''"))
        sqlCmd.AddParameter("@NewID", SqlDbType.Int, 0).Direction = ParameterDirection.Output
        sqlCmd.ExecuteNonQuery()
        sqlConn.Close()
        lblMessage.Visible = False
        Response.Redirect("attribute.aspx?id=" & sqlCmd.Parameters("@NewID").Value.ToString() & "&func=" & Request.QueryString("func"), False)

    End Sub

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        SetScroll()

        If Page.IsPostBack Then

            SaveScroll()

        Else

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

            'read results returned
            If Request.QueryString("func") = FUNC_DELETE Then
                lblPage.Text = "Delete Attribute"
            Else
                lblPage.Text = "Create Attribute"
            End If
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

        Response.Redirect("attribute.aspx?id=" & ddlList.SelectedItem.Value & "&func=" & Request.QueryString("func"), False)

    End Sub


    Private Function CreateDataTable() As DataTable

        Dim dtTable As DataTable = New DataTable("Data")

        dtTable.Columns.Add(New DataColumn("Attribute_ID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("Attribute_Name", GetType(String)))
        dtTable.AcceptChanges()
        Dim dtRow As DataRow = dtTable.NewRow
        dtRow("Attribute_ID") = EMPTY_INT
        dtRow("Attribute_Name") = ""
        dtTable.Rows.Add(dtRow)
        dtTable.AcceptChanges()

        Return dtTable

    End Function


    '--- GETS STA INFO : DESCRIPTION, CONSTRAINED VALUES, DEPENDENTS
    Protected Sub DataBindPage(ByVal sqlConn As PLDbConnection)


        If ddlList.SelectedIndex = EMPTY_INT And Request.QueryString("func") <> FUNC_DELETE Then
            DataBindControl(grdName, sqlConn)
        Else
            DataBindControl(grdName, sqlConn)
            DataBindControl(grdDependents, sqlConn)

        End If

        If Request.QueryString("func") = FUNC_DELETE Then
            grdName.Columns(0).Visible = False
            If grdDependents.Items.Count = 0 Then
                btnSubmit.Visible = True
                txtLog.Visible = True
            Else
                btnSubmit.Visible = False
                txtLog.Visible = False
            End If
        Else
            If ddlList.SelectedIndex = EMPTY_INT Then
                grdDependents.Visible = False
            Else
                grdDependents.Visible = True
            End If
        End If

    End Sub


End Class
