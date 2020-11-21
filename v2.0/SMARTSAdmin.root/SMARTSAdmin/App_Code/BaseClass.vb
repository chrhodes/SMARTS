Imports PacificLife.Life.Enterprise.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI.UserControl
Imports System.Text
Imports System.Data
Imports System.Configuration
Imports SMARTSCommon.CommonClass

Public Class BaseClass

    Inherits System.Web.UI.Page


    'Public Shared Function SMARTSConnectionOpen() As PLDbConnection
    '    ''--- NO SECURED REPOSITORY

    '    Dim sqlConn As New PLDbConnection(ConfigurationManager.AppSettings("ConnectionString"))
    '    sqlConn.Open()

    '    Return sqlConn

    'End Function


    Public Shared Function SMARTSConnectionOpen() As PLDbConnection

        Dim sqlConn As PLDbConnection
        Try
            sqlConn = PLDbConnection.GetConnection("SMARTS")
        Catch
            Return Nothing
        End Try
        Return sqlConn


        'Try
        '    '--- THIS ONE USES SECURED REPOSITORY
        '    sqlConn = PLDbConnection.GetConnection("SMARTS")
        'Catch e As Exception
        '    Try
        '        sqlConn = New PLDbConnection(ConfigurationManager.AppSettings("ConnectionString"))
        '        sqlConn.Open()
        '    Catch
        '        Console.WriteLine("No connection.")
        '        Return Nothing
        '    End Try
        'End Try

        'Return sqlConn

    End Function


    Public Sub SetScroll()

        Dim saveScrollPosition As New System.text.StringBuilder
        Dim setScrollPosition As New System.text.StringBuilder

        ClientScript.RegisterHiddenField("__SCROLLPOS", "0")

        saveScrollPosition.Append("<script language='javascript'>")
        saveScrollPosition.Append("function saveScrollPosition() {")
        saveScrollPosition.Append(" document.forms[0].__SCROLLPOS.value = theBody.scrollTop;")
        saveScrollPosition.Append("}")
        saveScrollPosition.Append("theBody.onscroll=saveScrollPosition;")
        saveScrollPosition.Append("</script>")

        ClientScript.RegisterStartupScript(GetType(String), "saveScroll", saveScrollPosition.ToString())

    End Sub

    Public Sub SaveScroll()

        Dim saveScrollPosition As New System.text.StringBuilder
        Dim setScrollPosition As New System.text.StringBuilder

        setScrollPosition.Append("<script language='javascript'>")
        setScrollPosition.Append("function setScrollPosition() {")
        setScrollPosition.Append(" theBody.scrollTop = " & Request("__SCROLLPOS") & ";")
        setScrollPosition.Append("}")
        setScrollPosition.Append("theBody.onload=setScrollPosition;")
        setScrollPosition.Append("</script>")

        ClientScript.RegisterStartupScript(GetType(String), "setScroll", setScrollPosition.ToString())

    End Sub


    Public Sub setFocus(ByVal Source As Object, ByVal E As DataGridCommandEventArgs)

        Dim ctrl As Control

        Select Case Source.ID
            Case "grdName"
                ctrl = Source.Items(E.Item.ItemIndex).Cells(1).FindControl("txtName")
            Case "grdDescription"
                ctrl = Source.Items(E.Item.ItemIndex).Cells(1).FindControl("txtDescription")
            Case "grdLifecycle"
                ctrl = Source.Items(E.Item.ItemIndex).Cells(1).FindControl("ddlLifecycle")
            Case "grdLocation"
                ctrl = Source.Items(E.Item.ItemIndex).Cells(1).FindControl("txtLocation")
            Case "grdContact"
                ctrl = Source.Items(E.Item.ItemIndex).Cells(1).FindControl("txtContact")
            Case "grdNote"
                ctrl = Source.Items(E.Item.ItemIndex).Cells(1).FindControl("txtNote")
            Case "grdConstrainedValues"
                ctrl = Source.Items(E.Item.ItemIndex).Cells(1).FindControl("txtConstrainedValues")
            Case "grdAttribute"
                Dim ctlAttribute As DropDownList = Source.Items(E.Item.ItemIndex).Cells(1).FindControl("ddlAttributeValue")
                If ctlAttribute.Items.Count = EMPTY_INT Then
                    ctrl = Source.Items(E.Item.ItemIndex).Cells(1).FindControl("txtAttributeValue")
                Else
                    ctrl = Source.Items(E.Item.ItemIndex).Cells(1).FindControl("ddlAttributeValue")
                End If
            Case Else
                '--- NO NEED TO SET FOCUS ON OTHER CONTROLS, EXIT
                Exit Sub
        End Select

        'Set the script to focus and select the control
        Dim strFocus As String = "<script language=""JavaScript"">" & vbCrLf & _
             vbTab & "theForm." & ctrl.ClientID & ".focus();" & _
             vbCrLf & vbTab & "theForm." & ctrl.ClientID & ".select();" & _
             vbCrLf & "<" & "/script>"
        ClientScript.RegisterStartupScript(GetType(String), "focus", strFocus)

    End Sub

    Public Function RewriteString(ByVal strContent As String) As String

        Dim strTemp As String

        'CHECK/REPLACE APOSTROPHES
        strTemp = Trim(Replace(strContent, "'", "''"))
        strTemp = "'" & strTemp & "'"

        Return strTemp

    End Function


    Public Function DummyLink(ByVal strLink As String) As String

        If Len(Trim(strLink)) = EMPTY_INT Then
            Return "[VIEW RELATION]"
        Else
            Return strLink
        End If

    End Function


    Public Function GetArtifacts(ByVal ddlData As DropDownList, ByVal sqlConn As PLDbConnection) As DropDownList

        Dim sqlCmd As PLDbCommand = New PLDbCommand("GetArtifactList", sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable()
        If sqlTable.Rows.Count > 0 Then
            ddlData.DataSource = sqlTable
            ddlData.DataBind()
        End If

        ddlData.Items.Insert(0, CreateListItem("CREATE NEW ARTIFACT"))

        Return ddlData

    End Function

    '--- RETURNS FALSE if Artifact is already linked to item
    '--- RETURNS TRUE if Artifact is not linked to item
    Public Function booSetArtifact(ByVal sqlConn As PLDbConnection, ByVal intItem As Integer, ByVal intValue As Integer) As Boolean

        Dim strSQL As String
        Dim sqlCmd As PLDbCommand

        strSQL = "GetItem_Contained " & TABLE_SHAPE & "," & intItem & "," & ABSTRACTION_ARTIFACT
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable
        For i As Integer = 0 To sqlTable.Rows.Count - 1
            If sqlTable.Rows(i).Item("Related_ID") = intValue Then
                '--- linked already
                Return False
                Exit For
            End If
        Next
        '--- link Artifact
        strSQL = "SetContainer " & TABLE_SHAPE & "," & intItem & "," & TABLE_ARTIFACT & "," & intValue & "," & ABSTRACTION_ARTIFACT & "," & LOGFUNCTION_SET_CONTAINER & "," & RewriteString(User.Identity.Name)
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()
        Return True

    End Function

    '--- Sets item lifecycle
    Public Sub subSetLifecycle(ByVal sqlConn As PLDbConnection, ByVal intItem As Integer, ByVal E As DataGridCommandEventArgs)

        Dim intValue As Integer = Integer.Parse(CType(E.Item.FindControl("ddlLifecycle"), DropDownList).SelectedItem.Value)
        Dim strSQL As String = "SetItem_Lifecycle " & TABLE_SHAPE & "," & intItem & "," & LOGFUNCTION_SET_LIFECYCLE & "," & intValue & "," & RewriteString(User.Identity.Name)
        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        sqlCmd.ExecuteNonQuery()

    End Sub


    Public Shared Function CreateListItem(ByVal strText As String) As ListItem

        Dim lstItem As New ListItem

        lstItem.Text = "--" & strText & "--"
        lstItem.Value = EMPTY_INT

        Return lstItem

    End Function

    Public Sub PopulateControl_Attributes(ByVal e As DataGridItemEventArgs, ByVal sqlConn As PLDbConnection, ByVal ddlList As DropDownList)

        Dim ddlValue As DropDownList = CType(e.Item.FindControl("ddlAttributeValue"), DropDownList)
        Dim txtValue As TextBox = CType(e.Item.FindControl("txtAttributeValue"), TextBox)
        Dim intSTA_ID As Integer = Integer.Parse(CType(e.Item.FindControl("lblSTA_ID"), Label).Text)

        Dim strSQL As String = "GetItem_ConstrainedValues " & TABLE_SHAPETYPEATTRIBUTE & "," & intSTA_ID
        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable()
        If sqlTable.Rows.Count > 0 Then
            Dim strToParse As String = sqlTable.Rows(0).Item("ConstrainedValue_Values")
            Dim arrValues As Array = Split(strToParse, ",")
            Dim i As Integer
            For i = 0 To UBound(arrValues)
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

    End Sub


    Public Function SecureEditing(ByVal intDivision As Integer) As Integer

        '--- RETURN STUB FOR NOW
        Return SECURITY_SCHEMA
        Exit Function

        '--- PASS IN THE DIVISION OF THE SHAPE. DETERMINES EDITING RIGHTS
        '--- SELECT DIVISION
        Select Case intDivision
            Case DIVISION_LIFE
                If User.IsInRole("pacificmutual\SmartStar_Life_Schema") Then
                    Return SECURITY_SCHEMA
                ElseIf User.IsInRole("pacificmutual\SmartStar_Life_Shape") Then
                    Return SECURITY_SHAPE
                ElseIf User.IsInRole("pacificmutual\SmartStar_Life_Attribute") Then
                    Return SECURITY_ATTRIBUTE
                ElseIf User.IsInRole("pacificmutual\SmartStar_Life_Association") Then
                    Return SECURITY_ASSOC
                Else
                    Return EMPTY_INT
                End If
            Case DIVISION_CORPORATE
                If User.IsInRole("pacificmutual\SmartStar_Corporate_Schema") Then
                    Return SECURITY_SCHEMA
                ElseIf User.IsInRole("pacificmutual\SmartStar_Corporate_Shape") Then
                    Return SECURITY_SHAPE
                ElseIf User.IsInRole("pacificmutual\SmartStar_Corporate_Attribute") Then
                    Return SECURITY_ATTRIBUTE
                ElseIf User.IsInRole("pacificmutual\SmartStar_Corporate_Association") Then
                    Return SECURITY_ASSOC
                Else
                    Return EMPTY_INT
                End If
            Case DIVISION_REALESTATE
                If User.IsInRole("pacificmutual\SmartStar_RealEstate_Schema") Then
                    Return SECURITY_SCHEMA
                ElseIf User.IsInRole("pacificmutual\SmartStar_RealEstate_Shape") Then
                    Return SECURITY_SHAPE
                ElseIf User.IsInRole("pacificmutual\SmartStar_RealEstate_Attribute") Then
                    Return SECURITY_ATTRIBUTE
                ElseIf User.IsInRole("pacificmutual\SmartStar_RealEstate_Association") Then
                    Return SECURITY_ASSOC
                Else
                    Return EMPTY_INT
                End If
            Case DIVISION_ANNUITIES
                If User.IsInRole("pacificmutual\SmartStar_Annuities_Schema") Then
                    Return SECURITY_SCHEMA
                ElseIf User.IsInRole("pacificmutual\SmartStar_Annuities_Shape") Then
                    Return SECURITY_SHAPE
                ElseIf User.IsInRole("pacificmutual\SmartStar_Annuities_Attribute") Then
                    Return SECURITY_ATTRIBUTE
                ElseIf User.IsInRole("pacificmutual\SmartStar_Annuities_Association") Then
                    Return SECURITY_ASSOC
                Else
                    Return EMPTY_INT
                End If
            Case DIVISION_SECURITIES
                If User.IsInRole("pacificmutual\SmartStar_Securities_Schema") Then
                    Return SECURITY_SCHEMA
                ElseIf User.IsInRole("pacificmutual\SmartStar_Securities_Shape") Then
                    Return SECURITY_SHAPE
                ElseIf User.IsInRole("pacificmutual\SmartStar_Securities_Attribute") Then
                    Return SECURITY_ATTRIBUTE
                ElseIf User.IsInRole("pacificmutual\SmartStar_Securities_Association") Then
                    Return SECURITY_ASSOC
                Else
                    Return EMPTY_INT
                End If
            Case Else
                'HAS NO EDITING ABILITY
                Return EMPTY_INT
        End Select

        '--- SELECT SECURIY LEVEL WITHIN DIVISION

    End Function

End Class

