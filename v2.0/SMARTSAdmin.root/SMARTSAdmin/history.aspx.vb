Imports PacificLife.Life.Enterprise.Data
Imports System.Data
Imports SMARTSCommon.CommonClass

Public Class history

    Inherits BaseClass


#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    'Protected WithEvents urlReturn As System.Web.UI.WebControls.HyperLink
    'Protected WithEvents grdShapeInfo As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdAttributeValues As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdRelation As System.Web.UI.WebControls.DataGrid
    'Protected WithEvents grdContainment As System.Web.UI.WebControls.DataGrid

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        If Not Page.IsPostBack Then

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            'read results returned
            DataBindPage(sqlConn)
            sqlConn.Close()


        End If

    End Sub


    Private Function CreateAttributeValueTable(ByVal sqlTable As DataTable) As DataTable

        Dim dt As New DataTable("Data")
        '--- hiddenname and id : USED TO SORT THE RELATIONS ALPHABETICALLY 
        Dim dcHiddenID As New DataColumn("HiddenID", GetType(Integer))
        Dim dcHiddenName As New DataColumn("HiddenName", GetType(String))
        Dim dcAttribute As New DataColumn("Attribute", GetType(String))
        Dim dcFunction As New DataColumn("Function", GetType(String))
        Dim dcValue As New DataColumn("Value", GetType(String))
        Dim dcContact As New DataColumn("Contact", GetType(String))
        Dim dcDateTime As New DataColumn("DateTime", GetType(DateTime))
        Dim dr As DataRow
        Dim strAttribute As String

        dt.Columns.Add(dcHiddenID)
        dt.Columns.Add(dcHiddenName)
        dt.Columns.Add(dcAttribute)
        dt.Columns.Add(dcFunction)
        dt.Columns.Add(dcValue)
        dt.Columns.Add(dcContact)
        dt.Columns.Add(dcDateTime)

        For i As Integer = 0 To sqlTable.Rows.Count - 1
            '--- NEW ROW IN THIS RELATION HISTORY
            dr = dt.NewRow
            If sqlTable.Rows(i).Item("SDLogFunction_ID") = LOGFUNCTION_DELETE_ATTRIBUTEVALUE Then
                dr("HiddenID") = sqlTable.Rows(i).Item("SD_ID")
                dr("HiddenName") = strAttribute
                dr("Value") = ""
                dr("Function") = Right(sqlTable.Rows(i).Item("FunctionName"), Len(sqlTable.Rows(i).Item("FunctionName")) - Len("LOGFUNCTION_"))
                dr("Contact") = sqlTable.Rows(i).Item("SDLog_Contact")
                dr("DateTime") = sqlTable.Rows(i).Item("SDLog_DateTime")
            Else
                If IsDBNull(sqlTable.Rows(i).Item("SDLog_Note")) = True Then
                    '-- ROW TO GET ATTRIBUTE VALUE
                    dr("HiddenID") = sqlTable.Rows(i).Item("SD_ID")
                    dr("Function") = Right(sqlTable.Rows(i).Item("FunctionName"), Len(sqlTable.Rows(i).Item("FunctionName")) - Len("LOGFUNCTION_"))
                    dr("Value") = sqlTable.Rows(i).Item("SDLog_Value")
                    dr("Contact") = sqlTable.Rows(i).Item("SDLog_Contact")
                    dr("DateTime") = sqlTable.Rows(i).Item("SDLog_DateTime")
                End If
                If i < sqlTable.Rows.Count - 1 Then
                    i = i + 1
                    If sqlTable.Rows(i).Item("SDLogFunction_ID") = LOGFUNCTION_SET_ATTRIBUTEVALUE Then
                        If IsDBNull(sqlTable.Rows(i).Item("SDLog_Note")) = False Then
                            If i < sqlTable.Rows.Count - 1 Then
                                '--- ROW TO GET ATTRIBUTE VALUE
                                i = i + 1
                                If IsDBNull(sqlTable.Rows(i).Item("Attribute")) = True Then
                                    dr("Attribute") = ""
                                Else
                                    strAttribute = sqlTable.Rows(i).Item("Attribute")
                                End If
                                dr("Attribute") = strAttribute
                            End If
                        End If
                    Else
                        i = i - 1
                    End If
                End If
                dr("HiddenName") = strAttribute
            End If
            dt.Rows.Add(dr)
        Next

        Return dt

    End Function

    Private Function CreateRelationTable(ByVal sqlTable As DataTable) As DataTable

        Dim dt As New DataTable("Data")
        '--- hiddenname and id : USED TO SORT THE RELATIONS ALPHABETICALLY 
        Dim dcHiddenName As New DataColumn("HiddenName", GetType(String))
        Dim dcHiddenID As New DataColumn("HiddenID", GetType(Integer))
        Dim dcRelation As New DataColumn("Relation", GetType(String))
        Dim dcFunction As New DataColumn("Function", GetType(String))
        Dim dcValue As New DataColumn("Value", GetType(String))
        Dim dcContact As New DataColumn("Contact", GetType(String))
        Dim dcDateTime As New DataColumn("DateTime", GetType(DateTime))
        Dim dr As DataRow
        Dim intCurrFunction As Integer
        Dim intCurrID As Integer
        Dim strValue As String
        Dim strHiddenName As String

        dt.Columns.Add(dcHiddenName)
        dt.Columns.Add(dcHiddenID)
        dt.Columns.Add(dcRelation)
        dt.Columns.Add(dcFunction)
        dt.Columns.Add(dcValue)
        dt.Columns.Add(dcContact)
        dt.Columns.Add(dcDateTime)

        For i As Integer = 0 To sqlTable.Rows.Count - 1
            '--- NEW ROW IN THIS RELATION HISTORY
            dr = dt.NewRow
            strValue = ""
            If intCurrID <> sqlTable.Rows(i).Item("SD_ID") Then
                '--- THIS IS A NEW RELATION
                intCurrID = sqlTable.Rows(i).Item("SD_ID")
                If IsDBNull(sqlTable.Rows(i).Item("ItemName")) = True Then
                    dr("Relation") = ""
                Else
                    dr("Relation") = sqlTable.Rows(i).Item("ItemName")
                End If
                If Len(Trim(dr("Relation"))) = EMPTY_INT Then
                    dr("Relation") = "[UNNAMED RELATION]"
                End If
                strHiddenName = dr("Relation")

            Else
                dr("Relation") = ""
            End If
            dr("HiddenName") = strHiddenName
            dr("HiddenID") = intCurrID
            intCurrFunction = sqlTable.Rows(i).Item("SDLogFunction_ID")
            If intCurrFunction = LOGFUNCTION_SET_RELATION Then
                '--- THIS IS A Table RELATION FUNCTION, HAVE TO TRAVERSE MULTIPLE ROWS TO GET INFO
                '--- LOOP TO GET ALL INFORMATION
                If IsDBNull(sqlTable.Rows(i).Item("SDLog_Note")) = True Then
                    '--- KEEP GOING TO BEGIN & END NAMES
                    i = i + 1
                End If
                If IsDBNull(sqlTable.Rows(i).Item("ItemTableID")) = False Then
                    If sqlTable.Rows(i).Item("ItemTableID") = TABLE_ABSTRACTION Then
                        '--- STILL AT ABSTRACTION, KEEP GOING
                        i = i + 1
                    End If
                End If
                '--- GET BEGIN NAME
                strValue = "FROM <b>" & sqlTable.Rows(i).Item("ItemName")
                i = i + 1
                '--- GET END NAME
                strValue = strValue & "</b> TO <b>" & sqlTable.Rows(i).Item("ItemName") & "</b>"
            Else
                If IsDBNull(sqlTable.Rows(i).Item("ItemName")) Then
                    strValue = ""
                Else
                    strValue = sqlTable.Rows(i).Item("ItemName")
                End If
            End If
            dr("Function") = Right(sqlTable.Rows(i).Item("FunctionName"), Len(sqlTable.Rows(i).Item("FunctionName")) - Len("LOGFUNCTION_"))
            dr("Value") = strValue
            dr("Contact") = sqlTable.Rows(i).Item("SDLog_Contact")
            dr("DateTime") = sqlTable.Rows(i).Item("SDLog_DateTime")
            dt.Rows.Add(dr)
        Next

        Return dt

    End Function


    Private Function CreateContainmentTable(ByVal sqlTable As DataTable) As DataTable

        Dim dt As New DataTable("Data")
        '--- hiddenname and id : USED TO SORT THE RELATIONS ALPHABETICALLY 
        Dim dcHiddenID As New DataColumn("HiddenID", GetType(Integer))
        Dim dcContainment As New DataColumn("Containment", GetType(String))
        Dim dcFunction As New DataColumn("Function", GetType(String))
        Dim dcContact As New DataColumn("Contact", GetType(String))
        Dim dcDateTime As New DataColumn("DateTime", GetType(DateTime))
        Dim dr As DataRow
        Dim intCurrFunction As Integer
        Dim intCurrID As Integer
        Dim strValue As String

        dt.Columns.Add(dcHiddenID)
        dt.Columns.Add(dcContainment)
        dt.Columns.Add(dcFunction)
        dt.Columns.Add(dcContact)
        dt.Columns.Add(dcDateTime)

        For i As Integer = 0 To sqlTable.Rows.Count - 1
            '--- NEW ROW IN THIS RELATION HISTORY
            dr = dt.NewRow
            strValue = ""
            If intCurrID <> sqlTable.Rows(i).Item("SD_ID") Then
                '--- THIS IS A NEW RELATION
                intCurrID = sqlTable.Rows(i).Item("SD_ID")
            End If
            dr("HiddenID") = intCurrID
            dr("Function") = Right(sqlTable.Rows(i).Item("FunctionName"), Len(sqlTable.Rows(i).Item("FunctionName")) - Len("LOGFUNCTION_"))
            intCurrFunction = sqlTable.Rows(i).Item("SDLogFunction_ID")
            If intCurrFunction = LOGFUNCTION_SET_SHAPE _
                Or intCurrFunction = LOGFUNCTION_SET_CONTAINER _
                Or intCurrFunction = LOGFUNCTION_SET_ARTIFACT Then
                '--- KEEP GOING TO CONTAINMENT NAMES
                i = i + 1
                '--- GET CONTAINER NAME
                strValue = "<b>" & sqlTable.Rows(i).Item("ItemName") & " </b>CONTAINS<b> "
                i = i + 1
                '--- GET END NAME
                strValue = strValue & sqlTable.Rows(i).Item("ItemName") & "</b>"
            Else
                If IsDBNull(sqlTable.Rows(i).Item("ItemName")) Then
                    strValue = ""
                Else
                    strValue = sqlTable.Rows(i).Item("ItemName")
                End If
            End If
            dr("Containment") = strValue
            dr("Contact") = sqlTable.Rows(i).Item("SDLog_Contact")
            dr("DateTime") = sqlTable.Rows(i).Item("SDLog_DateTime")
            dt.Rows.Add(dr)
        Next

        Return dt

    End Function

    Private Function CreateInfoTable(ByVal sqlTable As DataTable) As DataTable

        Dim dt As New DataTable("Data")
        '--- hiddenname and id : USED TO SORT THE RELATIONS ALPHABETICALLY 
        Dim dcFunction As New DataColumn("Function", GetType(String))
        Dim dcValue As New DataColumn("Value", GetType(String))
        Dim dcContact As New DataColumn("Contact", GetType(String))
        Dim dcDateTime As New DataColumn("DateTime", GetType(DateTime))
        Dim dr As DataRow

        dt.Columns.Add(dcFunction)
        dt.Columns.Add(dcValue)
        dt.Columns.Add(dcContact)
        dt.Columns.Add(dcDateTime)

        For i As Integer = 0 To sqlTable.Rows.Count - 1
            '--- NEW ROW IN THIS RELATION HISTORY
            dr = dt.NewRow
            dr("Function") = Right(sqlTable.Rows(i).Item("FunctionName"), Len(sqlTable.Rows(i).Item("FunctionName")) - Len("LOGFUNCTION_"))
            dr("Value") = sqlTable.Rows(i).Item("FunctionValue")
            dr("Contact") = sqlTable.Rows(i).Item("SDLog_Contact")
            dr("DateTime") = sqlTable.Rows(i).Item("SDLog_DateTime")
            dt.Rows.Add(dr)
        Next

        Return dt

    End Function



    Public Sub DataBindPage(ByVal sqlConn As PLDbConnection)


        urlReturn.NavigateUrl = Request.QueryString("page") & "?type=" & CStr(Request.QueryString("type")) & "&id=" & CStr(Request.QueryString("id"))
        Dim strSQL As String = "EXEC GetLog_Shape " & TABLE_SHAPE & "," & CStr(Request.QueryString("id")) & "; "
        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable
        With grdShapeInfo
            .DataSource = CreateInfoTable(sqlTable)
            .DataBind()
        End With

        Dim dv As DataView

        strSQL = "EXEC GetLog_AttributeValues " & TABLE_SHAPE & "," & CStr(Request.QueryString("id"))
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        dv = CreateAttributeValueTable(sqlTable).DefaultView
        dv.Sort = "HiddenName, HiddenID, DateTime"
        With grdAttributeValues
            .DataSource = dv
            .DataBind()
        End With

        strSQL = "EXEC GetLog_Relation " & TABLE_SHAPE & "," & CStr(Request.QueryString("id"))
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        dv = CreateRelationTable(sqlTable).DefaultView
        dv.Sort = "HiddenName, HiddenID, DateTime"
        With grdRelation
            .DataSource = dv
            .DataBind()
        End With

        strSQL = "EXEC GetLog_Container NULL," & TABLE_SHAPE & "," & CStr(Request.QueryString("id"))
        sqlCmd = New PLDbCommand(strSQL, sqlConn)
        sqlTable = sqlCmd.ExecuteDataTable
        With grdContainment
            .DataSource = CreateContainmentTable(sqlTable)
            .DataBind()
        End With

    End Sub


End Class
