Imports PacificLife.Life.Enterprise.Data
Imports System.Data
Imports SMARTSCommon.CommonClass

Public Class ShapeTypeAttribute

    Inherits BaseClass

    'Protected WithEvents lblTitle As System.Web.UI.WebControls.Label
    'Protected WithEvents ddlList As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents btnSubmit As System.Web.UI.WebControls.Button
    'Protected WithEvents lblLog As System.Web.UI.WebControls.Label
    'Protected WithEvents grdDependents As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents dlShapeTypeExist As System.Web.UI.WebControls.DataList
    'Protected WithEvents grdDescription As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdConstrainedValues As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents rfvLog As System.Web.UI.WebControls.RequiredFieldValidator
    'Protected WithEvents drpList As System.Web.UI.WebControls.DropDownList
    'Protected WithEvents txtLog As System.Web.UI.WebControls.TextBox
    'Protected WithEvents cblTypes As System.Web.UI.WebControls.CheckBoxList

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

    Protected Sub BypassValidate()
        rfvLog.IsValid = True
    End Sub

    Public Sub ControlEdit(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        Source.EditItemIndex = E.Item.ItemIndex

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        ControlDataBind(Source, sqlConn)
        sqlConn.Close()

        BypassValidate()

        setFocus(Source, E)

    End Sub


    Public Sub ControlCancel(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        Source.EditItemIndex = -1
        ControlDataBind(Source, sqlConn)
        BypassValidate()

        sqlConn.Close()

    End Sub

    Sub DBValidate(ByVal sender As Object, ByVal e As EventArgs)

        Select Case Request.QueryString("func")
            Case FUNC_CREATE, FUNC_UPDATE
                BypassValidate()
        End Select

        If Page.IsValid Then
            SubmitToDB()
        End If

    End Sub

    Protected Sub ControlDataBind(ByVal Source As Object, ByVal sqlconn As PLDbConnection)

        Select Case Source.ID
            Case "grdConstrainedValues", "grdDescription"
                Dim sqlCmd As PLDbCommand = New PLDbCommand("GetShapeTypeAttribute " & ddlList.SelectedItem.Value, sqlconn)
                Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable
                Dim DBTable As DataTable = sqlTable
                Dim DBRow As DataRow
                If DBTable.Rows.Count > 0 Then
                    For i As Integer = 1 To DBTable.Rows.Count - 1
                        DBTable.Rows.Item(i).Delete()
                    Next
                End If
                Source.DataSource = DBTable
                Source.DataBind()
        End Select

    End Sub


    Public Sub ControlUpdate(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        Dim strSQL As String
        Dim intSelectedItem As Integer
        Dim strValue As String

        Select Case Source.ID
            Case "grdConstrainedValues"
                strValue = CType(E.Item.FindControl("txtConstrainedValues"), TextBox).Text
                intSelectedItem = ddlList.SelectedItem.Value
                If Len(Trim(CStr(strValue))) = 0 Then
                    strSQL = "SetConstrainedValue " & TABLE_SHAPETYPEATTRIBUTE & "," & intSelectedItem & "," & LOGFUNCTION_DELETE_CONSTRAINEDVALUE & ",''," & RewriteString(User.Identity.Name)
                Else
                    strSQL = "SetConstrainedValue " & TABLE_SHAPETYPEATTRIBUTE & "," & intSelectedItem & "," & LOGFUNCTION_SET_CONSTRAINEDVALUE & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
                End If
            Case "grdDescription"
                strValue = CType(E.Item.FindControl("txtDescription"), TextBox).Text
                intSelectedItem = ddlList.SelectedItem.Value
                strSQL = "SetShapeTypeAttribute_Desc " & TABLE_SHAPETYPEATTRIBUTE & "," & intSelectedItem & "," & LOGFUNCTION_SET_DESCRIPTION & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
        End Select

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Dim sqlCmd As New PLDbCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

        Source.EditItemIndex = -1
        ControlDataBind(Source, sqlConn)
        If Source.ID = "grdConstrainedValues" Then
            ControlDataBind(ddlList, sqlConn)
            ddlList.SelectedValue = intSelectedItem
        End If
        BypassValidate()

        sqlConn.Close()

    End Sub

    Public Sub ControlItemDataBound(ByVal Source As Object, ByVal E As DataGridItemEventArgs)

        Dim typItem As ListItemType = E.Item.ItemType
        Dim sqlTable As New DataTable
        Dim sqlCmd As PLDbCommand
        Dim txtValue As TextBox

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Select Case typItem
            Case ListItemType.EditItem
                sqlCmd = New PLDbCommand("GetShapeTypeAttribute " & ddlList.SelectedItem.Value, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
                If sqlTable.Rows.Count > 0 Then
                    Select Case Source.id
                        Case "grdDescription"
                            txtValue = CType(E.Item.FindControl("txtDescription"), TextBox)
                            If sqlTable.Rows(0).Item("ShapeTypeAttribute_Desc") Is DBNull.Value Then
                                txtValue.Text = ""
                            Else
                                txtValue.Text = sqlTable.Rows(0).Item("ShapeTypeAttribute_Desc").ToString
                            End If
                        Case "grdConstrainedValues"
                            txtValue = CType(E.Item.FindControl("txtConstrainedValues"), TextBox)
                            If sqlTable.Rows(0).Item("ConstrainedValue_Values") Is DBNull.Value Then
                                txtValue.Text = ""
                            Else
                                txtValue.Text = sqlTable.Rows(0).Item("ConstrainedValue_Values").ToString
                            End If
                    End Select
                End If
        End Select

        sqlConn.Close()

    End Sub


    '--- GETS SHAPETYPES AVAILABLE FOR LINKING TO THE SELECTED ATTRIBUTE 
    Protected Sub DataBindShapeTypes(ByVal sqlConn As PLDbConnection)


        Dim sqlCmd As PLDbCommand = New PLDbCommand("GetShapeTypeAttributeList " & EMPTY_INT & "," & ddlList.SelectedItem.Value, sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable

        Dim DBRow As DataRow
        For Each DBRow In sqlTable.Rows
            If DBRow("ShapeTypeAttribute_ID") Is DBNull.Value Then
                DBRow.Delete()
            End If
        Next
        dlShapeTypeExist.DataSource = sqlTable
        dlShapeTypeExist.DataBind()

        sqlTable.RejectChanges()
        For Each DBRow In sqlTable.Rows
            If Not DBRow("ShapeTypeAttribute_ID") Is DBNull.Value Then
                DBRow.Delete()
            End If
        Next
        cblTypes.DataSource = sqlTable
        cblTypes.DataBind()

        If Request.QueryString("func") = FUNC_CREATE Then
            If cblTypes.Items.Count = EMPTY_INT And cblTypes.Visible = True Then
                btnSubmit.Visible = False
            Else
                btnSubmit.Visible = True
            End If
        End If

    End Sub

    '--- GETS ALL DATA NECESSARY TO CREATE A SHAPETYPE-ATTRIBUTE
    Protected Sub DataBindPage(ByVal sqlConn As PLDbConnection)

        Dim sqlCmd As PLDbCommand
        Dim sqlReader As PLDbDataReader
        Dim sqlTable As New DataTable
        Dim DBRow As DataRow

        '---CREATE STA PAGE
        If Request.QueryString("func") = FUNC_CREATE Then

            'make query to database
            sqlCmd = New PLDbCommand("GetAttributeList", sqlConn)
            'read results returned
            sqlReader = sqlCmd.ExecuteReader
            If sqlReader.Read Then
                With ddlList
                    .DataTextField = "Attribute_Name"
                    .DataValueField = "Attribute_ID"
                    .DataSource = sqlReader
                    .DataBind()
                    .SelectedIndex = 0
                End With
            End If
            sqlReader.Close()
            DataBindShapeTypes(sqlConn)

        Else 'UPDATE/DELETE STA PAGE
            'make query to database
            sqlCmd = New PLDbCommand("GetShapeTypeAttributeList " & EMPTY_INT & "," & EMPTY_INT, sqlConn)
            'read results returned
            sqlReader = sqlCmd.ExecuteReader
            If sqlReader.Read Then
                With ddlList
                    .DataTextField = "ShapeTypeAttribute_Name"
                    .DataValueField = "ShapeTypeAttribute_ID"
                    .DataSource = sqlReader
                    .DataBind()
                    .SelectedIndex = 0
                End With
                sqlReader.Close()
                DataBindInfo(sqlConn)
            End If
        End If

    End Sub

    '--- GETS STA INFO : DESCRIPTION, CONSTRAINED VALUES, DEPENDENTS
    Protected Sub DataBindInfo(ByVal sqlConn As PLDbConnection)

        Dim sqlCmd As PLDbCommand = New PLDbCommand("GetShapeTypeAttribute " & ddlList.SelectedItem.Value, sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable

        If sqlTable.Rows.Count > 0 Then

            For i As Integer = 1 To sqlTable.Rows.Count - 1
                sqlTable.Rows.Item(i).Delete()
            Next
            grdDescription.DataSource = sqlTable
            grdDescription.DataBind()
            grdConstrainedValues.DataSource = sqlTable
            grdConstrainedValues.DataBind()
            sqlTable.RejectChanges()

            Dim DBRow As DataRow
            For Each DBRow In sqlTable.Rows
                If DBRow("AttributeValue_Value") Is DBNull.Value Then
                    DBRow.Delete()
                End If
            Next
            grdDependents.DataSource = sqlTable
            grdDependents.DataBind()
            sqlTable.RejectChanges()

        End If

        '''TWEAK WITH THE CONTROL DISPLAYS ABIT

        If grdDependents.Items.Count > 0 Then
            grdDependents.Visible = True
            If Request.QueryString("func") = FUNC_DELETE Then
                lblLog.Visible = False
                txtLog.Visible = False
                btnSubmit.Visible = False
            End If
        Else
            grdDependents.Visible = False
            If Request.QueryString("func") = FUNC_DELETE Then
                lblLog.Visible = True
                txtLog.Visible = True
                btnSubmit.Visible = True
            End If
        End If

    End Sub


    Protected Sub SubmitToDB()

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Dim sqlCmd As PLDbCommand

        Select Case Request.QueryString("func")
            Case FUNC_CREATE
                For i As Integer = 0 To cblTypes.Items.Count - 1
                    If cblTypes.Items(i).Selected = True Then
                        sqlCmd = New PLDbCommand("SetShapeTypeAttribute", sqlConn)
                        With sqlCmd
                            .CommandType = CommandType.StoredProcedure
                            .AddParameter("@Table", SqlDbType.Int, 0).Value = TABLE_SHAPETYPEATTRIBUTE
                            .AddParameter("@A_ID", SqlDbType.Int, 0).Value = ddlList.SelectedItem.Value
                            .AddParameter("@ST_ID", SqlDbType.Int, 0).Value = cblTypes.Items(i).Value
                            .AddParameter("@Function", SqlDbType.Int, 0).Value = LOGFUNCTION_SET_SHAPETYPEATTRIBUTE
                            .AddParameter("@Contact", SqlDbType.VarChar, 100).Value = Trim(Replace(CStr(User.Identity.Name), "'", "''"))
                            .AddParameter("@NewID", SqlDbType.Int, 0).Direction = ParameterDirection.Output
                            .ExecuteNonQuery()
                        End With
                    End If
                Next
                DataBindShapeTypes(sqlConn)
            Case FUNC_DELETE
                Dim strSQL As String = "DeleteShapeTypeAttribute " & TABLE_SHAPETYPEATTRIBUTE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_DELETE_SHAPETYPEATTRIBUTE & "," & RewriteString(ddlList.SelectedItem.Text) & "," & RewriteString(txtLog.Text) & "," & RewriteString(User.Identity.Name)
                sqlCmd = New PLDbCommand(strSQL, sqlConn)
                sqlCmd.ExecuteNonQuery()
                DataBindPage(sqlConn)
        End Select

        sqlConn.Close()
        lblLog.Text = ""

    End Sub


    Private Sub ddlList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlList.SelectedIndexChanged

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        Select Case Request.QueryString("func")
            Case FUNC_CREATE
                DataBindShapeTypes(sqlConn)
            Case FUNC_UPDATE
                sqlConn.Close()
                Response.Redirect("ShapeTypeAttribute.aspx?func=2&obj=" & ddlList.SelectedItem.Value, False)
                Exit Sub
            Case FUNC_DELETE
                DataBindInfo(sqlConn)
        End Select

        sqlConn.Close()

    End Sub


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        SetScroll()

        If Page.IsPostBack Then

            SaveScroll()

        Else

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

            DataBindPage(sqlConn)
            Select Case Request.QueryString("func")
                Case FUNC_CREATE
                    lblTitle.Text = "Create ShapeType-Attribute"
                    grdDependents.Visible = False
                    btnSubmit.Visible = True
                    btnSubmit.Text = "ShapeType(s) To Include"
                Case FUNC_UPDATE
                    If Len(CStr(Request.QueryString("obj"))) > 0 Then
                        ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByValue(Request.QueryString("obj")))
                    End If
                    DataBindInfo(sqlConn)
                    lblTitle.Text = "Update ShapeType-Attribute"
                    dlShapeTypeExist.Visible = False
                    btnSubmit.Visible = False
                    btnSubmit.Text = "Update"
                Case FUNC_DELETE
                    lblTitle.Text = "Delete ShapeType-Attribute"
                    dlShapeTypeExist.Visible = False
                    grdDescription.Columns(0).Visible = False
                    grdConstrainedValues.Columns(0).Visible = False
                    btnSubmit.Text = "Delete"
            End Select

            sqlConn.Close()

        End If


    End Sub

End Class
