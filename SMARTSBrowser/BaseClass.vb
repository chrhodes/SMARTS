Imports System.Data.SqlClient
Imports System.Web.UI.WebControls
Imports System.Web.UI.UserControl
Imports System.Text
Imports PacificLife.Life.Enterprise.Data


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

    Public Const DIRECTION_FROM = 0
    Public Const DIRECTION_TO = 1


    'Public Shared Function SMARTSConnectionOpen() As PLDbConnection
    '    ''--- NO SECURED REPOSITORY
    '    Dim sqlConn As New PLDbConnection(ConfigurationSettings.AppSettings("ConnectionString"))

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


    Public Shared Function RewriteString(ByVal strContent As String) As String

        Dim strTemp As String

        'CHECK/REPLACE APOSTROPHES
        strTemp = Trim(Replace(strContent, "'", "''"))
        strTemp = "'" & strTemp & "'"

        Return strTemp

    End Function


    Public Shared Function DummyLink(ByVal strLink As String) As String

        If Len(Trim(strLink)) = EMPTY_INT Then
            Return "[VIEW RELATION]"
        Else
            Return strLink
        End If

    End Function

End Class
