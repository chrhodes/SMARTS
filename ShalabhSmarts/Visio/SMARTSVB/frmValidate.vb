Imports Microsoft.Office.Interop
Imports PacificLife.Life.Enterprise.Data

Public Class frmValidate
    Inherits BaseClass


#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents btnSubmit As System.Windows.Forms.Button
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents btnUnmark As System.Windows.Forms.RadioButton
    Friend WithEvents btnRefresh As System.Windows.Forms.RadioButton
    Friend WithEvents btnVerify As System.Windows.Forms.RadioButton
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.btnSubmit = New System.Windows.Forms.Button
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.btnUnmark = New System.Windows.Forms.RadioButton
        Me.btnRefresh = New System.Windows.Forms.RadioButton
        Me.btnVerify = New System.Windows.Forms.RadioButton
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'btnSubmit
        '
        Me.btnSubmit.Location = New System.Drawing.Point(272, 16)
        Me.btnSubmit.Name = "btnSubmit"
        Me.btnSubmit.Size = New System.Drawing.Size(64, 32)
        Me.btnSubmit.TabIndex = 11
        Me.btnSubmit.Text = "Submit"
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.btnUnmark)
        Me.GroupBox1.Controls.Add(Me.btnRefresh)
        Me.GroupBox1.Controls.Add(Me.btnVerify)
        Me.GroupBox1.Location = New System.Drawing.Point(8, 8)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(256, 40)
        Me.GroupBox1.TabIndex = 10
        Me.GroupBox1.TabStop = False
        '
        'btnUnmark
        '
        Me.btnUnmark.Location = New System.Drawing.Point(176, 8)
        Me.btnUnmark.Name = "btnUnmark"
        Me.btnUnmark.Size = New System.Drawing.Size(72, 24)
        Me.btnUnmark.TabIndex = 4
        Me.btnUnmark.Text = "Unmark"
        '
        'btnRefresh
        '
        Me.btnRefresh.Checked = True
        Me.btnRefresh.Location = New System.Drawing.Point(16, 8)
        Me.btnRefresh.Name = "btnRefresh"
        Me.btnRefresh.Size = New System.Drawing.Size(80, 24)
        Me.btnRefresh.TabIndex = 2
        Me.btnRefresh.TabStop = True
        Me.btnRefresh.Text = "Refresh"
        '
        'btnVerify
        '
        Me.btnVerify.Location = New System.Drawing.Point(104, 8)
        Me.btnVerify.Name = "btnVerify"
        Me.btnVerify.Size = New System.Drawing.Size(72, 24)
        Me.btnVerify.TabIndex = 3
        Me.btnVerify.Text = "Verify"
        '
        'frmValidate
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(352, 62)
        Me.Controls.Add(Me.btnSubmit)
        Me.Controls.Add(Me.GroupBox1)
        Me.Name = "frmValidate"
        Me.Text = "frmValidate"
        Me.GroupBox1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub frmValidate_Unload(ByVal Cancel As Integer)

        If Cancel = 1 Then
            Dim frm As frmValidate = New frmValidate
            Hide()
            frm.Close()
            frm.Dispose()
        End If

    End Sub

    Private Sub btnSubmit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        '---SET FOCUS ON SELECTED SHAPE
        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection
        '---CREATE SQL DataTable
        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        '--DETERMINE IF VALIDATING ONE SHAPE OR ENTIRE SHEET
        If g_intAction = ACTIONITEM_VALIDATESHEET Then
            Dim visShape As Visio.Shape
            Dim visShapes As Visio.Shapes = g_visApp.ActivePage.Shapes
            For Each visShape In visShapes
                subValidateShape(visshape, sqlConn)
            Next
        Else
            If visSelection.Count = 0 Then
                '---NOTHING WAS SELECTED, RAISE ERRORMSG
                MsgBox("Please select a SMARTS Shape first.")
            Else
                Dim visShape As Visio.Shape = visSelection.Item(1)
                If booFormValid(Me, visShape) Then
                    subValidateShape(visshape, sqlConn)

                End If
            End If
        End If

        sqlConn.Close()

        '---UNLOAD FORM
        frmValidate_Unload(1)

    End Sub

    Private Sub subValidateShape(ByVal visShape As Visio.Shape, ByVal sqlConn As PLDbConnection)

        If visShape.CellExists("Prop.AbstractionID", False) = True Then

            If btnRefresh.Checked = True Then
                subRefresh(visShape, sqlConn)
                If visShape.Cells("Prop.AbstractionID").ResultIU = ABSTRACTION_RELATION Then
                    subReconnect(visShape)
                End If
            ElseIf btnVerify.Checked = True Then
                subVerify(visShape, sqlConn)
            Else
                subUnmark(visShape)
            End If

        End If

    End Sub

    Private Sub subRefresh(ByVal visShape As Visio.Shape, ByVal sqlCOnn As PLDbConnection)

        Dim strSQL As String
        If visShape.Cells("Prop.AbstractionID").ResultIU = ABSTRACTION_RELATION Then
            '--- REFRESH SHAPE RELATION
            If visShape.Cells("Prop.ShapeTypeID").ResultIU = SHAPETYPE_CROSSRELATION Then
                strSQL = "EXEC GetAssociation '" & CStr(TABLE_CONTAINER) & "'," & CStr(visShape.Cells("Prop.ShapeID").ResultIU) & "; "
            Else
                strSQL = "EXEC GetAssociation '" & CStr(TABLE_RELATION) & "'," & CStr(visShape.Cells("Prop.ShapeID").ResultIU) & "; "
            End If
        Else
            '--- REFRESH SHAPE ITEM
            strSQL = "EXEC GetShape " & CStr(visShape.Cells("Prop.ShapeID").ResultIU)
        End If

        '---REFRESHES SHAPE INFO
        If Len(Trim(strSQL)) > EMPTY_INT Then

            Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlCOnn)
            Dim sqlAdapter As PLDbDataAdapter = New PLDbDataAdapter(sqlCmd)
            Dim sqlSet As New DataSet
            sqlAdapter.Fill(sqlSet)

            If sqlSet.Tables.Count > EMPTY_INT Then
                Dim dsNew As DataSet
                If visShape.Cells("Prop.AbstractionID").ResultIU = ABSTRACTION_RELATION Then
                    dsNew = MassageDataSet_Assoc(sqlSet)
                    subRefreshShapes(dsNew, True)
                Else
                    dsNew = MassageDataSet_Item(sqlSet)
                    subRefreshShapes(dsNew, False)
                End If
            End If

        End If


    End Sub


    Private Sub subRefreshShapes(ByVal sqlSet As DataSet, ByVal booRelation As Boolean)

        Dim strTypeID As String = IIf(booRelation = False, "ShapeTypeID", "Assoc_TypeID")
        Dim strID As String = IIf(booRelation = False, "ShapeID", "Assoc_ID")

        Dim visShapeNew As Visio.Shape
        Dim dsRow As DataRow
        For i As Integer = 0 To sqlSet.Tables.Count - 1
            For j As Integer = 0 To sqlSet.Tables(i).Rows.Count - 1
                dsRow = sqlSet.Tables(i).Rows(j)
                '--- ITEM ALREADY EXISTS, SET SHAPE TO IT AND OVERRIDE PROPERTIES
                visShapeNew = fncGetShape(dsRow.Item(strTypeID), dsRow.Item(strID))
                If booRelation = True Then
                    subReconnect(visShapeNew)
                End If
                subSetShapeSheet(dsRow, visShapeNew)
            Next
        Next

    End Sub


    Private Function MassageDataSet_Assoc(ByVal sqlSet As DataSet) As DataSet

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

        Dim dtRow As DataRow = dtTable.NewRow
        dtRow("Assoc_TypeID") = sqlSet.Tables(0).Rows(0).Item("Assoc TypeID")
        dtRow("Assoc_ID") = sqlSet.Tables(0).Rows(0).Item("Assoc ID")
        dtRow("Assoc_Name") = sqlSet.Tables(0).Rows(0).Item("Assoc Name")
        dtRow("Assoc_Desc") = sqlSet.Tables(0).Rows(0).Item("Assoc Desc")
        dtRow("Assoc_AbstractionID") = sqlSet.Tables(0).Rows(0).Item("Assoc AbstractionID")
        If sqlSet.Tables(0).Rows(0).Item("Assoc Direction") = "TO" Then
            '--- PRINCIPAL IS THE BEGIN SHAPE, RELATED IS THE END SHAPE
            dtRow("Begin_TableID") = sqlSet.Tables(0).Rows(0).Item("Item1 TableID")
            dtRow("Begin_TypeID") = sqlSet.Tables(0).Rows(0).Item("Item1 TypeID")
            dtRow("Begin_ID") = sqlSet.Tables(0).Rows(0).Item("Item1 ID")
            dtRow("End_TableID") = sqlSet.Tables(0).Rows(0).Item("Item2 TableID")
            dtRow("End_TypeID") = sqlSet.Tables(0).Rows(0).Item("Item2 TypeID")
            dtRow("End_ID") = sqlSet.Tables(0).Rows(0).Item("Item2 ID")
        Else
            '--- PRINCIPAL IS THE END SHAPE, RELATED IS THE RELATED SHAPE
            dtRow("Begin_TableID") = sqlSet.Tables(0).Rows(0).Item("Item2 TableID")
            dtRow("Begin_TypeID") = sqlSet.Tables(0).Rows(0).Item("Item2 TypeID")
            dtRow("Begin_ID") = sqlSet.Tables(0).Rows(0).Item("Item2 ID")
            dtRow("End_TableID") = sqlSet.Tables(0).Rows(0).Item("Item1 TableID")
            dtRow("End_TypeID") = sqlSet.Tables(0).Rows(0).Item("Item1 TypeID")
            dtRow("End_ID") = sqlSet.Tables(0).Rows(0).Item("Item1 ID")
        End If
        dtTable.Rows.Add(dtRow)
        dtTable.AcceptChanges()

        Dim dsSet As DataSet = New DataSet
        dsSet.Tables.Add(dtTable)

        Return dsSet

    End Function

    Private Function MassageDataSet_Item(ByVal sqlSet As DataSet) As DataSet

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
        Dim dtRow As DataRow = dtTable.NewRow
        dtRow("ShapeTypeID") = sqlSet.Tables(0).Rows(0).Item("ShapeType_ID")
        dtRow("ShapeID") = sqlSet.Tables(0).Rows(0).Item("Shape_ID")
        dtRow("ShapeName") = sqlSet.Tables(0).Rows(0).Item("Shape_Name")
        dtRow("ShapeDesc") = sqlSet.Tables(0).Rows(0).Item("Shape_Desc")
        dtRow("AbstractionID") = sqlSet.Tables(0).Rows(0).Item("Abstraction_ID")
        '--- WORKAROUND : DBNULL.VALUE ISNT WORKING..... DUNNO WHY
        If Len(sqlSet.Tables(0).Rows(0).Item("ShapeContainer_ID").ToString) > EMPTY_INT Then
            dtRow("ContainerID") = sqlSet.Tables(0).Rows(0).Item("ShapeContainer_ID")
            dtRow("ContainerTypeID") = sqlSet.Tables(0).Rows(0).Item("ShapeContainer_TypeID")
        Else
            '--- DOES NOT HAVE A CONTAINER, VALUES ARE SET TO 0
            dtRow("ContainerID") = EMPTY_INT
            dtRow("ContainerTypeID") = EMPTY_INT
        End If
        dtTable.Rows.Add(dtRow)
        dtTable.AcceptChanges()
        Dim dsSet As DataSet = New DataSet
        dsSet.Tables.Add(dtTable)

        Return dsSet


    End Function

    Private Sub subUnmark(ByVal visShape As Visio.Shape)

        If visShape.Cells("Prop.AbstractionID").ResultIU = ABSTRACTION_RELATION Then
            subSetColorUnmark(visShape)
        Else
            For i As Integer = 1 To visShape.FromConnects.Count
                subSetColorUnmark(visShape.FromConnects(i).FromSheet)
            Next
        End If

    End Sub


    Private Sub subVerify(ByVal visShape As Visio.Shape, ByVal sqlConn As PLDbConnection)

        Dim strSQL As String = ""
        If visShape.Cells("Prop.AbstractionID").ResultIU = ABSTRACTION_RELATION Then
            '--- REFRESH SHAPE RELATION
            If visShape.Cells("Prop.ShapeTypeID").ResultIU = SHAPETYPE_CROSSRELATION Then
                strSQL = "EXEC GetAssociation '" & CStr(TABLE_CONTAINER) & "'," & CStr(visShape.Cells("Prop.ShapeID").ResultIU) & "; "
            Else
                strSQL = "EXEC GetAssociation '" & CStr(TABLE_RELATION) & "'," & CStr(visShape.Cells("Prop.ShapeID").ResultIU) & "; "
            End If
        Else
            For i As Integer = 1 To visShape.FromConnects.Count
                '---LOOP : GRAB EVERY SMARTS RELATION CONNECTED TO THAT SHAPE
                If visShape.FromConnects(i).FromSheet.Cells("Prop.ShapeTypeID").ResultIU = SHAPETYPE_CROSSRELATION Then
                    strSQL = strSQL & "EXEC GetAssociation '" & CStr(TABLE_CONTAINER) & "'," & CStr(visShape.FromConnects(i).FromSheet.Cells("Prop.ShapeID").ResultIU) & "; "
                Else
                    strSQL = strSQL & "EXEC GetAssociation '" & CStr(TABLE_RELATION) & "'," & CStr(visShape.FromConnects(i).FromSheet.Cells("Prop.ShapeID").ResultIU) & "; "
                End If
            Next
        End If

        If Len(strSQL) > EMPTY_INT Then

            Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
            Dim sqlAdapter As PLDbDataAdapter = New PLDbDataAdapter(sqlCmd)
            Dim sqlSet As New DataSet
            sqlAdapter.Fill(sqlSet)
            '---VERIFY RELATIONS
            Dim visShapes As Visio.Shapes = g_visApp.ActivePage.Shapes
            subVerifyAssociations(sqlSet, visShapes)

        End If




    End Sub


    Public Sub subVerifyAssociations(ByVal sqlTable As DataSet, ByVal visShapes As Visio.Shapes)

        Dim visConnector As Visio.Shape
        Dim dsRow As DataRow
        Dim strConnector As String

        '---FOR EACH RELATIONSHIP RETURNED,VERIFY
        For i As Integer = 0 To sqlTable.Tables.Count - 1
            For j As Integer = 0 To sqlTable.Tables(i).Rows.Count - 1
                dsRow = sqlTable.Tables(i).Rows(j)
                If booShapeExists(dsRow.Item("Assoc ID"), dsRow.Item("Assoc TypeID")) = True Then
                    '--- THIS RELATION EXISTS, CHECK THE VALIDITY
                    strConnector = "Relation." & CStr(dsRow.Item("Assoc ID"))
                    visConnector = visShapes(strConnector)
                    If booAssociationValid(visConnector, dsRow.Item("Item1 ID"), dsRow.Item("Item2 ID")) Then
                        subSetColorValid(visConnector)
                    Else
                        subSetColorInvalid(visConnector)
                    End If
                End If
            Next
        Next

    End Sub


End Class
