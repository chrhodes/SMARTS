Imports Microsoft.Office.Interop
Imports PacificLife.Life.Enterprise.Data


Public Class frmRelation

    Inherits BaseClass


#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call
        AddHandler lstRelations.ColumnClick, AddressOf Me.lstRelations_ColumnClick

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
    Friend WithEvents clbLevel As System.Windows.Forms.CheckedListBox
    Friend WithEvents cbExistingOnly As System.Windows.Forms.CheckBox
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents btnClear As System.Windows.Forms.RadioButton
    Friend WithEvents btnSelect As System.Windows.Forms.RadioButton
    Friend WithEvents btnDrawClear As System.Windows.Forms.RadioButton
    Friend WithEvents btnDrawSelect As System.Windows.Forms.RadioButton
    Friend WithEvents btnDraw As System.Windows.Forms.Button
    Friend WithEvents btnRetrieve As System.Windows.Forms.Button
    Friend WithEvents lstRelations As System.Windows.Forms.ListView
    Friend WithEvents grpDrawAll As System.Windows.Forms.GroupBox

    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.clbLevel = New System.Windows.Forms.CheckedListBox
        Me.btnRetrieve = New System.Windows.Forms.Button
        Me.cbExistingOnly = New System.Windows.Forms.CheckBox
        Me.GroupBox4 = New System.Windows.Forms.GroupBox
        Me.btnClear = New System.Windows.Forms.RadioButton
        Me.btnSelect = New System.Windows.Forms.RadioButton
        Me.lstRelations = New System.Windows.Forms.ListView
        Me.grpDrawAll = New System.Windows.Forms.GroupBox
        Me.btnDrawClear = New System.Windows.Forms.RadioButton
        Me.btnDrawSelect = New System.Windows.Forms.RadioButton
        Me.btnDraw = New System.Windows.Forms.Button
        Me.GroupBox4.SuspendLayout()
        Me.grpDrawAll.SuspendLayout()
        Me.SuspendLayout()
        '
        'clbLevel
        '
        Me.clbLevel.CheckOnClick = True
        Me.clbLevel.Location = New System.Drawing.Point(8, 8)
        Me.clbLevel.MultiColumn = True
        Me.clbLevel.Name = "clbLevel"
        Me.clbLevel.Size = New System.Drawing.Size(456, 64)
        Me.clbLevel.TabIndex = 0
        '
        'btnRetrieve
        '
        Me.btnRetrieve.Location = New System.Drawing.Point(672, 8)
        Me.btnRetrieve.Name = "btnRetrieve"
        Me.btnRetrieve.Size = New System.Drawing.Size(104, 64)
        Me.btnRetrieve.TabIndex = 1
        Me.btnRetrieve.Text = "Retrieve "
        '
        'cbExistingOnly
        '
        Me.cbExistingOnly.Anchor = System.Windows.Forms.AnchorStyles.None
        Me.cbExistingOnly.Location = New System.Drawing.Point(488, 56)
        Me.cbExistingOnly.Name = "cbExistingOnly"
        Me.cbExistingOnly.Size = New System.Drawing.Size(176, 16)
        Me.cbExistingOnly.TabIndex = 3
        Me.cbExistingOnly.Text = "Retrieve existing shapes only"
        '
        'GroupBox4
        '
        Me.GroupBox4.Controls.Add(Me.btnClear)
        Me.GroupBox4.Controls.Add(Me.btnSelect)
        Me.GroupBox4.Location = New System.Drawing.Point(472, 8)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(192, 40)
        Me.GroupBox4.TabIndex = 13
        Me.GroupBox4.TabStop = False
        '
        'btnClear
        '
        Me.btnClear.Location = New System.Drawing.Point(104, 16)
        Me.btnClear.Name = "btnClear"
        Me.btnClear.Size = New System.Drawing.Size(72, 16)
        Me.btnClear.TabIndex = 1
        Me.btnClear.Text = "Clear All"
        '
        'btnSelect
        '
        Me.btnSelect.Checked = True
        Me.btnSelect.Location = New System.Drawing.Point(16, 16)
        Me.btnSelect.Name = "btnSelect"
        Me.btnSelect.Size = New System.Drawing.Size(72, 16)
        Me.btnSelect.TabIndex = 0
        Me.btnSelect.TabStop = True
        Me.btnSelect.Text = "Select All"
        '
        'lstRelations
        '
        Me.lstRelations.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.lstRelations.FullRowSelect = True
        Me.lstRelations.GridLines = True
        Me.lstRelations.Location = New System.Drawing.Point(8, 88)
        Me.lstRelations.Name = "lstRelations"
        Me.lstRelations.Size = New System.Drawing.Size(768, 320)
        Me.lstRelations.Sorting = System.Windows.Forms.SortOrder.Ascending
        Me.lstRelations.TabIndex = 14
        Me.lstRelations.Tag = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.lstRelations.View = System.Windows.Forms.View.Details
        '
        'grpDrawAll
        '
        Me.grpDrawAll.Anchor = System.Windows.Forms.AnchorStyles.Bottom
        Me.grpDrawAll.Controls.Add(Me.btnDrawClear)
        Me.grpDrawAll.Controls.Add(Me.btnDrawSelect)
        Me.grpDrawAll.Location = New System.Drawing.Point(408, 416)
        Me.grpDrawAll.Name = "grpDrawAll"
        Me.grpDrawAll.Size = New System.Drawing.Size(192, 40)
        Me.grpDrawAll.TabIndex = 14
        Me.grpDrawAll.TabStop = False
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
        Me.btnDraw.Location = New System.Drawing.Point(608, 416)
        Me.btnDraw.Name = "btnDraw"
        Me.btnDraw.Size = New System.Drawing.Size(168, 40)
        Me.btnDraw.TabIndex = 15
        Me.btnDraw.Text = "Draw"
        '
        'frmRelation
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(792, 462)
        Me.Controls.Add(Me.btnDraw)
        Me.Controls.Add(Me.lstRelations)
        Me.Controls.Add(Me.GroupBox4)
        Me.Controls.Add(Me.cbExistingOnly)
        Me.Controls.Add(Me.btnRetrieve)
        Me.Controls.Add(Me.clbLevel)
        Me.Controls.Add(Me.grpDrawAll)
        Me.Name = "frmRelation"
        Me.Text = "Retrieve Related Shapes"
        Me.GroupBox4.ResumeLayout(False)
        Me.grpDrawAll.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub


#End Region


    Private lstCriteria As New ListView


    Private Sub frmRelation_Unload(ByVal Cancel As Integer)

        If Cancel = 1 Then
            Dim frm As frmRelation = New frmRelation
            Hide()
            frm.Close()
            frm.Dispose()
        End If

    End Sub

    Private Sub frmRelation_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        g_booRelationReplace = False
        btnDraw.Enabled = False
        grpDrawAll.Enabled = False

        '*** FIND SHAPE ***
        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection

        If visSelection.Count = 0 Then

            MsgBox("Please select a SMARTS Shape first.")

        Else

            Dim visShape As Visio.Shape = visSelection.Item(1)

            '---MAKE DB CALL GETSHAPELIST(ABSTRACTION,TYPE)")
            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

            Dim strSQL As String
            Select Case g_intAction
                Case ACTIONITEM_SYSTEM
                    Select Case visShape.Cells("Prop.AbstractionID").ResultIU
                        Case ABSTRACTION_SYSTEM
                            strSQL = "GetShapeTypeList " & ABSTRACTION_SYSTEM
                        Case ABSTRACTION_PIECE
                            strSQL = "GetShapeTypeList " & ABSTRACTION_PIECE
                        Case Else
                            strSQL = "GetShapeTypeList " & ABSTRACTION_OBJECT
                    End Select
                Case ACTIONITEM_BUSINESSPROCESS
                    Select Case visShape.Cells("Prop.AbstractionID").ResultIU
                        Case ABSTRACTION_BUSINESS
                            strSQL = "GetShapeTypeList " & ABSTRACTION_BUSINESS
                        Case Else
                            strSQL = "GetShapeTypeList " & ABSTRACTION_STEP
                    End Select
                Case ACTIONITEM_INFRASTRUCTURE
                    strSQL = "GetShapeTypeList " & ABSTRACTION_DEVICE
            End Select

            Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
            Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable

            '---BIND AND FORMAT DATAGRID")
            clbLevel.DisplayMember = "ShapeType_Name"
            clbLevel.ValueMember = "ShapeType_ID"
            clbLevel.DataSource = sqlTable
            For i As Integer = 0 To clbLevel.Items.Count - 1
                clbLevel.SetItemChecked(i, True)
            Next

            sqlConn.Close()

        End If

    End Sub


    Private Sub subGetRelations(ByVal lstCriteria As ListView, ByVal visShape As Visio.Shape)

        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()

        '--- SELECT THE RELATED SHAPE OF THIS SHAPE ")
        Dim intRelationType As Integer
        Select Case visShape.Cells("Prop.AbstractionID").ResultIU
            Case ABSTRACTION_SYSTEM, ABSTRACTION_BUSINESS
                intRelationType = RELATIONTYPE_DIRECT
            Case ABSTRACTION_OBJECT
                If g_intAction = ACTIONITEM_SYSTEM Then
                    intRelationType = RELATIONTYPE_DIRECT
                Else
                    intRelationType = RELATIONTYPE_CONTAINER
                End If
            Case ABSTRACTION_DEVICE, ABSTRACTION_STEP
                If g_intAction = ACTIONITEM_SYSTEM Then
                    intRelationType = RELATIONTYPE_CONTAINED
                Else
                    intRelationType = RELATIONTYPE_DIRECT
                End If
        End Select

        Dim sqlTable As DataTable = fncDataTableRelatedShapes(sqlConn, intRelationType, visShape)

        If sqlTable.Rows.Count > 0 Then

            '---FILTER OUT SHAPETYPES NOT WANTED
            sqlTable = fncDataTableFilterShapeType(lstCriteria, sqlTable)
            '---FILTER OUT RELATIONS ALREADY DRAWN
            sqlTable = fncDataTableFilterNonExistingAssocOnly(sqlTable)
            If sqlTable.Rows.Count > 0 Then
                '--- HAS RELATIONS, ENABLE BUTTONS
                btnDraw.Enabled = True
                grpDrawAll.Enabled = True
                If cbExistingOnly.Checked = True Then
                    '---FILTER OUT EXISTING SHAPES ONLY
                    sqlTable = fncDataTableFilterExistingItemsOnly(sqlTable, True)
                End If
                subPopulateListView(sqlTable)
            Else
                MsgBox("No relations exist.")
            End If
        Else
            MsgBox("No relations exist.")
        End If

        sqlConn.Close()

    End Sub

    Private Sub btnSelect_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSelect.CheckedChanged

        For i As Integer = 0 To clbLevel.Items.Count - 1
            clbLevel.SetItemChecked(i, True)
        Next

    End Sub

    Private Sub btnClear_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClear.CheckedChanged

        For i As Integer = 0 To clbLevel.Items.Count - 1
            clbLevel.SetItemChecked(i, False)
        Next

    End Sub

    Private Sub btnDraw_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDraw.Click

        '---FOCUS ON SELECTED SHAPE
        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection
        If visSelection.Count > 0 Then

            Dim visShape As Visio.Shape = visSelection.Item(1)
            If booFormValid(Me, visShape) Then

                '--- GET LIST OF ITEM SHAPES SELECTED
                Dim dtItems As DataTable = fncCreateTable_Items(lstRelations, True)
                '--- DRAW ITEM SHAPES SELECTED
                subDrawShapesII(dtItems, visShape)
                '--- GET LIST OF RELATION SHAPES SELECTED
                Dim dtRelations As DataTable = fncCreateTable_Relations(lstRelations)
                ''--- DRAW ITEM SHAPES SELECTED
                subDrawRelationsII(dtRelations, visShape)

                '--- UNLOAD FORM
                frmRelation_Unload(1)

            Else

                Exit Sub

            End If

        End If

    End Sub


    Private Sub subPopulateListView(ByVal SQLTable As DataTable)

        '---GRAB MAX COLUMM WIDTH 
        Dim c As DataColumn
        For Each c In SQLTable.Columns
            'adding names of columns as Listview columns
            Dim h As New ColumnHeader

            'Select Case c.ColumnName
            '    Case "Assoc_Name"
            '        h.Text = "Association"
            '        h.Width = lstRelations.Width * 0.25
            '    Case "Related_Name"
            '        h.Text = "Shape"
            '        h.Width = lstRelations.Width * 0.25
            '    Case "Related_TypeName"
            '        h.Text = "ShapeType"
            '        h.Width = lstRelations.Width * 0.2
            '    Case "RelatedContainer_Name"
            '        h.Text = "Contained by"
            '        h.Width = lstRelations.Width * 0.3
            '    Case Else
            '        h.Text = c.ColumnName
            '        h.Width = 0
            'End Select
            h.Text = c.ColumnName
            lstRelations.Columns.Add(h)
        Next

        Dim strArray(SQLTable.Columns.Count) As String
        'adding Datarows as listview Grids
        Dim rr As DataRow
        For Each rr In SQLTable.Rows
            For col As Integer = 0 To SQLTable.Columns.Count - 1
                strArray(col) = rr(col).ToString()
            Next
            Dim ii As New ListViewItem(strArray)
            lstRelations.Items.Add(ii)
        Next

        '--- SELECT ALL FIRST
        For i As Integer = 0 To lstRelations.Items.Count - 1
            lstRelations.Items(i).Selected = True
            lstRelations.Select()
        Next

    End Sub

    Private Sub btnRetrieve_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnRetrieve.Click

        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection

        If visSelection.Count = 0 Then

            MsgBox("Please select a SMARTS Shape first.")

        Else
            '---GET CRITERIAS : SHAPETYPES, INDIRECT/DIRECT, SHOW/REPLACE
            lstCriteria.Items.Clear()
            Dim booCheckedAny As Boolean = False
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
                btnDraw.Enabled = False
                MsgBox("At least one shapetype must be selected")
                Exit Sub
            End If

            Dim visShape As Visio.Shape = visSelection.Item(1)
            If booFormValid(Me, visShape) Then
                lstRelations.Clear()
                '---GET RELATED ITEMS
                subGetRelations(lstCriteria, visShape)
                btnDrawSelect_CheckedChanged(sender, e)
                If lstRelations.Items.Count = EMPTY_INT Then
                    btnDraw.Enabled = False
                    grpDrawAll.Enabled = False
                End If
            Else
                '---WRONG FORM
                Exit Sub
            End If

        End If

    End Sub


    Private Sub lstRelations_ColumnClick(ByVal sender As Object, ByVal e As System.Windows.Forms.ColumnClickEventArgs)

        subListViewSort(sender, e, lstRelations)

    End Sub

    Private Sub btnDrawSelect_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDrawSelect.CheckedChanged

        subListViewSelectAll(sender, e, lstRelations)

    End Sub

    Private Sub btnDrawClear_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDrawClear.CheckedChanged

        subListViewClearAll(sender, e, lstRelations)

    End Sub


End Class
