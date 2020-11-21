Imports PacificLife.Life.Enterprise.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI.UserControl
Imports System.Text


Public Class BaseClass

    Inherits System.Web.UI.Page

    Public Const FUNC_CREATE = 1
    Public Const FUNC_UPDATE = 2
    Public Const FUNC_DELETE = 3
    Public Const FUNC_RETURN = 4

    Public Const LIST_ARTIFACTS = 1
    Public Const LIST_ATTRIBUTES = 2
    Public Const LIST_SYSTEMS = 3
    Public Const LIST_OBJECTS = 4
    Public Const LIST_DEVICES = 5
    Public Const LIST_PIECES = 6
    Public Const LIST_BUSINESSES = 7
    Public Const LIST_STEPS = 8
    Public Const LIST_SHAPETYPES = 9

    Public Const EMPTY_INT = 0
    Public Const EMPTY_STR = "''"

    Public Const LOGFUNCTION_SET_ARTIFACT = 1
    Public Const LOGFUNCTION_DELETE_ARTIFACT = 2
    Public Const LOGFUNCTION_SET_ATTRIBUTE = 3
    Public Const LOGFUNCTION_DELETE_ATTRIBUTE = 4
    Public Const LOGFUNCTION_SET_SHAPETYPEATTRIBUTE = 5
    Public Const LOGFUNCTION_DELETE_SHAPETYPEATTRIBUTE = 6
    Public Const LOGFUNCTION_SET_CONSTRAINEDVALUE = 7
    Public Const LOGFUNCTION_DELETE_CONSTRAINEDVALUE = 8
    Public Const LOGFUNCTION_SET_SHAPE = 9
    Public Const LOGFUNCTION_DELETE_SHAPE = 10
    Public Const LOGFUNCTION_SET_CONTAINER = 11
    Public Const LOGFUNCTION_DELETE_CONTAINER = 12
    Public Const LOGFUNCTION_SET_RELATION = 13
    Public Const LOGFUNCTION_DELETE_RELATION = 14
    Public Const LOGFUNCTION_SET_DESCRIPTION = 15
    Public Const LOGFUNCTION_SET_NAME = 16
    Public Const LOGFUNCTION_SET_ATTRIBUTEVALUE = 17
    Public Const LOGFUNCTION_SET_LIFECYCLE = 18
    Public Const LOGFUNCTION_SET_LOCATION = 19
    Public Const LOGFUNCTION_SET_CONTACT = 20
    Public Const LOGFUNCTION_SET_NOTE = 21
    Public Const LOGFUNCTION_DELETE_ATTRIBUTEVALUE = 22

    Public Const TABLE_ABSTRACTION = 1
    Public Const TABLE_ATTRIBUTE = 2
    Public Const TABLE_SHAPETYPE = 3
    Public Const TABLE_SHAPE = 4
    Public Const TABLE_SHAPETYPEATTRIBUTE = 5
    Public Const TABLE_ATTRIBUTEVALUE = 6
    Public Const TABLE_RELATION = 7
    Public Const TABLE_SDTABLE = 8
    Public Const TABLE_LOG = 9
    Public Const TABLE_CONSTRAINEDVALUES = 10
    Public Const TABLE_ARTIFACT = 11
    Public Const TABLE_CONTAINER = 12
    Public Const TABLE_SDLOGFUNCTION = 13
    Public Const TABLE_LIFECYCLE = 14

    Public Const SHAPETYPE_APPLICATION = 1
    Public Const SHAPETYPE_DATA = 2
    Public Const SHAPETYPE_BATCHFILE = 3
    Public Const SHAPETYPE_ACTOR = 4
    Public Const SHAPETYPE_FILEREPORT = 5
    Public Const SHAPETYPE_QUEUE = 6
    Public Const SHAPETYPE_JOB = 7
    Public Const SHAPETYPE_OBJECTRELATION = 8
    Public Const SHAPETYPE_SYSTEM = 9
    Public Const SHAPETYPE_SYSTEMRELATION = 10
    Public Const SHAPETYPE_SERVER = 11
    Public Const SHAPETYPE_IP = 12
    Public Const SHAPETYPE_DEVICERELATION = 13
    Public Const SHAPETYPE_DESKTOP = 14
    Public Const SHAPETYPE_MAINFRAME = 15
    Public Const SHAPETYPE_LAPTOP = 16
    Public Const SHAPETYPE_PDA = 17
    Public Const SHAPETYPE_TABLET = 18
    Public Const SHAPETYPE_PRINTER = 19
    Public Const SHAPETYPE_SAN = 20
    Public Const SHAPETYPE_FIREWALL = 21
    Public Const SHAPETYPE_LOADBALANCER = 22
    Public Const SHAPETYPE_ROUTER = 23
    Public Const SHAPETYPE_PIECE = 24
    Public Const SHAPETYPE_BUSINESS = 25
    Public Const SHAPETYPE_STEP = 26
    Public Const SHAPETYPE_DECISION = 27
    Public Const SHAPETYPE_BUSINESSRELATION = 28
    Public Const SHAPETYPE_STEPRELATION = 29
    Public Const SHAPETYPE_CROSSRELATION = 30
    Public Const SHAPETYPE_TIME = 31
    Public Const SHAPETYPE_START = 32
    Public Const SHAPETYPE_END = 33
    Public Const SHAPETYPE_SUBSTEP = 34
    Public Const SHAPETYPE_BROWSER = 35
    Public Const SHAPETYPE_SQLINSTANCE = 36
    Public Const SHAPETYPE_FOLDER = 37

    Public Const ABSTRACTION_SYSTEM = 1
    Public Const ABSTRACTION_OBJECT = 2
    Public Const ABSTRACTION_DEVICE = 3
    Public Const ABSTRACTION_SYSTEMOBJECT = 4
    Public Const ABSTRACTION_IP = 5
    Public Const ABSTRACTION_DEVICEOBJECT = 6
    Public Const ABSTRACTION_ARTIFACT = 7
    Public Const ABSTRACTION_PIECE = 8
    Public Const ABSTRACTION_OBJECTPIECE = 9
    Public Const ABSTRACTION_BUSINESS = 10
    Public Const ABSTRACTION_STEP = 11
    Public Const ABSTRACTION_BUSINESSSTEP = 12
    Public Const ABSTRACTION_RELATION = 13
    Public Const ABSTRACTION_STEPOBJECT = 14
    Public Const ABSTRACTION_SUBSTEP = 15

    Public Const LIFECYCLE_RESEARCH = 1
    Public Const LIFECYCLE_CURRENT = 2
    Public Const LIFECYCLE_CONTAIN = 3
    Public Const LIFECYCLE_RETIRE = 4

    Public Const SECURITY_ASSOC = 1
    Public Const SECURITY_ATTRIBUTE = 2
    Public Const SECURITY_SHAPE = 3
    Public Const SECURITY_SCHEMA = 4

    Public Const DIVISION_LIFE = 1
    Public Const DIVISION_ANNUITIES = 2
    Public Const DIVISION_CORPORATE = 3
    Public Const DIVISION_REALESTATE = 4
    Public Const DIVISION_SECURITIES = 5

    Public Const DIRECTION_FROM = 0
    Public Const DIRECTION_TO = 1


    Public Const gSTUB_intDivision = DIVISION_LIFE

    'Public Shared Function SMARTSConnectionOpen() As PLDbConnection
    '    ''--- NO SECURED REPOSITORY

    '    Dim sqlConn As New PLDbConnection(ConfigurationSettings.AppSettings("ConnectionString"))
    '    sqlConn.Open()

    '    Return sqlConn

    'End Function


    Public Shared Function SMARTSConnectionOpen() As PLDbConnection

        '--- THIS ONE USES SECURED REPOSITORY
        Return PLDbConnection.GetConnection("SMARTS")

    End Function


    Public Sub SetScroll()

        Dim saveScrollPosition As New System.text.StringBuilder
        Dim setScrollPosition As New System.text.StringBuilder

        RegisterHiddenField("__SCROLLPOS", "0")

        saveScrollPosition.Append("<script language='javascript'>")
        saveScrollPosition.Append("function saveScrollPosition() {")
        saveScrollPosition.Append(" document.forms[0].__SCROLLPOS.value = theBody.scrollTop;")
        saveScrollPosition.Append("}")
        saveScrollPosition.Append("theBody.onscroll=saveScrollPosition;")
        saveScrollPosition.Append("</script>")

        RegisterStartupScript("saveScroll", saveScrollPosition.ToString())

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

        RegisterStartupScript("setScroll", setScrollPosition.ToString())

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
        RegisterStartupScript("focus", strFocus)

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

    Public Sub subSetName()

        Dim frmItem As New SMARTSAdmin.BusinessProcess

    End Sub


    Public Shared Function CreateListItem(ByVal strText As String) As ListItem

        Dim lstItem As New ListItem

        lstItem.Text = "--" & strText & "--"
        lstItem.Value = EMPTY_INT

        Return lstItem

    End Function

    Public Function PopulateControl_Attributes(ByVal e As DataGridItemEventArgs, ByVal sqlConn As PLDbConnection, ByVal ddlList As DropDownList)

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

    End Function


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

