Imports Microsoft.Office.Interop
Imports PacificLife.Life.Enterprise.Data

Public Class frmDrillDown

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
    Friend WithEvents btnRelation As System.Windows.Forms.Button
    Friend WithEvents clbLevel As System.Windows.Forms.CheckedListBox
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents btnLinesYes As System.Windows.Forms.RadioButton
    Friend WithEvents btnLinesNo As System.Windows.Forms.RadioButton
    Friend WithEvents btnShow As System.Windows.Forms.RadioButton
    Friend WithEvents btnHide As System.Windows.Forms.RadioButton
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents btnSelect As System.Windows.Forms.RadioButton
    Friend WithEvents btnClear As System.Windows.Forms.RadioButton
    Friend WithEvents lstShapes As System.Windows.Forms.ListView
    Friend WithEvents btnDraw As System.Windows.Forms.Button
    Friend WithEvents grpDrawAll As System.Windows.Forms.GroupBox
    Friend WithEvents btnDrawClear As System.Windows.Forms.RadioButton
    Friend WithEvents btnDrawSelect As System.Windows.Forms.RadioButton
    Friend WithEvents grpDrawLines As System.Windows.Forms.GroupBox
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.btnRelation = New System.Windows.Forms.Button
        Me.clbLevel = New System.Windows.Forms.CheckedListBox
        Me.btnLinesYes = New System.Windows.Forms.RadioButton
        Me.btnHide = New System.Windows.Forms.RadioButton
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.btnShow = New System.Windows.Forms.RadioButton
        Me.btnLinesNo = New System.Windows.Forms.RadioButton
        Me.grpDrawLines = New System.Windows.Forms.GroupBox
        Me.GroupBox4 = New System.Windows.Forms.GroupBox
        Me.btnClear = New System.Windows.Forms.RadioButton
        Me.btnSelect = New System.Windows.Forms.RadioButton
        Me.lstShapes = New System.Windows.Forms.ListView
        Me.btnDraw = New System.Windows.Forms.Button
        Me.grpDrawAll = New System.Windows.Forms.GroupBox
        Me.btnDrawClear = New System.Windows.Forms.RadioButton
        Me.btnDrawSelect = New System.Windows.Forms.RadioButton
        Me.GroupBox1.SuspendLayout()
        Me.grpDrawLines.SuspendLayout()
        Me.GroupBox4.SuspendLayout()
        Me.grpDrawAll.SuspendLayout()
        Me.SuspendLayout()
        '
        'btnRelation
        '
        Me.btnRelation.Location = New System.Drawing.Point(128, 240)
        Me.btnRelation.Name = "btnRelation"
        Me.btnRelation.Size = New System.Drawing.Size(144, 40)
        Me.btnRelation.TabIndex = 6
        Me.btnRelation.Text = "Retrieve"
        '
        'clbLevel
        '
        Me.clbLevel.CheckOnClick = True
        Me.clbLevel.Location = New System.Drawing.Point(16, 8)
        Me.clbLevel.Name = "clbLevel"
        Me.clbLevel.Size = New System.Drawing.Size(104, 319)
        Me.clbLevel.TabIndex = 4
        '
        'btnLinesYes
        '
        Me.btnLinesYes.Checked = True
        Me.btnLinesYes.Location = New System.Drawing.Point(16, 24)
        Me.btnLinesYes.Name = "btnLinesYes"
        Me.btnLinesYes.Size = New System.Drawing.Size(64, 16)
        Me.btnLinesYes.TabIndex = 5
        Me.btnLinesYes.TabStop = True
        Me.btnLinesYes.Text = "Yes"
        '
        'btnHide
        '
        Me.btnHide.Location = New System.Drawing.Point(16, 48)
        Me.btnHide.Name = "btnHide"
        Me.btnHide.Size = New System.Drawing.Size(80, 16)
        Me.btnHide.TabIndex = 2
        Me.btnHide.Text = "Hide"
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.GroupBox2)
        Me.GroupBox1.Controls.Add(Me.btnHide)
        Me.GroupBox1.Controls.Add(Me.btnShow)
        Me.GroupBox1.Location = New System.Drawing.Point(128, 80)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(144, 72)
        Me.GroupBox1.TabIndex = 9
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Current Shape"
        '
        'GroupBox2
        '
        Me.GroupBox2.Location = New System.Drawing.Point(192, 96)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(192, 88)
        Me.GroupBox2.TabIndex = 8
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "GroupBox2"
        '
        'btnShow
        '
        Me.btnShow.Checked = True
        Me.btnShow.Location = New System.Drawing.Point(16, 24)
        Me.btnShow.Name = "btnShow"
        Me.btnShow.Size = New System.Drawing.Size(72, 16)
        Me.btnShow.TabIndex = 6
        Me.btnShow.TabStop = True
        Me.btnShow.Text = "Show"
        '
        'btnLinesNo
        '
        Me.btnLinesNo.Location = New System.Drawing.Point(16, 48)
        Me.btnLinesNo.Name = "btnLinesNo"
        Me.btnLinesNo.Size = New System.Drawing.Size(64, 16)
        Me.btnLinesNo.TabIndex = 7
        Me.btnLinesNo.Text = "No "
        '
        'grpDrawLines
        '
        Me.grpDrawLines.Controls.Add(Me.btnLinesYes)
        Me.grpDrawLines.Controls.Add(Me.btnLinesNo)
        Me.grpDrawLines.Location = New System.Drawing.Point(128, 160)
        Me.grpDrawLines.Name = "grpDrawLines"
        Me.grpDrawLines.Size = New System.Drawing.Size(144, 72)
        Me.grpDrawLines.TabIndex = 11
        Me.grpDrawLines.TabStop = False
        Me.grpDrawLines.Text = "Draw lines"
        '
        'GroupBox4
        '
        Me.GroupBox4.Controls.Add(Me.btnClear)
        Me.GroupBox4.Controls.Add(Me.btnSelect)
        Me.GroupBox4.Location = New System.Drawing.Point(128, 8)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(144, 64)
        Me.GroupBox4.TabIndex = 12
        Me.GroupBox4.TabStop = False
        '
        'btnClear
        '
        Me.btnClear.Location = New System.Drawing.Point(16, 40)
        Me.btnClear.Name = "btnClear"
        Me.btnClear.Size = New System.Drawing.Size(104, 16)
        Me.btnClear.TabIndex = 1
        Me.btnClear.Text = "Clear All"
        '
        'btnSelect
        '
        Me.btnSelect.Checked = True
        Me.btnSelect.Location = New System.Drawing.Point(16, 16)
        Me.btnSelect.Name = "btnSelect"
        Me.btnSelect.Size = New System.Drawing.Size(104, 16)
        Me.btnSelect.TabIndex = 0
        Me.btnSelect.TabStop = True
        Me.btnSelect.Text = "Select All"
        '
        'lstShapes
        '
        Me.lstShapes.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.lstShapes.CheckBoxes = True
        Me.lstShapes.FullRowSelect = True
        Me.lstShapes.GridLines = True
        Me.lstShapes.HideSelection = False
        Me.lstShapes.Location = New System.Drawing.Point(280, 8)
        Me.lstShapes.Name = "lstShapes"
        Me.lstShapes.Size = New System.Drawing.Size(496, 272)
        Me.lstShapes.TabIndex = 13
        Me.lstShapes.View = System.Windows.Forms.View.Details
        '
        'btnDraw
        '
        Me.btnDraw.Enabled = False
        Me.btnDraw.Location = New System.Drawing.Point(632, 288)
        Me.btnDraw.Name = "btnDraw"
        Me.btnDraw.Size = New System.Drawing.Size(144, 40)
        Me.btnDraw.TabIndex = 14
        Me.btnDraw.Text = "Draw"
        '
        'grpDrawAll
        '
        Me.grpDrawAll.Anchor = System.Windows.Forms.AnchorStyles.Bottom
        Me.grpDrawAll.Controls.Add(Me.btnDrawClear)
        Me.grpDrawAll.Controls.Add(Me.btnDrawSelect)
        Me.grpDrawAll.Location = New System.Drawing.Point(432, 288)
        Me.grpDrawAll.Name = "grpDrawAll"
        Me.grpDrawAll.Size = New System.Drawing.Size(192, 40)
        Me.grpDrawAll.TabIndex = 16
        Me.grpDrawAll.TabStop = False
        '
        'btnDrawClear
        '
        Me.btnDrawClear.Checked = True
        Me.btnDrawClear.Location = New System.Drawing.Point(112, 16)
        Me.btnDrawClear.Name = "btnDrawClear"
        Me.btnDrawClear.Size = New System.Drawing.Size(72, 16)
        Me.btnDrawClear.TabIndex = 1
        Me.btnDrawClear.TabStop = True
        Me.btnDrawClear.Text = "Clear All"
        '
        'btnDrawSelect
        '
        Me.btnDrawSelect.Location = New System.Drawing.Point(16, 16)
        Me.btnDrawSelect.Name = "btnDrawSelect"
        Me.btnDrawSelect.Size = New System.Drawing.Size(72, 16)
        Me.btnDrawSelect.TabIndex = 0
        Me.btnDrawSelect.Text = "Select All"
        '
        'frmDrillDown
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(792, 342)
        Me.Controls.Add(Me.grpDrawAll)
        Me.Controls.Add(Me.btnDraw)
        Me.Controls.Add(Me.lstShapes)
        Me.Controls.Add(Me.GroupBox4)
        Me.Controls.Add(Me.grpDrawLines)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.btnRelation)
        Me.Controls.Add(Me.clbLevel)
        Me.Name = "frmDrillDown"
        Me.Text = "frmDrillDown"
        Me.GroupBox1.ResumeLayout(False)
        Me.grpDrawLines.ResumeLayout(False)
        Me.GroupBox4.ResumeLayout(False)
        Me.grpDrawAll.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private lstCriteria As New ListView


    Private Sub frmDrillDown_Unload(ByVal Cancel As Integer)

        If Cancel = 1 Then
            Dim frm As frmDrillDown = New frmDrillDown
            Hide()
            frm.Close()
            frm.Dispose()
        End If

    End Sub

    Private Sub frmDrillDown_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        '*** FIND SHAPE ***
        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection

        If visSelection.Count = 0 Then

            MsgBox("Please select a SMARTS Shape first.")

        Else

            Dim visShape As Visio.Shape = visSelection.Item(1)
            Dim strSQL As String

            '---MAKE DB CALL GETSHAPELIST(ABSTRACTION,TYPE)")

            Select Case visShape.Cells("Prop.AbstractionID").ResultIU
                Case ABSTRACTION_SYSTEM, ABSTRACTION_OBJECT
                    strSQL = "GetShapeTypeList " & ABSTRACTION_OBJECT
                Case ABSTRACTION_BUSINESS, ABSTRACTION_STEP
                    strSQL = "GetShapeTypeList " & ABSTRACTION_STEP
                Case ABSTRACTION_DEVICE
                    strSQL = "GetShapeTypeList " & ABSTRACTION_DEVICE
            End Select
            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
            Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable
            '---BIND AND FORMAT DATAGRID")
            clbLevel.DataSource = sqlTable
            clbLevel.DisplayMember = "ShapeType_Name"
            clbLevel.ValueMember = "ShapeType_ID"
            For i As Integer = 0 To clbLevel.Items.Count - 1
                clbLevel.SetItemChecked(i, True)
            Next

            sqlConn.Close()

        End If

    End Sub


    Private Sub subPopulateListView(ByVal SQLTable As DataTable, ByVal visShape As Visio.Shape)

        '---GRAB MAX COLUMM WIDTH 
        Dim c As DataColumn
        For Each c In SQLTable.Columns
            'adding names of columns as Listview columns
            Dim h As New ColumnHeader
            Select Case c.ColumnName
                Case "Relation_Name"
                    h.Text = "Relation"
                    h.Width = 0
                Case "Contained_Name"
                    h.Text = "Shape"
                    h.Width = lstShapes.Width * 0.35
                Case "ShapeType_Name"
                    h.Text = "ShapeType"
                    h.Width = lstShapes.Width * 0.25
                Case "Contained_Desc"
                    h.Text = "Description"
                    h.Width = lstShapes.Width * 0.45
                Case Else
                    h.Text = c.ColumnName
                    h.Width = 0
            End Select
            lstShapes.Columns.Add(h)
        Next
        '--- ADD AN ABSTRACTION ID FOR THIS LISTVIEW
        Dim h2 As New ColumnHeader
        h2.Text = "Abstraction_ID"
        h2.Width = 0
        lstShapes.Columns.Add(h2)

        Dim strArray(SQLTable.Columns.Count + 1) As String
        'adding Datarows as listview Grids
        Dim rr As DataRow
        Dim i As Integer = 0
        For Each rr In SQLTable.Rows
            For col As Integer = 0 To SQLTable.Columns.Count - 1
                strArray(col) = rr(col).ToString()
            Next
            Dim ii As New ListViewItem(strArray)
            lstShapes.Items.Add(ii)
            lstShapes.Items(i).SubItems(SQLTable.Columns.Count).Text = visShape.Cells("Prop.AbstractionID").ResultIU
            i = i + 1
        Next

    End Sub


    Private Sub btnRelation_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnRelation.Click

        '*** FIND SHAPE ***
        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection

        If visSelection.Count = 0 Then

            MsgBox("Please select a SMARTS Shape first.")

        Else

            '---GET CRITERIAS : SHAPETYPES, INDIRECT/DIRECT, SHOW/REPLACE
            lstCriteria.Items.Clear()
            Dim booCheckedAny As Boolean = False
            lstCriteria.Items.Clear()
            For i As Integer = 0 To clbLevel.Items.Count - 1
                clbLevel.SetSelected(i, True)
                If clbLevel.GetItemChecked(i) = True Then
                    lstCriteria.Items.Add(clbLevel.SelectedValue.ToString)
                    booCheckedAny = True
                End If
                clbLevel.SetSelected(i, False)
            Next

            If booCheckedAny = False Then
                '--- NOTHING WAS CHECKED
                MsgBox("At least one shapetype must be selected")
                Exit Sub
            End If

            '--- SELECT PARENT
            Dim visShape As Visio.Shape = visSelection.Item(1)
            If booFormValid(Me, visShape) Then
                '--- GET ALL DIRECT CHILDREN THE PARENT CONTAINS
                Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
                Dim sqlTable As DataTable = fncDataTableRelatedShapes(sqlConn, RELATIONTYPE_CONTAINED, visShape)
                '--- FILTER OUT SHAPETYPES NOT WANTED, ALSO FILTERS OUT ANY ITEM NOT ON THE SAME LEVEL
                sqlTable = fncDataTableFilterShapeType(lstCriteria, sqlTable)
                '--- FILTER OUT SHAPES ALREADY DRAWN ON PAGE
                sqlTable = fncDataTableFilterNonExistingItemsOnly(sqlTable, True)
                subPopulateListView(sqlTable, visShape)

                If lstShapes.Items.Count = EMPTY_INT Then
                    btnDraw.Enabled = False
                Else
                    btnDraw.Enabled = True
                End If

                sqlConn.Close()
            Else
                '---WRONG FORM
                Exit Sub
            End If

        End If

    End Sub


    Private Sub lstShapes_ColumnClick(ByVal sender As Object, ByVal e As System.Windows.Forms.ColumnClickEventArgs)

        subListViewSort(sender, e, lstShapes)

    End Sub

    Private Sub btnDrawSelect_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDrawSelect.CheckedChanged

        subListViewSelectAll(sender, e, lstShapes)

    End Sub

    Private Sub btnDrawClear_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDrawClear.CheckedChanged

        subListViewClearAll(sender, e, lstShapes)

    End Sub

    Private Sub btnSelect_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSelect.CheckedChanged

        subCheckListBoxSelectAll(sender, e, clbLevel)

    End Sub

    Private Sub btnClear_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClear.CheckedChanged

        subCheckListBoxClearAll(sender, e, clbLevel)

    End Sub

    Private Sub btnDraw_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDraw.Click

        '---FOCUS ON SELECTED SHAPE
        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection
        If visSelection.Count > 0 Then

            Dim visShape As Visio.Shape = visSelection.Item(1)
            If booFormValid(Me, visShape) Then

                '--- DRAW ITEM SHAPES SELECTED
                Dim dtItems As DataTable = fncCreateTable_Items(lstShapes, True)
                subDrawShapesII(dtItems, visShape)

                If btnLinesYes.Checked = True Then
                    '--- DRAW RELATION LINES TO CHILDREN
                    Dim dtRelations As DataTable = fncCreateTable_Assocs(lstShapes)
                    subDrawRelationsII(dtRelations, visShape)
                End If

                If btnHide.Checked = True Then
                    '--- HIDE PARENT
                    subDeleteShape(visShape)
                End If

                '--- UNLOAD FORM
                frmDrillDown_Unload(1)

            Else

                Exit Sub

            End If

        End If

    End Sub

    Private Sub btnHide_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnHide.CheckedChanged

        '--- CANNOT DRAW RELATION LINES IF PARENT WILL BE HIDDEN
        btnLinesYes.Checked = False
        btnLinesNo.Checked = True

    End Sub


End Class

