Imports PacificLife.Life.Enterprise.Data
Imports System.Data
Imports SMARTSCommon.CommonClass

Public Class _Default
    Inherits BaseClass

    Protected Sub DataBindControl(ByVal Source As Object, ByVal sqlConn As PLDBConnection)

        Dim sqlCmd As PLDbCommand
        Dim sqlTable As New DataTable

        Select Case Source.ID
            Case "ddlSearchField"
                sqlCmd = New PLDbCommand("GetAttributeList", sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
                Source.DataSource = sqlTable
                Source.DataBind()
                ddlSearchField.Items.Insert(0, New ListItem("--ALL ATTRIBUTES--"))
                ddlSearchField.Items.Insert(0, New ListItem("Description"))
                ddlSearchField.Items.Insert(0, New ListItem("Name"))
                ddlSearchField.Items.Insert(0, New ListItem("--ALL FIELDS--"))
            Case "ddlReportName"
                ddlReportName.Items.Clear()
                Source.Items.Add(New ListItem("Attributes", EMPTY_INT))
                If ddlReportLevel.SelectedItem.Value <> EMPTY_INT Then
                    Source.Items.Add(New ListItem("Relations", 1))
                End If
            Case "ddlSearchLevel", "ddlLevelList", "ddlReportLevel"
                If Source.ID = "ddlSearchLevel" Or Source.ID = "ddlReportLevel" Then
                    Source.Items.Add(New ListItem("--ALL--", EMPTY_INT))
                End If
                Source.Items.Add(New ListItem("Business Process", ABSTRACTION_BUSINESS))
                Source.Items.Add(New ListItem("Process Step", ABSTRACTION_STEP))
                Source.Items.Add(New ListItem("System", ABSTRACTION_SYSTEM))
                Source.Items.Add(New ListItem("Object", ABSTRACTION_OBJECT))
                Source.Items.Add(New ListItem("Device", ABSTRACTION_DEVICE))
            Case "ddlSearchType"
                ddlSearchType.Items.Clear()
                If CInt(ddlSearchLevel.SelectedItem.Value) <> EMPTY_INT Then
                    sqlCmd = New PLDbCommand("GetShapeTypeList " & ddlSearchLevel.SelectedItem.Value, sqlConn)
                    sqlTable = sqlCmd.ExecuteDataTable
                    Source.DataSource = sqlTable
                    Source.DataBind()
                End If
                ddlSearchType.Items.Insert(0, New ListItem("--ALL--", EMPTY_INT))
            Case "ddlTypeList"
                sqlCmd = New PLDbCommand("GetShapeTypeList " & ddlLevelList.SelectedItem.Value, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
                Source.DataSource = sqlTable
                Source.DataBind()
            Case "ddlReportShapeType"
                sqlCmd = New PLDbCommand("GetShapeTypeList " & ddlReportLevel.SelectedItem.Value, sqlConn)
                sqlTable = sqlCmd.ExecuteDataTable
                Source.DataSource = sqlTable
                Source.DataBind()
                If ddlReportLevel.SelectedItem.Text = "--ALL--" Then
                    Source.Items.Add(New ListItem("--ALL--", EMPTY_INT))
                End If
            Case "ddlList"
                sqlCmd = New PLDbCommand("GetShapeList_Browser " & ddlTypeList.SelectedItem.Value, sqlConn)
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

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

            'read results returned
            Try
                DataBindControl(ddlLevelList, sqlConn)
                DataBindControl(ddlTypeList, sqlConn)
                DataBindControl(ddlReportLevel, sqlConn)
                DataBindControl(ddlReportShapeType, sqlConn)
                DataBindControl(ddlReportName, sqlConn)
                If Len(CStr(Request.QueryString("id"))) > 0 Then
                    ddlTypeList.SelectedIndex = ddlTypeList.Items.IndexOf(ddlTypeList.Items.FindByValue(Request.QueryString("type")))
                    DataBindControl(ddlList, sqlConn)
                    ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByValue(Request.QueryString("id")))
                Else
                    ddlTypeList.SelectedIndex = 0
                    DataBindControl(ddlList, sqlConn)
                    ddlList.SelectedIndex = 0
                    ddlReportShapeType.SelectedIndex = 0
                    DataBindPage(sqlConn)
                End If
                DataBindControl(ddlSearchField, sqlConn)
                DataBindControl(ddlSearchLevel, sqlConn)
                DataBindControl(ddlSearchType, sqlConn)
            Catch exc As Exception
                Response.Write(exc.Message)
            Finally
                sqlConn.Close()
            End Try
        End If

    End Sub

    Private Sub ddlLevelList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlLevelList.SelectedIndexChanged

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        DataBindControl(ddlTypeList, sqlConn)
        ddlTypeList.SelectedIndex = 0
        DataBindControl(ddlList, sqlConn)
        ddlList.SelectedIndex = 0
        DataBindPage(sqlConn)

        sqlConn.Close()

    End Sub

    Private Sub ddlReportLevel_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlLevelList.SelectedIndexChanged, ddlReportLevel.SelectedIndexChanged

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        DataBindControl(ddlReportShapeType, sqlConn)
        ddlReportShapeType.SelectedIndex = 0
        DataBindControl(ddlReportName, sqlConn)
        DataBindPage(sqlConn)

        sqlConn.Close()

    End Sub


    Private Sub ddlSearchLevel_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlSearchLevel.SelectedIndexChanged

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        DataBindControl(ddlSearchType, sqlConn)

        sqlConn.Close()

    End Sub

    Private Sub ddlTypeList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlTypeList.SelectedIndexChanged

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        DataBindControl(ddlList, sqlConn)
        ddlList.SelectedIndex = 0
        DataBindPage(sqlConn)

        sqlConn.Close()

    End Sub


    Private Sub ddlList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ddlList.SelectedIndexChanged

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        DataBindPage(sqlConn)

        sqlConn.Close()

    End Sub

    Public Sub DataBindPage(ByVal sqlConn As PLDbConnection)

        lblMessage.Visible = False

        If ddlList.Items.Count <> EMPTY_INT Then
            Dim strSQL As String = "EXEC GetItem " & TABLE_SHAPE & "," & CInt(ddlList.SelectedItem.Value) & ";"
            Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
            Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable
            With grdDescription
                .DataSource = sqlTable
                .DataBind()
            End With
        End If

    End Sub


    Private Sub btnSearchValue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearchValue.Click

        Dim strQuery As String

        Select Case ddlSearchField.SelectedItem.Text.ToString
            Case "--ALL FIELDS--"
                strQuery = "field=" & EMPTY_INT
                strQuery = strQuery & "&attribute=0"
            Case "Name"
                strQuery = "field=" & LOGFUNCTION_SET_NAME
                strQuery = strQuery & "&attribute=0"
            Case "Description"
                strQuery = "field=" & LOGFUNCTION_SET_DESCRIPTION
                strQuery = strQuery & "&attribute=0"
            Case "--ALL ATTRIBUTES--"
                strQuery = "field=" & LOGFUNCTION_SET_ATTRIBUTEVALUE
                strQuery = strQuery & "&attribute=0"
            Case Else
                strQuery = "field=" & LOGFUNCTION_SET_ATTRIBUTEVALUE
                strQuery = strQuery & "&attribute=" & ddlSearchField.SelectedItem.Value
        End Select
        strQuery = strQuery & "&level=" & ddlSearchLevel.SelectedItem.Value
        strQuery = strQuery & "&type=" & ddlSearchType.SelectedItem.Value
        strQuery = strQuery & "&value=" & Replace(Trim(boxSearchValue.Text), "'", "''")


        Response.Redirect("Result.aspx?" & strQuery)

    End Sub


    Private Sub ViewDetails_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ViewDetails.Click

        Dim strSQL As String = strSQL & "EXEC GetItem " & TABLE_SHAPE & "," & CInt(ddlList.SelectedItem.Value) & ";"
        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable

        If sqlTable.Rows.Count = EMPTY_INT Then
            'GOT NOTHING BACK, GET LIST OF LATEST
            DataBindControl(ddlList, sqlConn)
            DataBindPage(sqlConn)
            lblMessage.Text = "Selection is unavailable. Please select another."
            lblMessage.Visible = True
        Else

            '*** redirect to page depending on shapetype
            Select Case ddlLevelList.SelectedItem.Value
                Case ABSTRACTION_OBJECT
                    Response.Redirect("object.aspx?type=" & ddlTypeList.SelectedItem.Value & "&id=" & ddlList.SelectedItem.Value)
                Case ABSTRACTION_SYSTEM
                    Response.Redirect("sys.aspx?type=" & ddlTypeList.SelectedItem.Value & "&id=" & ddlList.SelectedItem.Value)
                Case ABSTRACTION_DEVICE
                    Response.Redirect("device.aspx?type=" & ddlTypeList.SelectedItem.Value & "&id=" & ddlList.SelectedItem.Value)
                Case ABSTRACTION_BUSINESS
                    Response.Redirect("businessprocess.aspx?type=" & ddlTypeList.SelectedItem.Value & "&id=" & ddlList.SelectedItem.Value)
                Case ABSTRACTION_STEP
                    Response.Redirect("step.aspx?type=" & ddlTypeList.SelectedItem.Value & "&id=" & ddlList.SelectedItem.Value)
            End Select
        End If

        sqlConn.Close()

    End Sub


    Private Sub btnViewReport_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnViewReport.Click

        '*** redirect to page depending on report selected
        Select Case ddlReportLevel.SelectedItem.Value
            Case EMPTY_INT
                Response.Redirect("enterprise.aspx")
            Case Else
                If ddlReportName.SelectedItem.Value = EMPTY_INT Then
                    Response.Redirect("reports.aspx?type=" & ddlReportShapeType.SelectedItem.Value & "&shapetypename=" & ddlReportShapeType.SelectedItem.Text)
                Else
                    Response.Redirect("LevelReports.aspx?abstraction=" & ddlReportLevel.SelectedItem.Value)
                End If
        End Select

    End Sub


End Class
