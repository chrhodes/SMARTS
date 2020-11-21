Imports PacificLife.Life.Enterprise.Data
Imports System
Imports System.Data
Imports System.Text
Imports System.Xml

Public Class CommonClass

    Inherits System.Web.UI.Page

    Public Const FUNC_CREATE As Integer = 1
    Public Const FUNC_UPDATE As Integer = 2
    Public Const FUNC_DELETE As Integer = 3
    Public Const FUNC_RETURN As Integer = 4

    Public Const LIST_ARTIFACTS As Integer = 1
    Public Const LIST_ATTRIBUTES As Integer = 2
    Public Const LIST_SYSTEMS As Integer = 3
    Public Const LIST_OBJECTS As Integer = 4
    Public Const LIST_DEVICES As Integer = 5
    Public Const LIST_PIECES As Integer = 6
    Public Const LIST_BUSINESSES As Integer = 7
    Public Const LIST_STEPS As Integer = 8
    Public Const LIST_SHAPETYPES As Integer = 9

    Public Const EMPTY_INT As Integer = 0
    Public Const EMPTY_STR As String = "''"

    Public Const LOGFUNCTION_SET_ARTIFACT As Integer = 1
    Public Const LOGFUNCTION_DELETE_ARTIFACT As Integer = 2
    Public Const LOGFUNCTION_SET_ATTRIBUTE As Integer = 3
    Public Const LOGFUNCTION_DELETE_ATTRIBUTE As Integer = 4
    Public Const LOGFUNCTION_SET_SHAPETYPEATTRIBUTE As Integer = 5
    Public Const LOGFUNCTION_DELETE_SHAPETYPEATTRIBUTE As Integer = 6
    Public Const LOGFUNCTION_SET_CONSTRAINEDVALUE As Integer = 7
    Public Const LOGFUNCTION_DELETE_CONSTRAINEDVALUE As Integer = 8
    Public Const LOGFUNCTION_SET_SHAPE As Integer = 9
    Public Const LOGFUNCTION_DELETE_SHAPE As Integer = 10
    Public Const LOGFUNCTION_SET_CONTAINER As Integer = 11
    Public Const LOGFUNCTION_DELETE_CONTAINER As Integer = 12
    Public Const LOGFUNCTION_SET_RELATION As Integer = 13
    Public Const LOGFUNCTION_DELETE_RELATION As Integer = 14
    Public Const LOGFUNCTION_SET_DESCRIPTION As Integer = 15
    Public Const LOGFUNCTION_SET_NAME As Integer = 16
    Public Const LOGFUNCTION_SET_ATTRIBUTEVALUE As Integer = 17
    Public Const LOGFUNCTION_SET_LIFECYCLE As Integer = 18
    Public Const LOGFUNCTION_SET_LOCATION As Integer = 19
    Public Const LOGFUNCTION_SET_CONTACT As Integer = 20
    Public Const LOGFUNCTION_SET_NOTE As Integer = 21
    Public Const LOGFUNCTION_DELETE_ATTRIBUTEVALUE As Integer = 22

    Public Const TABLE_ABSTRACTION As Integer = 1
    Public Const TABLE_ATTRIBUTE As Integer = 2
    Public Const TABLE_SHAPETYPE As Integer = 3
    Public Const TABLE_SHAPE As Integer = 4
    Public Const TABLE_SHAPETYPEATTRIBUTE As Integer = 5
    Public Const TABLE_ATTRIBUTEVALUE As Integer = 6
    Public Const TABLE_RELATION As Integer = 7
    Public Const TABLE_SDTABLE As Integer = 8
    Public Const TABLE_LOG As Integer = 9
    Public Const TABLE_CONSTRAINEDVALUES As Integer = 10
    Public Const TABLE_ARTIFACT As Integer = 11
    Public Const TABLE_CONTAINER As Integer = 12
    Public Const TABLE_SDLOGFUNCTION As Integer = 13
    Public Const TABLE_LIFECYCLE As Integer = 14

    Public Const SHAPETYPE_APPLICATION As Integer = 1
    Public Const SHAPETYPE_DATA As Integer = 2
    Public Const SHAPETYPE_BATCHFILE As Integer = 3
    Public Const SHAPETYPE_ACTOR As Integer = 4
    Public Const SHAPETYPE_FILEREPORT As Integer = 5
    Public Const SHAPETYPE_QUEUE As Integer = 6
    Public Const SHAPETYPE_JOB As Integer = 7
    Public Const SHAPETYPE_OBJECTRELATION As Integer = 8
    Public Const SHAPETYPE_SYSTEM As Integer = 9
    Public Const SHAPETYPE_SYSTEMRELATION As Integer = 10
    Public Const SHAPETYPE_SERVER As Integer = 11
    Public Const SHAPETYPE_IP As Integer = 12
    Public Const SHAPETYPE_DEVICERELATION As Integer = 13
    Public Const SHAPETYPE_DESKTOP As Integer = 14
    Public Const SHAPETYPE_MAINFRAME As Integer = 15
    Public Const SHAPETYPE_LAPTOP As Integer = 16
    Public Const SHAPETYPE_PDA As Integer = 17
    Public Const SHAPETYPE_TABLET As Integer = 18
    Public Const SHAPETYPE_PRINTER As Integer = 19
    Public Const SHAPETYPE_SAN As Integer = 20
    Public Const SHAPETYPE_FIREWALL As Integer = 21
    Public Const SHAPETYPE_LOADBALANCER As Integer = 22
    Public Const SHAPETYPE_ROUTER As Integer = 23
    Public Const SHAPETYPE_PIECE As Integer = 24
    Public Const SHAPETYPE_BUSINESS As Integer = 25
    Public Const SHAPETYPE_STEP As Integer = 26
    Public Const SHAPETYPE_DECISION As Integer = 27
    Public Const SHAPETYPE_BUSINESSRELATION As Integer = 28
    Public Const SHAPETYPE_STEPRELATION As Integer = 29
    Public Const SHAPETYPE_CROSSRELATION As Integer = 30
    Public Const SHAPETYPE_TIME As Integer = 31
    Public Const SHAPETYPE_START As Integer = 32
    Public Const SHAPETYPE_END As Integer = 33
    Public Const SHAPETYPE_SUBSTEP As Integer = 34
    Public Const SHAPETYPE_BROWSER As Integer = 35
    Public Const SHAPETYPE_SQLINSTANCE As Integer = 36
    Public Const SHAPETYPE_FOLDER As Integer = 37

    Public Const ABSTRACTION_SYSTEM As Integer = 1
    Public Const ABSTRACTION_OBJECT As Integer = 2
    Public Const ABSTRACTION_DEVICE As Integer = 3
    Public Const ABSTRACTION_SYSTEMOBJECT As Integer = 4
    Public Const ABSTRACTION_IP As Integer = 5
    Public Const ABSTRACTION_DEVICEOBJECT As Integer = 6
    Public Const ABSTRACTION_ARTIFACT As Integer = 7
    Public Const ABSTRACTION_PIECE As Integer = 8
    Public Const ABSTRACTION_OBJECTPIECE As Integer = 9
    Public Const ABSTRACTION_BUSINESS As Integer = 10
    Public Const ABSTRACTION_STEP As Integer = 11
    Public Const ABSTRACTION_BUSINESSSTEP As Integer = 12
    Public Const ABSTRACTION_RELATION As Integer = 13
    Public Const ABSTRACTION_STEPOBJECT As Integer = 14
    Public Const ABSTRACTION_SUBSTEP As Integer = 15

    Public Const LIFECYCLE_RESEARCH As Integer = 1
    Public Const LIFECYCLE_CURRENT As Integer = 2
    Public Const LIFECYCLE_CONTAIN As Integer = 3
    Public Const LIFECYCLE_RETIRE As Integer = 4

    Public Const SECURITY_ASSOC As Integer = 1
    Public Const SECURITY_ATTRIBUTE As Integer = 2
    Public Const SECURITY_SHAPE As Integer = 3
    Public Const SECURITY_SCHEMA As Integer = 4

    Public Const DIVISION_LIFE As Integer = 1
    Public Const DIVISION_ANNUITIES As Integer = 2
    Public Const DIVISION_CORPORATE As Integer = 3
    Public Const DIVISION_REALESTATE As Integer = 4
    Public Const DIVISION_SECURITIES As Integer = 5

    Public Const DIRECTION_FROM As Integer = 0
    Public Const DIRECTION_TO As Integer = 1


    Public Const gSTUB_intDivision As Integer = DIVISION_LIFE



End Class

