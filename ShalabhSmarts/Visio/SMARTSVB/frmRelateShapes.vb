Imports Microsoft.Office.Interop
Imports PacificLife.Life.Enterprise.Data
Imports System.IO

Public Class frmRelateShapes
    Inherits BaseClass

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call
        AddHandler lstShapes.ColumnClick, AddressOf Me.lstShapes_ColumnClick

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
    Friend WithEvents lstShapes As System.Windows.Forms.ListView
    Friend WithEvents grpDrawAll As System.Windows.Forms.GroupBox
    Friend WithEvents btnDrawClear As System.Windows.Forms.RadioButton
    Friend WithEvents btnDrawSelect As System.Windows.Forms.RadioButton
    Friend WithEvents btnDraw As System.Windows.Forms.Button
    Friend WithEvents btnSharedDrillDowns As System.Windows.Forms.Button
    Friend WithEvents btnOmitDrillDowns As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.lstShapes = New System.Windows.Forms.ListView
        Me.grpDrawAll = New System.Windows.Forms.GroupBox
        Me.btnDrawClear = New System.Windows.Forms.RadioButton
        Me.btnDrawSelect = New System.Windows.Forms.RadioButton
        Me.btnDraw = New System.Windows.Forms.Button
        Me.btnSharedDrillDowns = New System.Windows.Forms.Button
        Me.btnOmitDrillDowns = New System.Windows.Forms.Button
        Me.grpDrawAll.SuspendLayout()
        Me.SuspendLayout()
        '
        'lstShapes
        '
        Me.lstShapes.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.lstShapes.FullRowSelect = True
        Me.lstShapes.GridLines = True
        Me.lstShapes.Location = New System.Drawing.Point(16, 24)
        Me.lstShapes.Name = "lstShapes"
        Me.lstShapes.Size = New System.Drawing.Size(880, 352)
        Me.lstShapes.Sorting = System.Windows.Forms.SortOrder.Ascending
        Me.lstShapes.TabIndex = 16
        Me.lstShapes.Tag = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.lstShapes.View = System.Windows.Forms.View.Details
        '
        'grpDrawAll
        '
        Me.grpDrawAll.Anchor = System.Windows.Forms.AnchorStyles.Bottom
        Me.grpDrawAll.Controls.Add(Me.btnDrawClear)
        Me.grpDrawAll.Controls.Add(Me.btnDrawSelect)
        Me.grpDrawAll.Location = New System.Drawing.Point(480, 384)
        Me.grpDrawAll.Name = "grpDrawAll"
        Me.grpDrawAll.Size = New System.Drawing.Size(192, 40)
        Me.grpDrawAll.TabIndex = 25
        Me.grpDrawAll.TabStop = False
        Me.grpDrawAll.Text = "Relations"
        '
        'btnDrawClear
        '
        Me.btnDrawClear.Location = New System.Drawing.Point(112, 16)
        Me.btnDrawClear.Name = "btnDrawClear"
        Me.btnDrawClear.Size = New System.Drawing.Size(72, 16)
        Me.btnDrawClear.TabIndex = 1
        Me.btnDrawClear.Text = "Clear All"
        '
        'btnDrawSelect
        '
        Me.btnDrawSelect.Checked = True
        Me.btnDrawSelect.Location = New System.Drawing.Point(16, 16)
        Me.btnDrawSelect.Name = "btnDrawSelect"
        Me.btnDrawSelect.Size = New System.Drawing.Size(72, 16)
        Me.btnDrawSelect.TabIndex = 0
        Me.btnDrawSelect.TabStop = True
        Me.btnDrawSelect.Text = "Select All"
        '
        'btnDraw
        '
        Me.btnDraw.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btnDraw.Enabled = False
        Me.btnDraw.Location = New System.Drawing.Point(752, 384)
        Me.btnDraw.Name = "btnDraw"
        Me.btnDraw.Size = New System.Drawing.Size(144, 40)
        Me.btnDraw.TabIndex = 24
        Me.btnDraw.Text = "Draw"
        '
        'btnSharedDrillDowns
        '
        Me.btnSharedDrillDowns.Location = New System.Drawing.Point(24, 384)
        Me.btnSharedDrillDowns.Name = "btnSharedDrillDowns"
        Me.btnSharedDrillDowns.Size = New System.Drawing.Size(160, 40)
        Me.btnSharedDrillDowns.TabIndex = 28
        Me.btnSharedDrillDowns.Text = "Show Shared Drill Downs"
        '
        'btnOmitDrillDowns
        '
        Me.btnOmitDrillDowns.Location = New System.Drawing.Point(192, 384)
        Me.btnOmitDrillDowns.Name = "btnOmitDrillDowns"
        Me.btnOmitDrillDowns.Size = New System.Drawing.Size(144, 40)
        Me.btnOmitDrillDowns.TabIndex = 29
        Me.btnOmitDrillDowns.Text = "Omit Shared Drill Downs"
        '
        'frmRelateShapes
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(912, 438)
        Me.Controls.Add(Me.btnOmitDrillDowns)
        Me.Controls.Add(Me.btnSharedDrillDowns)
        Me.Controls.Add(Me.grpDrawAll)
        Me.Controls.Add(Me.btnDraw)
        Me.Controls.Add(Me.lstShapes)
        Me.Name = "frmRelateShapes"
        Me.Text = "frmRelateShapes"
        Me.grpDrawAll.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region


    Dim gbooShowSharedDrillDowns As Boolean


    Private Sub frmRelateShapes_Unload(ByVal Cancel As Integer)

        If Cancel = 1 Then
            Dim frm As frmRelateShapes = New frmRelateShapes
            Hide()
            frm.Close()

            frm.Dispose()
        End If

    End Sub


    Private Function fncGetAssociations(ByVal sqlConn As PLDbConnection, ByVal visSelection As Visio.Selection) As DataTable

        '--- STRING TOGETHER SPECIFIC ASSOCIATION IDS TO RETRIEVE
        Dim strShapeIDs As String = "'( "
        For i As Integer = 1 To visSelection.Count
            strShapeIDs = strShapeIDs & visSelection(i).Cells("Prop.ShapeID").ResultIU & ","
        Next
        '--- REMOVE THE LAST COMMA  
        strShapeIDs = strShapeIDs.Remove(Len(strShapeIDs) - 1, 1)
        strShapeIDs = strShapeIDs & ")'"
        Dim strSQL As String = "EXEC GetAssociationIDs NULL," & strShapeIDs & "," & strShapeIDs
        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable

        Return sqlTable

    End Function


    Private Function fncGetAssociations_DrillDowns(ByVal dtTable As DataTable, ByVal sqlConn As PLDbConnection, ByVal visSelection As Visio.Selection) As DataTable

        Dim strSQL As String

        '--- GET THE SHARED DRILLED DOWNS IF THE SELECTED ITEM(S) IS A SYSTEM SHAPE
        strSQL = ""
        For i As Integer = 1 To visSelection.Count - 1
            If visSelection(i).Cells("Prop.ShapeTypeID").ResultIU = SHAPETYPE_SYSTEM Then
                Dim strRelatedIDs As String = "'("
                For j As Integer = i + 1 To visSelection.Count
                    strRelatedIDs = strRelatedIDs & visSelection(j).Cells("Prop.ShapeID").ResultIU & ","
                Next
                '--- REMOVE THE LAST COMMA  
                strRelatedIDs = strRelatedIDs.Remove(Len(strRelatedIDs) - 1, 1)
                strRelatedIDs = strRelatedIDs & ")'"
                '--- STRING TOGETHER
                strSQL = strSQL & "EXEC GetAssociationIDs_DrillDowns " & TABLE_RELATION & ", '" & visSelection(i).Cells("Prop.ShapeID").ResultIU & "'," & strRelatedIDs & "; "
            End If
        Next

        If Len(strSQL) > EMPTY_INT Then

            '--- GET THE DATASET OF SHARED DrillDown associations
            Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
            Dim sqlAdapter As PLDbDataAdapter = New PLDbDataAdapter(sqlCmd)
            Dim sqlSet As New DataSet
            sqlAdapter.Fill(sqlSet)

            For i As Integer = 0 To sqlSet.Tables.Count - 1
                If sqlSet.Tables(i).Rows.Count > EMPTY_INT Then
                    '--- APPEND ROWS FROM sqlSet.Tables(i) TO sqlTable
                    Dim sqlRow As DataRow
                    Dim sqlCol As DataColumn
                    Dim strColName As String
                    For j As Integer = 0 To sqlSet.Tables(i).Rows.Count - 1
                        sqlRow = dtTable.NewRow
                        For k As Integer = 0 To sqlRow.ItemArray.Length - 1
                            sqlRow(k) = sqlSet.Tables(i).Rows(j)(k)
                        Next k
                        dtTable.Rows.Add(sqlRow)
                    Next
                End If
            Next
            dtTable.AcceptChanges()

        End If

        Return dtTable


    End Function

    Private Sub lstShapes_ColumnClick(ByVal sender As Object, ByVal e As System.Windows.Forms.ColumnClickEventArgs)

        subListViewSort(sender, e, lstShapes)

    End Sub

    Private Sub frmRelateShapes_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        lstShapes.Items.Clear()
        lstShapes.Columns.Clear()

        If g_intAction = ACTIONITEM_SHOWRELATIONS Then
            g_visApp.ActiveWindow.SelectAll()
        End If

        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection

        If visSelection.Count = 0 Then

            MsgBox("Please select a SMARTS Shape first.")

        Else

            '--- OPEN CONNECTION
            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

            '--- GET ASSOCIATION IDS
            Dim dtAssoc As DataTable = fncGetAssociations(sqlConn, visSelection)
            If gbooShowSharedDrillDowns = True Then
                dtAssoc = fncGetAssociations_DrillDowns(dtAssoc, sqlConn, visSelection)
                dtAssoc.AcceptChanges()
            End If

            '--- GET ASSOCIATIONS
            Dim strSQL As String
            For i As Integer = 0 To dtAssoc.Rows.Count - 1
                strSQL = strSQL & " EXEC GetAssociation '" & dtAssoc.Rows(i).Item("Assoc_Table") & "'," & dtAssoc.Rows(i).Item("Assoc_ID") & ";"
            Next

            If Len(strSQL) > EMPTY_INT Then

                Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
                Dim sqlAdapter As PLDbDataAdapter = New PLDbDataAdapter(sqlCmd)
                Dim sqlSet As New DataSet
                sqlAdapter.Fill(sqlSet)

                '--- CREATE A NEW DATA TABLE
                Dim sqlTable As DataTable = New DataTable
                Dim sqlRow As DataRow = sqlSet.Tables(0).NewRow
                For k As Integer = 0 To sqlRow.ItemArray.Length - 1
                    sqlTable.Columns.Add(New DataColumn(CStr(sqlSet.Tables(0).Columns(k).ColumnName())))
                Next k
                sqlTable.AcceptChanges()

                '--- POPULATE TABLE
                For i As Integer = 0 To sqlSet.Tables.Count - 1
                    sqlTable = PopulateDataTable_SelectedShapes(visSelection.Item(1), sqlTable, sqlSet.Tables(i))
                    sqlTable.AcceptChanges()
                Next

                If sqlTable.Rows.Count > 0 Then
                    '---FILTER OUT RELATIONS ALREADY DRAWN
                    sqlTable = fncDataTableFilterNonExistingAssocOnly(sqlTable)
                    sqlTable.AcceptChanges()
                End If

                If sqlTable.Rows.Count > 0 Then
                    subPopulateListView_Assoc(lstShapes, sqlTable)
                    btnDraw.Enabled = True
                Else
                    btnDraw.Enabled = False
                End If

            End If

            '--- CLOSE THE CONNECTION
            sqlConn.Close()

        End If

    End Sub

    Private Sub btnSharedDrillDowns_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSharedDrillDowns.Click

        gbooShowSharedDrillDowns = True
        frmRelateShapes_Load(sender, e)

    End Sub

    Private Sub btnOmitDrillDowns_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnOmitDrillDowns.Click

        gbooShowSharedDrillDowns = False
        frmRelateShapes_Load(sender, e)

    End Sub

    Private Sub btnDrawSelect_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDrawSelect.CheckedChanged

        subListViewSelectAll(sender, e, lstShapes)

    End Sub

    Private Sub btnDrawClear_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDrawClear.CheckedChanged

        subListViewClearAll(sender, e, lstShapes)

    End Sub

    Private Sub btnDraw_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDraw.Click

        '---FOCUS ON SELECTED SHAPE
        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection
        If visSelection.Count > 0 Then

            For i As Integer = 1 To visSelection.Count

                Dim visShape As Visio.Shape = visSelection.Item(i)

                '--- GET LIST OF ITEM SHAPES SELECTED
                Dim dtItemsPrincipal As DataTable = fncCreateTable_Items(lstShapes, "Item1")
                Dim dtItemsRelated As DataTable = fncCreateTable_Items(lstShapes, "Item2")
                Dim dsItems As DataSet = New DataSet
                dsItems.Tables.Add(dtItemsRelated)
                dsItems.Merge(dtItemsPrincipal)

                '--- DRAW ITEM SHAPES SELECTED
                subDrawShapes(dsItems.Tables(0), visShape)
                '--- GET LIST OF RELATION SHAPES SELECTED
                Dim dtAssocs As DataTable = fncCreateTable_Assocs(lstShapes)
                ''--- DRAW ITEM SHAPES SELECTED
                For j As Integer = 0 To dtAssocs.Rows.Count - 1
                    subDrawShape_Assoc(visShape, dtAssocs.Rows(j))
                Next

            Next


        End If

        '--- UNLOAD FORM
        frmRelateShapes_Unload(1)

    End Sub

    Private Sub subDrawShapes(ByVal dtTable As DataTable, ByVal visShape As Visio.Shape)

        Dim intShapeIndex As Integer = 0
        For j As Integer = 0 To dtTable.Rows.Count - 1
            If booShapeExists(dtTable.Rows(j).Item("ShapeID"), dtTable.Rows(j).Item("ShapeTypeID")) = False Then
                '--- DRAW SHAPES
                subDrawShape_Item(visShape, dtTable.Rows(j), intShapeIndex, dtTable.Rows.Count)
                intShapeIndex = intShapeIndex + 1
            End If
        Next

    End Sub


End Class
