Imports PacificLife.Life.Enterprise.Data
Imports System.Data
Imports SMARTSCommon.CommonClass

Public Class Delete
    Inherits BaseClass

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    'Protected WithEvents ddlLevelList As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents ddlTypeList As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents ddlList As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents grdDescription As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents btnDelete As System.Web.UI.WebControls.Button
    'Protected WithEvents lblLog As System.Web.UI.WebControls.Label
    'Protected WithEvents txtLog As System.Web.UI.WebControls.TextBox
    'Protected WithEvents lblMessage As System.Web.UI.WebControls.Label

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

        Select Case Source.ID
            Case "ddlLevelList"
                If Source.ID = "ddlSearchLevel" Then
                    Source.Items.Add(New ListItem("--ALL--", EMPTY_INT))
                End If
                Source.Items.Add(New ListItem("Business Process", ABSTRACTION_BUSINESS))
                Source.Items.Add(New ListItem("Process Step", ABSTRACTION_STEP))
                Source.Items.Add(New ListItem("System", ABSTRACTION_SYSTEM))
                Source.Items.Add(New ListItem("Object", ABSTRACTION_OBJECT))
                Source.Items.Add(New ListItem("Device", ABSTRACTION_DEVICE))
            Case "ddlTypeList"
                sqlCmd = New PLDbCommand("GetShapeTypeList " & ddlLevelList.SelectedItem.Value, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
                Source.DataSource = sqlTable
                Source.DataBind()
            Case "ddlList"
                sqlCmd = New PLDbCommand("GetShapeList_Deletable " & ddlTypeList.SelectedItem.Value, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
                Source.DataSource = sqlTable
                Source.DataBind()
        End Select

    End Sub



    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        SetScroll()

        If Page.IsPostBack Then

            SaveScroll()

        Else

            'read results returned
            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            DataBindControl(ddlLevelList, sqlConn)
            DataBindControl(ddlTypeList, sqlConn)
            If Len(CStr(Request.QueryString("id"))) > 0 Then
                ddlTypeList.SelectedIndex = ddlTypeList.Items.IndexOf(ddlTypeList.Items.FindByValue(Request.QueryString("type")))
                DataBindControl(ddlList, sqlConn)
                ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByValue(Request.QueryString("id")))
            Else
                ddlTypeList.SelectedIndex = 0
                DataBindControl(ddlList, sqlConn)
                ddlList.SelectedIndex = 0
                DataBindPage(sqlConn)
            End If
            sqlConn.Close()

        End If

    End Sub

    Private Sub ddlLevelList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlLevelList.SelectedIndexChanged

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        DataBindControl(ddlTypeList, sqlConn)
        ddlTypeList.SelectedIndex = 0
        DataBindControl(ddlList, sqlConn)
        ddlList.SelectedIndex = 0
        DataBindPage(sqlConn)
        lblMessage.Visible = False
        sqlConn.Close()


    End Sub

    Private Sub ddlTypeList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlTypeList.SelectedIndexChanged

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        DataBindControl(ddlList, sqlConn)
        ddlList.SelectedIndex = 0
        DataBindPage(sqlConn)
        lblMessage.Visible = False
        sqlConn.Close()

    End Sub

    Private Sub ddlList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlList.SelectedIndexChanged

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        DataBindPage(sqlConn)
        lblMessage.Visible = False
        sqlConn.Close()

    End Sub

    Public Sub DataBindPage(ByVal sqlConn As PLDbConnection)

        If ddlList.Items.Count <> EMPTY_INT Then

            Dim strSQL As String = "EXEC GetItem " & TABLE_SHAPE & "," & CInt(ddlList.SelectedItem.Value) & ";"
            Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
            Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable
            grdDescription.DataSource = sqlTable
            grdDescription.DataBind()

        End If

    End Sub



    Private Sub ViewDetails_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

        '*** redirect to page depending on shapetype
        Select Case ddlLevelList.SelectedItem.Value
            Case ABSTRACTION_OBJECT
                Response.Redirect("object.aspx?type=" & ddlTypeList.SelectedItem.Value & "&id=" & ddlList.SelectedItem.Value, False)
            Case ABSTRACTION_SYSTEM
                Response.Redirect("sys.aspx?type=" & ddlTypeList.SelectedItem.Value & "&id=" & ddlList.SelectedItem.Value, False)
            Case ABSTRACTION_DEVICE
                Response.Redirect("device.aspx?type=" & ddlTypeList.SelectedItem.Value & "&id=" & ddlList.SelectedItem.Value, False)
            Case ABSTRACTION_BUSINESS
                Response.Redirect("businessprocess.aspx?type=" & ddlTypeList.SelectedItem.Value & "&id=" & ddlList.SelectedItem.Value, False)
            Case ABSTRACTION_STEP
                Response.Redirect("step.aspx?type=" & ddlTypeList.SelectedItem.Value & "&id=" & ddlList.SelectedItem.Value, False)
        End Select

    End Sub

    Private Sub btnDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDelete.Click

        If ddlList.Items.Count <> EMPTY_INT Then

            If Trim(txtLog.Text.Length) > EMPTY_INT Then

                Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
                Dim sqlCmd As PLDbCommand = New PLDbCommand("DeleteItem", sqlConn)
                With sqlCmd
                    .CommandType = CommandType.StoredProcedure
                    .AddParameter("@Table", SqlDbType.Int, 0).Value = TABLE_SHAPE
                    .AddParameter("@ID", SqlDbType.Int, 0).Value = ddlList.SelectedItem.Value
                    .AddParameter("@Function", SqlDbType.Int, 0).Value = LOGFUNCTION_DELETE_SHAPE
                    .AddParameter("@Name", SqlDbType.VarChar, 100).Value = CStr(ddlList.SelectedItem.Text)
                    .AddParameter("@Note", SqlDbType.VarChar, 100).Value = Trim(Replace(CStr(txtLog.Text), "'", "''"))
                    .AddParameter("@Contact", SqlDbType.VarChar, 100).Value = CStr(User.Identity.Name)
                    .AddParameter("@NewID", SqlDbType.Int, 0).Direction = ParameterDirection.Output
                    .ExecuteNonQuery()
                End With

                Dim booDeletable As Boolean = CBool(sqlCmd.Parameters("@NewID").Value.ToString())

                txtLog.Text = ""

                DataBindControl(ddlList, sqlConn)
                DataBindPage(sqlConn)

                sqlConn.Close()

                If booDeletable = True Then
                    lblMessage.Text = "Deleted."
                Else
                    lblMessage.Text = "Unavailable for deletion. Please select another."
                End If
                lblMessage.Visible = True

            Else
                lblMessage.Text = "Enter reason for deletion."
                lblMessage.Visible = True
            End If
        Else
            lblMessage.Text = "Please select an Item to delete."
            lblMessage.Visible = True
        End If

    End Sub

End Class
