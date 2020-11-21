Imports Microsoft.Office.Interop
Imports PacificLife.Life.Enterprise.Data

Public Class BaseClass

    Inherits System.Windows.Forms.Form

    Public Const EMPTY_INT = 0
    Public Const EMPTY_STR = "''"

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

    Public Const VISIO_ENABLED = 0
    Public Const VISIO_DISABLED = 1

    Public Const ACTIONITEM_DRILLDOWN = 0
    Public Const ACTIONITEM_DRILLUP = 1
    Public Const ACTIONITEM_EDITVISIO = 2
    Public Const ACTIONITEM_PROPERTIES = 4
    Public Const ACTIONITEM_BUSINESSPROCESS = 5
    Public Const ACTIONITEM_INFRASTRUCTURE = 6
    Public Const ACTIONITEM_SYSTEM = 7
    Public Const ACTIONITEM_RETRIEVE = 8
    Public Const ACTIONITEM_VALIDATESHAPE = 9
    Public Const ACTIONITEM_SHAPEDROP = 10
    Public Const ACTIONITEM_RECONNECT = 11
    Public Const ACTIONITEM_SUMMARIZE = 12
    Public Const ACTIONITEM_VALIDATESHEET = 13
    Public Const ACTIONITEM_SHOWRELATIONS = 14

    Public Const RELATIONTYPE_CONTAINER = 1
    Public Const RELATIONTYPE_CONTAINED = 2
    Public Const RELATIONTYPE_DIRECT = 3

    Public Const LINEFORMAT_LINEPATTERN_SOLID = 1
    Public Const LINEFORMAT_LINEPATTERN_SLASH = 2
    Public Const LINEFORMAT_LINEPATTERN_DOT = 3
    Public Const LINEFORMAT_LINEWEIGHT = "1.5 pt"
    Public Const LINEFORMAT_ARROW_NONE = 0
    Public Const LINEFORMAT_ARROW_NORMAL = 1

    Public Shared g_intAction As Integer
    Public Shared g_booRelationReplace As Boolean
    Public Shared g_visApp As Visio.Application

    Dim sortColumn As Integer = -1


    Public Shared Function SMARTSConnectionOpen() As PLDbConnection

        '--- THIS ONE USES SECURED REPOSITORY
        Return PLDbConnection.GetConnection("SMARTS")

    End Function

    'Public Shared Function SMARTSConnectionOpen() As PLDbConnection

    '    Dim xmlDoc As New MSXML.DOMDocument
    '    xmlDoc.load("SMARTS.xml")

    '    Dim strConn As String = Replace(xmlDoc.getElementsByTagName("DBConnection").item(0).text, """", "")
    '    Dim sqlConn As New PLDbConnection(strConn)

    '    xmlDoc = Nothing
    '    sqlConn.Open() 

    '    Return sqlConn

    'End Function


    Private Function fncURLQueryString(ByVal visShape As Visio.Shape) As String

        Select Case visShape.Cells("Prop.AbstractionID").ResultIU
            Case ABSTRACTION_RELATION
                '--- RELATION SHAPE CONCATENATION
                Dim visShapeBegin As Visio.Shape = visShape.Connects(1).ToCell.Shape
                fncURLQueryString = "?id=" & CStr(visShapeBegin.Cells("Prop.ShapeID").ResultIU) & "&type=" & CStr(visShapeBegin.Cells("Prop.ShapeTypeID").ResultIU) & "&relation=" & CStr(visShape.Cells("Prop.ShapeID").ResultIU)

            Case Else
                '--- ITEM SHAPE CONCATENATION
                fncURLQueryString = "?type=" & CStr(visShape.Cells("Prop.ShapeTypeID").ResultIU) & "&id=" & CStr(visShape.Cells("Prop.ShapeID").ResultIU)
        End Select

        Return fncURLQueryString

    End Function


    Public Function booShapeExists(ByVal intKey As Integer, ByVal intType As Integer) As Boolean

        Try
            '---GET NAME OF SHAPE TO SEARCH FOR
            Dim strShapeName As String = fncSetMaster(intType) & "." & intKey
            If Not g_visApp.ActivePage.Shapes(strShapeName) Is Nothing Then
                'JUST TO DOUBLE-CHECK FOR DIFFERENT RELATION TYPES
                Dim visShape As Visio.Shape = g_visApp.ActivePage.Shapes(strShapeName)
                If visShape.Cells("Prop.ShapeTypeID").ResultIU = intType Then
                    '--- THIS IS A DUPLICATE
                    Return True
                Else
                    '--- THIS IS A DIFFERENT RELATION
                    Return False
                End If
            Else
                Return False
            End If
        Catch e As Exception
            '--- THIS IS NOT A DUPLICATE
            Return False
        End Try

    End Function


    Public Function fncSetMaster(ByVal intShapeType As Integer) As String

        Select Case intShapeType
            Case SHAPETYPE_APPLICATION
                fncSetMaster = "Application"
            Case SHAPETYPE_DATA
                fncSetMaster = "Data"
            Case SHAPETYPE_BATCHFILE
                fncSetMaster = "Batch File"
            Case SHAPETYPE_ACTOR
                fncSetMaster = "Actor"
            Case SHAPETYPE_FILEREPORT
                fncSetMaster = "File/Report"
            Case SHAPETYPE_QUEUE
                fncSetMaster = "Queue"
            Case SHAPETYPE_JOB
                fncSetMaster = "Job"
            Case SHAPETYPE_SYSTEM
                fncSetMaster = "System"
            Case SHAPETYPE_SERVER
                fncSetMaster = "Server"
            Case SHAPETYPE_IP
                fncSetMaster = "IP"
            Case SHAPETYPE_DESKTOP
                fncSetMaster = "Desktop"
            Case SHAPETYPE_MAINFRAME
                fncSetMaster = "Mainframe"
            Case SHAPETYPE_LAPTOP
                fncSetMaster = "Laptop"
            Case SHAPETYPE_PDA
                fncSetMaster = "PDA"
            Case SHAPETYPE_TABLET
                fncSetMaster = "Tablet"
            Case SHAPETYPE_PRINTER
                fncSetMaster = "Printer"
            Case SHAPETYPE_SAN
                fncSetMaster = "SAN"
            Case SHAPETYPE_FIREWALL
                fncSetMaster = "Firewall"
            Case SHAPETYPE_LOADBALANCER
                fncSetMaster = "LoadBalancer"
            Case SHAPETYPE_ROUTER
                fncSetMaster = "Router"
            Case SHAPETYPE_PIECE
                fncSetMaster = "Functional Piece"
            Case SHAPETYPE_BUSINESS
                fncSetMaster = "Business Process"
            Case SHAPETYPE_STEP
                fncSetMaster = "Process Step"
            Case SHAPETYPE_DECISION
                fncSetMaster = "Decision"
            Case SHAPETYPE_TIME
                fncSetMaster = "Clock"
            Case SHAPETYPE_START
                fncSetMaster = "Start"
            Case SHAPETYPE_END
                fncSetMaster = "End"
            Case SHAPETYPE_SUBSTEP
                fncSetMaster = "SubStep"
            Case SHAPETYPE_BROWSER
                fncSetMaster = "Browser"
            Case SHAPETYPE_SQLINSTANCE
                fncSetMaster = "SQL Instance"
            Case SHAPETYPE_FOLDER
                fncSetMaster = "Folder"
            Case SHAPETYPE_SYSTEMRELATION, SHAPETYPE_OBJECTRELATION, _
                SHAPETYPE_DEVICERELATION, SHAPETYPE_BUSINESSRELATION, _
                SHAPETYPE_STEPRELATION, SHAPETYPE_CROSSRELATION
                fncSetMaster = "Relation"
        End Select

    End Function


    Public Function fncCreateTable_Assocs(ByVal lstShapes As ListView) As DataTable

        Dim dtTable As DataTable = New DataTable("Data")
        dtTable.Columns.Add(New DataColumn("Assoc_TypeID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("Assoc_ID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("Assoc_Name", GetType(String)))
        dtTable.Columns.Add(New DataColumn("Assoc_Desc", GetType(String)))
        dtTable.Columns.Add(New DataColumn("Assoc_AbstractionID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("Begin_TableID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("Begin_TypeID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("Begin_ID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("End_TableID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("End_TypeID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("End_ID", GetType(Integer)))

        dtTable.AcceptChanges()

        For i As Integer = 0 To lstShapes.SelectedItems.Count - 1
            Dim dtRow As DataRow = dtTable.NewRow
            dtRow("Assoc_TypeID") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Assoc TypeID", lstShapes)).Text()
            dtRow("Assoc_ID") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Assoc ID", lstShapes)).Text()
            dtRow("Assoc_Name") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Association", lstShapes)).Text()
            dtRow("Assoc_Desc") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Assoc Desc", lstShapes)).Text()
            dtRow("Assoc_AbstractionID") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Assoc AbstractionID", lstShapes)).Text()
            If lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Assoc Direction", lstShapes)).Text() = "TO" Then
                '--- PRINCIPAL IS THE BEGIN SHAPE, RELATED IS THE END SHAPE
                dtRow("Begin_TableID") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Item1 TableID", lstShapes)).Text()
                dtRow("Begin_TypeID") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Item1 TypeID", lstShapes)).Text()
                dtRow("Begin_ID") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Item1 ID", lstShapes)).Text()
                dtRow("End_TableID") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Item2 TableID", lstShapes)).Text()
                dtRow("End_TypeID") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Item2 TypeID", lstShapes)).Text()
                dtRow("End_ID") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Item2 ID", lstShapes)).Text()
            Else
                '--- PRINCIPAL IS THE END SHAPE, RELATED IS THE RELATED SHAPE
                dtRow("Begin_TableID") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Item2 TableID", lstShapes)).Text()
                dtRow("Begin_TypeID") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Item2 TypeID", lstShapes)).Text()
                dtRow("Begin_ID") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Item2 ID", lstShapes)).Text()
                dtRow("End_TableID") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Item1 TableID", lstShapes)).Text()
                dtRow("End_TypeID") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Item1 TypeID", lstShapes)).Text()
                dtRow("End_ID") = lstShapes.SelectedItems(i).SubItems(fncGetColumnHeaderIndex("Item1 ID", lstShapes)).Text()
            End If
            dtTable.Rows.Add(dtRow)
        Next
        dtTable.AcceptChanges()

        Return dtTable

    End Function


    Public Function fncCreateTable_Items(ByVal lstShapes As ListView, ByVal strName As String) As DataTable

        '--- GET SHAPESHEET COLUMN INDEXES 

        Dim strShapeName As String = strName & " ID"
        Dim intItemID As Integer = fncGetColumnHeaderIndex(strShapeName, lstShapes)
        strShapeName = strName & " TypeID"
        Dim intItemTypeID As Integer = fncGetColumnHeaderIndex(strShapeName, lstShapes)
        strShapeName = strName & " Name"
        Dim intItemName As Integer = fncGetColumnHeaderIndex(strShapeName, lstShapes)
        strShapeName = strName & " Desc"
        Dim intItemDesc As Integer = fncGetColumnHeaderIndex(strShapeName, lstShapes)
        strShapeName = strName & " AbstractionID"
        Dim intItemAbstraction As Integer = fncGetColumnHeaderIndex(strShapeName, lstShapes)
        strShapeName = strName & "Container ID"
        Dim intContainerID As Integer = fncGetColumnHeaderIndex(strShapeName, lstShapes)
        strShapeName = strName & "Container TypeID"
        Dim intContainerTypeID As Integer = fncGetColumnHeaderIndex(strShapeName, lstShapes)

        '--- CREATE DATATABLE FOR ITEM SHAPESHEET, CONVERTS COLUMN HEADERS
        Dim dtTable As DataTable = New DataTable("Data")
        dtTable.Columns.Add(New DataColumn("ShapeTypeID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("ShapeID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("ShapeName", GetType(String)))
        dtTable.Columns.Add(New DataColumn("ShapeDesc", GetType(String)))
        dtTable.Columns.Add(New DataColumn("AbstractionID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("ContainerID", GetType(Integer)))
        dtTable.Columns.Add(New DataColumn("ContainerTypeID", GetType(Integer)))
        dtTable.AcceptChanges()

        '--- POPULATE DATATABLE
        For i As Integer = 0 To lstShapes.SelectedItems.Count - 1
            Dim dtRow As DataRow = dtTable.NewRow
            dtRow("ShapeTypeID") = lstShapes.SelectedItems(i).SubItems(intItemTypeID).Text()
            dtRow("ShapeID") = lstShapes.SelectedItems(i).SubItems(intItemID).Text()
            dtRow("ShapeName") = lstShapes.SelectedItems(i).SubItems(intItemName).Text()
            dtRow("ShapeDesc") = lstShapes.SelectedItems(i).SubItems(intItemDesc).Text()
            dtRow("AbstractionID") = lstShapes.SelectedItems(i).SubItems(intItemAbstraction).Text()
            If Len(lstShapes.SelectedItems(i).SubItems(intContainerID).Text()) > EMPTY_INT Then
                dtRow("ContainerID") = lstShapes.SelectedItems(i).SubItems(intContainerID).Text()
                dtRow("ContainerTypeID") = lstShapes.SelectedItems(i).SubItems(intContainerTypeID).Text()
            Else
                '--- DOES NOT HAVE A CONTAINER, VALUES ARE SET TO 0
                dtRow("ContainerID") = EMPTY_INT
                dtRow("ContainerTypeID") = EMPTY_INT
            End If
            dtTable.Rows.Add(dtRow)
        Next
        dtTable.AcceptChanges()

        Return dtTable

    End Function


    '---------  RETURNS DataTable OF SHAPES/RELATIONS ALREADY ON PAGE
    '---------  RETURNS DataTable OF SHAPES/RELATIONS ALREADY ON PAGE
    '---------  RETURNS DataTable OF SHAPES/RELATIONS ALREADY ON PAGE
    Public Function fncDataTableFilterExistingItemsOnly(ByVal sqlTable As DataTable, ByVal booRelated As Boolean) As DataTable

        'Dim strID As String = IIf(booRelated = True, "Related_ID", "Principal_ID")
        'Dim strType As String = IIf(booRelated = True, "Related_TypeID", "Principal_TypeID")
        Dim strID As String = IIf(booRelated = True, "Item2 ID", "Item1 ID")
        Dim strType As String = IIf(booRelated = True, "Item2 TypeID", "Item1 ID")

        '--- FILTER OUT THOSE THAT ARE NOT ALREADY ON THE PAGE")
        For Each dsRow As DataRow In sqlTable.Rows
            If booShapeExists(dsRow.Item(strID), dsRow.Item(strType)) = False Then
                dsRow.Delete()
            End If
        Next

        sqlTable.AcceptChanges()

        Return sqlTable

    End Function



    '---------  RETURNS DataTable OF ITEMS NOT ALREADY ON PAGE
    Public Function fncDataTableFilterNonExistingItemsOnly(ByVal sqlTable As DataTable, ByVal booRelated As Boolean) As DataTable

        Dim strID As String = IIf(booRelated = True, "Related_ID", "Item_ID")
        Dim strType As String = IIf(booRelated = True, "Related_TypeID", "Item_TypeID")

        If sqlTable.Rows.Count > EMPTY_INT Then
            '--- FILTER OUT THOSE THAT ARE NOT ALREADY ON THE PAGE")
            For Each dsRow As DataRow In sqlTable.Rows
                If booShapeExists(dsRow.Item(strID), dsRow.Item(strType)) = True Then
                    dsRow.Delete()
                End If
            Next

            sqlTable.AcceptChanges()

        End If

        Return sqlTable

    End Function

    Public Function fncDataTableFilterDistinctAssocOnly(ByVal dt As DataTable) As DataTable

        Dim dtclone As DataTable = dt.Clone
        Dim dv As New DataView(dt)
        dv.Sort = "[Assoc ID], [Assoc TypeID]"
        Dim strAssocID As String = "Assoc ID"
        Dim intAssocIDOld As Integer = EMPTY_INT
        Dim strAssocTypeID As String = "Assoc TypeID"
        Dim intAssocTypeIDOld As Integer = EMPTY_INT
        For i As Integer = 0 To dv.Count - 1
            If intAssocIDOld <> dv(i)(strAssocID) Or _
                (intAssocIDOld = dv(i)(strAssocID) And intAssocTypeIDOld <> dv(i)(strAssocTypeID)) Then
                Dim drn As DataRow = dtclone.NewRow
                For y As Integer = 0 To drn.ItemArray.Length - 1
                    drn(y) = dv(i)(y)
                Next
                intAssocIDOld = dv(i)(strAssocID)
                intAssocTypeIDOld = dv(i)(strAssocTypeID)
                dtclone.Rows.Add(drn)
            End If
        Next

        Return dtclone

    End Function

    '---------  RETURNS DataTable OF RELATIONS NOT ALREADY ON PAGE
    Public Function fncDataTableFilterNonExistingAssocOnly(ByVal sqlTable As DataTable) As DataTable

        If sqlTable.Rows.Count > EMPTY_INT Then
            '--- FILTER OUT THOSE THAT ARE NOT ALREADY ON THE PAGE")
            For Each dsRow As DataRow In sqlTable.Rows
                If booShapeExists(dsRow.Item("Assoc ID"), dsRow.Item("Assoc TypeID")) = True Then
                    dsRow.Delete()
                End If
            Next

            sqlTable.AcceptChanges()

        End If

        Return sqlTable

    End Function


    '---------  RETURNS INDEX OF LISTVIEW COLUMN HEADER BY SEARCH NAME
    '---------  RETURNS INDEX OF LISTVIEW COLUMN HEADER BY SEARCH NAME
    '---------  RETURNS INDEX OF LISTVIEW COLUMN HEADER BY SEARCH NAME
    Public Function fncGetColumnHeaderIndex(ByVal strName As String, ByVal lstLV As ListView) As Integer

        Dim i As Integer = 0
        For Each chID As ColumnHeader In lstLV.Columns
            If UCase(chID.Text) = UCase(strName) Then
                Return i
                Exit Function
            End If
            i = i + 1
        Next

        '--- NEVER FOUND THE COLUMN BY THIS NAME, THROW ERROR
        MsgBox("ERROR : Invalid column name selected: " & strName)

    End Function

    '---------  SETS FOCUS ON EXISTING SHAPE OR SETS NEW SHAPE
    '---------  SETS FOCUS ON EXISTING SHAPE OR SETS NEW SHAPE
    '---------  SETS FOCUS ON EXISTING SHAPE OR SETS NEW SHAPE
    Public Function fncGetShape(ByVal TypeID As Integer, ByVal ID As Integer) As Visio.Shape

        '--- RELATED SHAPE ALREADY EXISTS, SET SHAPE TO IT
        Dim strMasterShapeType As String = fncSetMaster(TypeID)
        Dim strShapeName As String = strMasterShapeType & "." & CStr(ID)
        Dim visShapes As Visio.Shapes = g_visApp.ActivePage.Shapes

        Return visShapes(strShapeName)

    End Function

    '---------  SETS FOCUS ON EXISTING ITEM SHAPE OR SETS NEW ITEM SHAPE
    '---------  SETS FOCUS ON EXISTING ITEM SHAPE OR SETS NEW ITEM SHAPE
    '---------  SETS FOCUS ON EXISTING ITEM SHAPE OR SETS NEW ITEM SHAPE
    Public Function subDrawShape_Item(ByVal visShape As Visio.Shape, ByVal dsRow As DataRow, ByVal intRowindex As Integer, ByVal intNumShapes As Integer) As Visio.Shape

        Dim visShapeNew As Visio.Shape

        If booShapeExists(dsRow.Item("ShapeID"), dsRow.Item("ShapeTypeID")) = True Then
            '--- RELATED SHAPE ALREADY EXISTS, SET SHAPE TO IT
            visShapeNew = fncGetShape(dsRow.Item("ShapeTypeID"), dsRow.Item("ShapeID"))
        Else
            '--- DRAW THE NEW SHAPE ")
            Dim visStencil As Visio.Document
            Dim strMasterShapeType As String = fncSetMaster(dsRow.Item("ShapeTypeID"))
            Select Case CInt(dsRow.Item("AbstractionID"))
                Case ABSTRACTION_SYSTEM, ABSTRACTION_OBJECT
                    visStencil = g_visApp.Documents("System.vss")
                Case ABSTRACTION_BUSINESS, ABSTRACTION_STEP
                    visStencil = g_visApp.Documents("BusinessProcess.vss")
                Case ABSTRACTION_DEVICE
                    visStencil = g_visApp.Documents("Infrastructure.vss")
            End Select
            Dim visMaster As Visio.Master = visStencil.Masters(strMasterShapeType)
            Dim dblRelatedX, dblRelatedY As Double
            If intNumShapes = 1 And g_intAction = ACTIONITEM_RETRIEVE Then
                '--- THERE IS ONLY ONE SHAPE TO DRAW, SET ITS LOCATION TO SELECTED SHAPE
                dblRelatedY = visShape.Cells("PinY").ResultIU
                dblRelatedX = visShape.Cells("PinX").ResultIU
            Else
                Const CircleRadius = 2
                Dim dblDegreeInc As Double = (360 / intNumShapes)
                If g_intAction = ACTIONITEM_DRILLDOWN And g_booRelationReplace = False Then
                    dblRelatedX = visShape.Cells("PinX").ResultIU - ((intNumShapes * 0.75) / 2) + (intRowindex * 0.75)
                    dblRelatedY = visShape.Cells("PinY").ResultIU - (CircleRadius / 2)
                ElseIf g_intAction = ACTIONITEM_DRILLUP Then
                    If g_booRelationReplace = False Then
                        dblRelatedX = visShape.Cells("PinX").ResultIU
                        dblRelatedY = visShape.Cells("PinY").ResultIU + (CircleRadius / 2)
                    Else
                        dblRelatedX = visShape.Cells("PinX").ResultIU
                        dblRelatedY = visShape.Cells("PinY").ResultIU
                    End If
                Else
                    Const PI = 3.1415
                    Dim dblRadius As Double = (dblDegreeInc * intRowindex) * PI / 180
                    dblRelatedY = CircleRadius * System.Math.Sin(dblRadius) + visShape.Cells("PinY").ResultIU
                    dblRelatedX = CircleRadius * System.Math.Cos(dblRadius) + visShape.Cells("PinX").ResultIU
                End If
            End If
            visShapeNew = g_visApp.ActivePage.Drop(visMaster, dblRelatedX, dblRelatedY)
            subSetShapeSheet(dsRow, visShapeNew)
        End If

        Return visShapeNew

    End Function



    '---------  SETS FOCUS ON EXISTING ASSOC SHAPE OR SETS NEW ASSOC SHAPE
    '---------  SETS FOCUS ON EXISTING ASSOC SHAPE OR SETS NEW ASSOC SHAPE
    '---------  SETS FOCUS ON EXISTING ASSOC SHAPE OR SETS NEW ASSOC SHAPE
    Public Sub subDrawShape_Assoc(ByVal visShape As Visio.Shape, ByVal dsRow As DataRow)

        Dim visShapeAssoc As Visio.Shape

        If booShapeExists(dsRow.Item("Assoc_ID"), dsRow.Item("Assoc_TypeID")) = True Then
            '--- RELATION SHAPE ALREADY EXISTS, SET SHAPE TO IT
            visShapeAssoc = fncGetShape(dsRow.Item("Assoc_TypeID"), dsRow.Item("Assoc_ID"))
        Else
            '--- LOCATE THE BEGIN AND END ITEM SHAPES
            Dim visShapes As Visio.Shapes = g_visApp.ActivePage.Shapes
            Dim strShapeName As String
            Dim visShapeEnd, visShapeBegin As Visio.Shape
            If booShapeExists(dsRow.Item("Begin_ID"), dsRow.Item("Begin_TypeID")) = True Then
                strShapeName = fncSetMaster(dsRow.Item("Begin_TypeID")) & "." & CStr(dsRow.Item("Begin_ID"))
                visShapeBegin = visShapes(strShapeName)
            Else
                '--- ITEM DOESNT EXIST, DONT DRAW RELATION
                Exit Sub
            End If
            If booShapeExists(dsRow.Item("End_ID"), dsRow.Item("End_TypeID")) = True Then
                strShapeName = fncSetMaster(dsRow.Item("End_TypeID")) & "." & CStr(dsRow.Item("End_ID"))
                visShapeEnd = visShapes(strShapeName)
            Else
                '--- ITEM DOESNT EXIST, DONT DRAW RELATION
                Exit Sub
            End If

            '--- SET THE RELATION SHAPE, DOESNT REALLY MATTER FROM WHICH STENCIL
            Dim visStencil As Visio.Document = g_visApp.Documents("System.vss")
            Dim visMaster As Visio.Master = visStencil.Masters("Relation")
            visShapeAssoc = g_visApp.ActivePage.Drop(visMaster, visShapeBegin.Cells("PinX").ResultIU, visShapeBegin.Cells("PinY").ResultIU)
            subSetShapeSheet(dsRow, visShapeAssoc)
            'subSetShapeSheet(dsRow, visShapeAssoc, True)

            '--- HOOK UP ITEM SHAPES
            visShapeAssoc.Cells("BeginX").GlueTo(visShapeBegin.Cells("PinX"))
            visShapeAssoc.Cells("EndX").GlueTo(visShapeEnd.Cells("PinX"))
            visShapeAssoc.Cells("BeginY").GlueTo(visShapeBegin.Cells("PinY"))
            visShapeAssoc.Cells("EndY").GlueTo(visShapeEnd.Cells("PinY"))

            '*** SET LINE PATTERN ACCORDING TO RELATION TYPE/ABSTRACTION
            Select Case CInt(dsRow.Item("Assoc_AbstractionID"))
                Case ABSTRACTION_DEVICEOBJECT, ABSTRACTION_STEPOBJECT
                    subSetLinePatternContains(visShapeAssoc)
                Case ABSTRACTION_SYSTEM, ABSTRACTION_BUSINESS
                    subSetLinePatternContains(visShapeAssoc)
                    subSetLineArrowNone(visShapeAssoc)
                Case ABSTRACTION_SYSTEMOBJECT, ABSTRACTION_BUSINESSSTEP
                    subSetLinePatternContainment(visShapeAssoc)
            End Select

        End If

    End Sub



    '''--- FILTER OUT SHAPES BY SHAPE TYPE
    '''--- FILTER OUT SHAPES BY SHAPE TYPE
    '''--- FILTER OUT SHAPES BY SHAPE TYPE
    Public Function fncDataTableFilterShapeType(ByVal lstCriteria As ListView, ByVal sqlTable As DataTable) As DataTable

        Dim sqlRow As DataRow
        For Each sqlRow In sqlTable.Rows
            Dim booDeleteRow = True
            For i As Integer = 0 To lstCriteria.Items.Count - 1
                If CInt(sqlRow.Item("Item2 TypeID").ToString) = CInt(lstCriteria.Items(i).Text) Then
                    booDeleteRow = False
                    Exit For
                End If
            Next
            If booDeleteRow = True Then
                sqlRow.Delete()

            End If
        Next
        sqlTable.AcceptChanges()

        Return sqlTable

    End Function


    Public Sub subSetColorUnmark(ByVal visShape As Visio.Shape)

        visShape.Cells("LineColor").ResultIUForce = 0

    End Sub

    Public Sub subSetColorValid(ByVal visShape As Visio.Shape)

        visShape.Cells("LineColor").ResultIUForce = 9

    End Sub

    Public Sub subSetColorInvalid(ByVal visShape As Visio.Shape)

        visShape.Cells("LineColor").ResultIUForce = 2

    End Sub

    Public Sub subSetLinePatternContainment(ByVal visShape As Visio.Shape)

        visShape.Cells("LinePattern").ResultIUForce = LINEFORMAT_LINEPATTERN_SLASH

    End Sub

    Public Sub subSetLinePatternContains(ByVal visShape As Visio.Shape)

        visShape.Cells("LinePattern").ResultIUForce = LINEFORMAT_LINEPATTERN_DOT

    End Sub

    Public Sub subSetLineArrowNone(ByVal visShape As Visio.Shape)

        visShape.Cells("EndArrow").ResultIUForce = LINEFORMAT_ARROW_NONE

    End Sub


    Public Function PopulateDataTable_SelectedShapes(ByVal visShape As Visio.Shape, ByVal dtTable1 As DataTable, ByVal dtTable2 As DataTable) As DataTable

        For i As Integer = 0 To dtTable2.Rows.Count - 1
            Dim dtRow As DataRow = dtTable1.NewRow
            dtRow("Assoc ID") = dtTable2.Rows(i).Item("Assoc ID")
            dtRow("Assoc Name") = dtTable2.Rows(i).Item("Assoc Name")
            dtRow("Assoc Desc") = dtTable2.Rows(i).Item("Assoc Desc")
            dtRow("Assoc TypeID") = dtTable2.Rows(i).Item("Assoc TypeID")
            dtRow("Assoc AbstractionID") = dtTable2.Rows(i).Item("Assoc AbstractionID")
            '---- ALWAYS SET RELATED SHAPE AS ITEM2
            If visShape.Cells("Prop.ShapeID").ResultIU = dtTable2.Rows(i).Item("Item1 ID") Then
                dtRow("Assoc Direction") = dtTable2.Rows(i).Item("Assoc Direction")
                dtRow("Item1 TableID") = dtTable2.Rows(i).Item("Item1 TableID")
                dtRow("Item1 ID") = dtTable2.Rows(i).Item("Item1 ID")
                dtRow("Item1 Name") = dtTable2.Rows(i).Item("Item1 Name")
                dtRow("Item1 Desc") = dtTable2.Rows(i).Item("Item1 Desc")
                dtRow("Item1 TypeID") = dtTable2.Rows(i).Item("Item1 TypeID")
                dtRow("Item1 TypeName") = dtTable2.Rows(i).Item("Item1 TypeName")
                dtRow("Item1 AbstractionID") = dtTable2.Rows(i).Item("Item1 AbstractionID")
                dtRow("Item1Container ID") = dtTable2.Rows(i).Item("Item1Container ID")
                dtRow("Item1Container TypeID") = dtTable2.Rows(i).Item("Item1Container TypeID")
                dtRow("Item1Container Name") = dtTable2.Rows(i).Item("Item1Container Name")
                dtRow("Item2 TableID") = dtTable2.Rows(i).Item("Item2 TableID")
                dtRow("Item2 ID") = dtTable2.Rows(i).Item("Item2 ID")
                dtRow("Item2 Name") = dtTable2.Rows(i).Item("Item2 Name")
                dtRow("Item2 Desc") = dtTable2.Rows(i).Item("Item2 Desc")
                dtRow("Item2 TypeID") = dtTable2.Rows(i).Item("Item2 TypeID")
                dtRow("Item2 TypeName") = dtTable2.Rows(i).Item("Item2 TypeName")
                dtRow("Item2 AbstractionID") = dtTable2.Rows(i).Item("Item2 AbstractionID")
                dtRow("Item2Container ID") = dtTable2.Rows(i).Item("Item2Container ID")
                dtRow("Item2Container TypeID") = dtTable2.Rows(i).Item("Item2Container TypeID")
                dtRow("Item2Container Name") = dtTable2.Rows(i).Item("Item2Container Name")
            Else
                dtRow("Assoc Direction") = "FROM"
                dtRow("Item1 TableID") = dtTable2.Rows(i).Item("Item2 TableID")
                dtRow("Item1 ID") = dtTable2.Rows(i).Item("Item2 ID")
                dtRow("Item1 Name") = dtTable2.Rows(i).Item("Item2 Name")
                dtRow("Item1 Desc") = dtTable2.Rows(i).Item("Item2 Desc")
                dtRow("Item1 TypeID") = dtTable2.Rows(i).Item("Item2 TypeID")
                dtRow("Item1 TypeName") = dtTable2.Rows(i).Item("Item2 TypeName")
                dtRow("Item1 AbstractionID") = dtTable2.Rows(i).Item("Item2 AbstractionID")
                dtRow("Item1Container ID") = dtTable2.Rows(i).Item("Item2Container ID")
                dtRow("Item1Container TypeID") = dtTable2.Rows(i).Item("Item2Container TypeID")
                dtRow("Item1Container Name") = dtTable2.Rows(i).Item("Item2Container Name")
                dtRow("Item2 TableID") = dtTable2.Rows(i).Item("Item1 TableID")
                dtRow("Item2 ID") = dtTable2.Rows(i).Item("Item1 ID")
                dtRow("Item2 Name") = dtTable2.Rows(i).Item("Item1 Name")
                dtRow("Item2 Desc") = dtTable2.Rows(i).Item("Item1 Desc")
                dtRow("Item2 TypeID") = dtTable2.Rows(i).Item("Item1 TypeID")
                dtRow("Item2 TypeName") = dtTable2.Rows(i).Item("Item1 TypeName")
                dtRow("Item2 AbstractionID") = dtTable2.Rows(i).Item("Item1 AbstractionID")
                dtRow("Item2Container ID") = dtTable2.Rows(i).Item("Item1Container ID")
                dtRow("Item2Container TypeID") = dtTable2.Rows(i).Item("Item1Container TypeID")
                dtRow("Item2Container Name") = dtTable2.Rows(i).Item("Item1Container Name")
            End If
            dtTable1.Rows.Add(dtRow)
        Next

        dtTable1.AcceptChanges()

        Return dtTable1

    End Function


    Public Sub subPopulateListView_Assoc(ByVal lstShapes As ListView, ByVal SQLTableDup As DataTable)

        '---GRAB MAX COLUMM WIDTH 
        Dim c As DataColumn
        For Each c In SQLTableDup.Columns

            'adding names of columns as Listview columns
            Dim h As New ColumnHeader

            '--- MAKE THIS THE STANDARD WIDTH UNLESS OTHERWISE STATED
            Select Case c.ColumnName
                Case "Assoc Name", _
                        "Item1Container Name", "Item1 TypeName", "Item1 Name", _
                        "Item2Container Name", "Item2 TypeName", "Item2 Name"
                    h.Width = lstShapes.Width / 7
                Case Else
                    h.Width = 0
            End Select
            h.Text = IIf(c.ColumnName = "Assoc Name", "Association", c.ColumnName)
            lstShapes.Columns.Add(h)
        Next

        Dim SQLTable As DataTable = fncDataTableFilterDistinctAssocOnly(SQLTableDup)

        Dim strArray(SQLTable.Columns.Count) As String
        'adding Datarows as listview Grids
        Dim rr As DataRow
        For Each rr In SQLTable.Rows
            For col As Integer = 0 To SQLTable.Columns.Count - 1
                strArray(col) = rr(col).ToString()
            Next
            Dim ii As New ListViewItem(strArray)
            lstShapes.Items.Add(ii)
        Next

        '--- SELECT ALL FIRST
        For i As Integer = 0 To lstShapes.Items.Count - 1
            lstShapes.Items(i).Selected = True
            lstShapes.Select()
        Next

    End Sub



    Public Sub subSetShapeSheet(ByVal dsRow As DataRow, ByRef visShape As Visio.Shape)

        If visShape.Cells("Prop.AbstractionID").ResultIU = ABSTRACTION_RELATION Then

            '---- SET SHAPE ACTION VALUES
            visShape.Cells("Actions.EditVisio.Disabled").ResultIU = VISIO_DISABLED
            visShape.Cells("Actions.Properties.Disabled").ResultIU = VISIO_ENABLED
            visShape.Cells("Actions.Reconnect.Disabled").ResultIU = VISIO_ENABLED
            visShape.Cells("Actions.Validate.Disabled").ResultIU = VISIO_ENABLED

            '---- SET SHAPE PROPERTIES VALUES
            visShape.Name = "Relation." & dsRow.Item("Assoc_ID")
            visShape.Cells("Prop.ShapeID").ResultIUForce = dsRow.Item("Assoc_ID")
            visShape.Cells("Prop.ShapeTypeID").ResultIUForce = dsRow.Item("Assoc_TypeID")
            visShape.Text = dsRow.Item("Assoc_Name").ToString
            visShape.Cells("Prop.ShapeName").FormulaForce = """" & CStr(dsRow.Item("Assoc_Name").ToString) & """"
            visShape.Cells("Prop.ShapeDesc").FormulaForce = """" & CStr(dsRow.Item("Assoc_Desc").ToString) & """"
            visShape.Cells("Prop.AbstractionID").FormulaForce = ABSTRACTION_RELATION
            visShape.Cells("Prop.BeginTypeID").FormulaForce = dsRow.Item("Begin_TypeID")
            visShape.Cells("Prop.BeginID").FormulaForce = dsRow.Item("Begin_ID")
            visShape.Cells("Prop.EndTypeID").FormulaForce = dsRow.Item("End_TypeID")
            visShape.Cells("Prop.EndID").FormulaForce = dsRow.Item("End_ID")

            '---- SET SHAPE APPEARANCE VALUES
            visShape.Cells("LineWeight").Formula = LINEFORMAT_LINEWEIGHT

        Else
            '---- SET SHAPE ACTION VALUES        
            visShape.Cells("Actions.DrillDown.Disabled").ResultIU = VISIO_ENABLED
            visShape.Cells("Actions.DrillUp.Disabled").ResultIU = VISIO_ENABLED
            visShape.Cells("Actions.Properties.Disabled").ResultIU = VISIO_ENABLED
            visShape.Cells("Actions.RelationBusinessProcess.Disabled").ResultIU = VISIO_ENABLED
            visShape.Cells("Actions.RelationInfrastructure.Disabled").ResultIU = VISIO_ENABLED
            visShape.Cells("Actions.RelationSystem.Disabled").ResultIU = VISIO_ENABLED
            visShape.Cells("Actions.Retrieve.Disabled").ResultIU = VISIO_ENABLED
            visShape.Cells("Actions.EditVisio.Disabled").ResultIU = VISIO_ENABLED
            visShape.Cells("Actions.Validate.Disabled").ResultIU = VISIO_ENABLED

            '---- SET SHAPE PROPERTIES VALUES
            visShape.Name = CStr(fncSetMaster(dsRow.Item("ShapeTypeID"))) & "." & CStr(dsRow.Item("ShapeID"))
            visShape.Text = dsRow.Item("ShapeName")
            visShape.Cells("Prop.ShapeID").ResultIUForce = dsRow.Item("ShapeID")
            visShape.Cells("Prop.ShapeTypeID").ResultIUForce = dsRow.Item("ShapeTypeID")
            visShape.Cells("Prop.ShapeName").FormulaForce = """" & dsRow.Item("ShapeName") & """"
            visShape.Cells("Prop.ShapeDesc").FormulaForce = """" & Replace(dsRow.Item("ShapeDesc").ToString, """", "'") & """"
            visShape.Cells("Prop.ContainerID").ResultIUForce = dsRow.Item("ContainerID")
            visShape.Cells("Prop.ContainerTypeID").ResultIUForce = dsRow.Item("ContainerTypeID")

            ''---- SET SHAPE APPEARANCE VALUES IF ITS CONTAINER SHAPE IS ALREADY ON PAGE
            If booShapeExists(visShape.Cells("Prop.ContainerID").ResultIU, visShape.Cells("Prop.ContainerTypeID").ResultIU) = True Then
                Dim visContainer = fncGetShape(visShape.Cells("Prop.ContainerTypeID").ResultIU, visShape.Cells("Prop.ContainerID").ResultIU)
                visShape.Cells("FillBkgndTrans").FormulaForce() = visContainer.Cells("FillBkgndTrans").ResultStr(33)
                visShape.Cells("FillPattern").ResultIUForce = visContainer.Cells("FillPattern").ResultIU
                visShape.Cells("FillForegnd").Formula = visContainer.Cells("FillForegnd").ResultIU
            End If

        End If

    End Sub


    '---- DELETES A SHAPE AND ALL ITS RELATIONS
    '---- DELETES A SHAPE AND ALL ITS RELATIONS
    '---- DELETES A SHAPE AND ALL ITS RELATIONS
    Public Sub subDeleteShape(ByVal visShape As Visio.Shape)

        '--- DELETE RELATIONS
        Do While visShape.FromConnects.Count > 0
            visShape.FromConnects.Item(1).FromSheet.Delete()
        Loop
        '--- DELETE SHAPE
        visShape.Delete()

    End Sub


    '---- DELETES A SHAPE'S RELATIONS
    '---- DELETES A SHAPE'S RELATIONS
    '---- DELETES A SHAPE'S RELATIONS
    Public Sub subDeleteRelations(ByVal visShape As Visio.Shape)

        '--- DELETE RELATIONS
        Do While visShape.FromConnects.Count > 0
            visShape.FromConnects.Item(1).FromSheet.Delete()
        Loop

    End Sub



    Public Function booShowListViewCol(ByVal visShape As Visio.Shape) As Boolean

        Select Case g_intAction
            Case ACTIONITEM_DRILLDOWN
                Return False
            Case ACTIONITEM_INFRASTRUCTURE
                Return IIf(visShape.Cells("Prop.AbstractionID").ResultIU = ABSTRACTION_DEVICE, True, False)
            Case ACTIONITEM_SYSTEM
                Return IIf(visShape.Cells("Prop.AbstractionID").ResultIU = ABSTRACTION_OBJECT, True, False)
            Case ACTIONITEM_BUSINESSPROCESS
                Return IIf(visShape.Cells("Prop.AbstractionID").ResultIU = ABSTRACTION_STEP, True, False)
        End Select

    End Function


    '---------  CHECKS IF FORM REFERS TO THE CORRECT SHAPE
    '---------  CHECKS IF FORM REFERS TO THE CORRECT SHAPE
    '---------  CHECKS IF FORM REFERS TO THE CORRECT SHAPE
    Public Function booFormValid(ByVal frm As Form, ByVal visShape As Visio.Shape) As Boolean

        Select Case frm.Name
            Case "frmRelation", "frmDrillDown", "frmDrillUp", "frmRelateShape", "frmRelateShapes"
                If visShape.CellExists("Prop.AbstractionID", False) = True Then
                    If visShape.Cells("Prop.ShapeID").ResultIU > EMPTY_INT Then
                        If visShape.Cells("Prop.AbstractionID").ResultIU <> ABSTRACTION_RELATION Then
                            Return True
                        Else
                            MsgBox("This is a Relation. Please choose a SMARTS Shape instead.")
                            Return False
                        End If
                    Else
                        MsgBox("This is an unassigned SMARTS Shape/Relation. Please assign a SMARTS Shape first.")
                        Return False
                    End If
                Else
                    MsgBox("This is not a SMARTS Shape/Relation. Please choose a SMARTS Shape instead.")
                    Return False
                End If
            Case "frmRetrieveShape"
                If visShape.CellExists("Prop.AbstractionID", False) = True Then
                    If visShape.Cells("Prop.AbstractionID").ResultIU <> ABSTRACTION_RELATION Then
                        Return True
                    Else
                        MsgBox("This is a Relation. Please choose a SMARTS Shape instead.")
                        Return False
                    End If
                Else
                    MsgBox("This is not a SMARTS Shape/Relation. Please choose a SMARTS Shape instead.")
                    Return False
                End If
            Case "frmValidate"
                If visShape.CellExists("Prop.AbstractionID", False) = True Then
                    If visShape.Cells("Prop.ShapeID").ResultIU > EMPTY_INT Then
                        Return True
                    Else
                        MsgBox("This is an unassigned SMARTS Shape/Relation. Please assign a SMARTS Shape/Relation first.")
                        Return False
                    End If
                Else
                    MsgBox("This is not a SMARTS Shape/Relation. Please choose a SMARTS Shape/Relation instead.")
                    Return False
                End If
        End Select

    End Function


    Public Function booAssociationValid(ByVal visShape As Visio.Shape, ByVal intBegin As Integer, ByVal intEnd As Integer) As Boolean

        If visShape.Connects.Count = 2 Then
            If visShape.Connects(1).ToCell.Shape.CellExists("Prop.ShapeID", False) = True And _
                visShape.Connects(2).ToCell.Shape.CellExists("Prop.ShapeID", False) = True Then
                If visShape.Connects(1).ToCell.Shape.Cells("Prop.ShapeID").ResultIU = intBegin And visShape.Connects(2).ToCell.Shape.Cells("Prop.ShapeID").ResultIU = intEnd Then
                    Return True
                Else
                    Return False
                End If
            Else
                '--- JUST ON THE OFF CHANCE THAT CONNECTOR IS BROKEN
                MsgBox("An association is not connected. Please reconnect to shape")
                Return False
            End If
        Else
            MsgBox("A relation is not connected. Please reconnect to shape")
            Return False
        End If

    End Function


    Public Sub subReconnect(ByVal visShape As Visio.Shape)

        '--FIND BEGIN SHAPE
        Dim visShapes As Visio.Shapes = g_visApp.ActivePage.Shapes
        Dim strShapeName As String
        Dim visShapeBegin As Visio.Shape
        Dim visShapeEnd As Visio.Shape
        If booShapeExists(visShape.Cells("Prop.BeginID").ResultIU, visShape.Cells("Prop.BeginTypeID").ResultIU) = True Then
            '--RECONNECT TO SHAPE
            strShapeName = fncSetMaster(visShape.Cells("Prop.BeginTypeID").ResultIU) & "." & visShape.Cells("Prop.BeginID").ResultIU
            visShapeBegin = visShapes(strShapeName)
        Else
            subSetColorInvalid(visShape)
            MsgBox("Connected shape no longer exists on this page.")
            Exit Sub
        End If

        '--FIND END SHAPE
        If booShapeExists(visShape.Cells("Prop.EndID").ResultIU, visShape.Cells("Prop.EndTypeID").ResultIU) = True Then
            '--RECONNECT TO SHAPE
            strShapeName = fncSetMaster(visShape.Cells("Prop.EndTypeID").ResultIU) & "." & visShape.Cells("Prop.EndID").ResultIU
            visShapeEnd = visShapes(strShapeName)
        Else
            subSetColorInvalid(visShape)
            MsgBox("Connected shape no longer exists on this page.")
            Exit Sub
        End If

        '--RECONNECT TO SHAPE
        visShape.Cells("BeginX").GlueTo(visShapeBegin.Cells("PinX"))
        visShape.Cells("EndX").GlueTo(visShapeEnd.Cells("PinX"))


    End Sub


    Public Sub subProperties(ByVal visShape As Visio.Shape)

        Dim xmldoc As New MSXML.DOMDocument

        'only shapes contained in the DB are retrievable
        If visShape.Cells("Prop.ShapeID").ResultIU > 0 Then

            'GET URL PATH FROM smarts.xml
            xmldoc.load("SMARTS.xml")
            Dim strURL As String
            Select Case visShape.Cells("Prop.AbstractionID").ResultIU
                Case ABSTRACTION_RELATION
                    Select Case visShape.Cells("Prop.ShapeTypeID").ResultIU
                        Case SHAPETYPE_STEPRELATION, SHAPETYPE_OBJECTRELATION, SHAPETYPE_DEVICERELATION
                            strURL = """" & CStr(Replace(xmldoc.getElementsByTagName("WebURLRelation").item(0).text, """", "")) & fncURLQueryString(visShape) & """"
                        Case Else
                            MsgBox("No additional information exists. Try drilling up/down for additional property information.")
                            Exit Sub
                    End Select
                Case Else
                    '--- ITEM SHAPE, SELECT appropriate aspx 
                    Select Case visShape.Cells("Prop.AbstractionID").ResultIU
                        Case ABSTRACTION_SYSTEM
                            strURL = """" & CStr(Replace(xmldoc.getElementsByTagName("WebURLSystem").item(0).text, """", "")) & fncURLQueryString(visShape) & """"
                        Case ABSTRACTION_OBJECT
                            strURL = """" & CStr(Replace(xmldoc.getElementsByTagName("WebURLObject").item(0).text, """", "")) & fncURLQueryString(visShape) & """"
                        Case ABSTRACTION_DEVICE
                            strURL = """" & CStr(Replace(xmldoc.getElementsByTagName("WebURLDevice").item(0).text, """", "")) & fncURLQueryString(visShape) & """"
                        Case ABSTRACTION_BUSINESS
                            strURL = """" & CStr(Replace(xmldoc.getElementsByTagName("WebURLBusinessProcess").item(0).text, """", "")) & fncURLQueryString(visShape) & """"
                        Case ABSTRACTION_STEP
                            strURL = """" & CStr(Replace(xmldoc.getElementsByTagName("WebURLStep").item(0).text, """", "")) & fncURLQueryString(visShape) & """"
                        Case Else
                            MsgBox("Properties unavailable. Please select another.")
                    End Select
            End Select

            xmldoc = Nothing
            '--- OPEN SMARTBROWSER
            Process.Start("IExplore.exe", strURL)
        Else
            '---SHAPE IS NOT IN THE DB
            MsgBox("Properties unavailable. Please select another.")
        End If


    End Sub

    'Public Sub subRelation()

    '    Dim frm As frmRelation = New frmRelation
    '    frm.ShowDialog()

    'End Sub

    Public Sub subRelate()

        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection

        If visSelection.Count = 1 Then
            Dim frmShape As frmRelateShape = New frmRelateShape
            frmShape.ShowDialog()
        Else
            Dim frmShapes As frmRelateShapes = New frmRelateShapes
            frmShapes.ShowDialog()
        End If


    End Sub

    Public Sub subRetrieve()

        '---GET ABSTRACTION TO DETERMINE WHICH FORM TO OPEN
        Dim frmRetrieve As frmRetrieveShape = New frmRetrieveShape
        frmRetrieve.ShowDialog()

    End Sub

    Public Sub subEditVisio()

        '---GET ABSTRACTION TO DETERMINE WHICH FORM TO OPEN
        Dim frmEdit As frmEditVisio = New frmEditVisio
        frmEdit.ShowDialog()

    End Sub


    Public Sub subValidate()

        '---OPEN FORM TO VALIDATE/REFRESH
        Dim frm As frmValidate = New frmValidate
        frm.ShowDialog()

    End Sub

    '---SHAPE DROP - NOTHING BUT A PLACEHOLDER FOR NOW
    Public Sub subShapeDrop()

    End Sub

    Public Sub subSummarize()

    End Sub


    Public Sub subListViewSort(ByVal sender As Object, ByVal e As System.Windows.Forms.ColumnClickEventArgs, ByVal lstView As ListView)

        ' Determine whether the column is the same as the last column clicked.
        If e.Column <> sortColumn Then
            ' Set the sort column to the new column.
            sortColumn = e.Column
            ' Set the sort order to ascending by default.
            lstView.Sorting = SortOrder.Ascending
        Else
            If lstView.Sorting = SortOrder.Ascending Then
                lstView.Sorting = SortOrder.Descending
            Else
                lstView.Sorting = SortOrder.Ascending
            End If
        End If
        lstView.Sort()
        lstView.ListViewItemSorter = New ListViewItemComparer(e.Column, lstView.Sorting)
    End Sub


    Public Sub subListViewSelectAll(ByVal sender As System.Object, ByVal e As System.EventArgs, ByVal lstView As ListView)

        For i As Integer = 0 To lstView.Items.Count - 1
            lstView.Items(i).Selected = True
            lstView.Select()
        Next

    End Sub

    Public Sub subListViewClearAll(ByVal sender As System.Object, ByVal e As System.EventArgs, ByVal lstView As ListView)

        For i As Integer = 0 To lstView.Items.Count - 1
            lstView.Items(i).Selected = False
        Next

    End Sub

    Public Sub subCheckListBoxSelectAll(ByVal sender As System.Object, ByVal e As System.EventArgs, ByVal clbList As CheckedListBox)

        For i As Integer = 0 To clbList.Items.Count - 1
            clbList.SetItemChecked(i, True)
        Next

    End Sub

    Public Sub subCheckListBoxClearAll(ByVal sender As System.Object, ByVal e As System.EventArgs, ByVal clbList As CheckedListBox)

        For i As Integer = 0 To clbList.Items.Count - 1
            clbList.SetItemChecked(i, False)
        Next

    End Sub

    Private Sub InitializeComponent()
        '
        'BaseClass
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 266)
        Me.Name = "BaseClass"

    End Sub


End Class
