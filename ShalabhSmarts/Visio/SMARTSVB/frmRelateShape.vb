Imports Microsoft.Office.Interop
Imports PacificLife.Life.Enterprise.Data

Public Class frmRelateShape
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
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents cbExistingOnly As System.Windows.Forms.CheckBox
    Friend WithEvents btnRetrieve As System.Windows.Forms.Button
    Friend WithEvents clbLevel As System.Windows.Forms.CheckedListBox
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents btnHide As System.Windows.Forms.RadioButton
    Friend WithEvents btnShow As System.Windows.Forms.RadioButton
    Friend WithEvents grpDrawLines As System.Windows.Forms.GroupBox
    Friend WithEvents btnLinesYes As System.Windows.Forms.RadioButton
    Friend WithEvents btnLinesNo As System.Windows.Forms.RadioButton
    Friend WithEvents grpDrawAll As System.Windows.Forms.GroupBox
    Friend WithEvents btnDrawClear As System.Windows.Forms.RadioButton
    Friend WithEvents btnDrawSelect As System.Windows.Forms.RadioButton
    Friend WithEvents btnDraw As System.Windows.Forms.Button
    Friend WithEvents btnRetrieveClear As System.Windows.Forms.RadioButton
    Friend WithEvents btnRetrieveSelect As System.Windows.Forms.RadioButton
    Friend WithEvents lstShapes As System.Windows.Forms.ListView
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.lstShapes = New System.Windows.Forms.ListView
        Me.GroupBox4 = New System.Windows.Forms.GroupBox
        Me.btnRetrieveClear = New System.Windows.Forms.RadioButton
        Me.btnRetrieveSelect = New System.Windows.Forms.RadioButton
        Me.cbExistingOnly = New System.Windows.Forms.CheckBox
        Me.btnRetrieve = New System.Windows.Forms.Button
        Me.clbLevel = New System.Windows.Forms.CheckedListBox
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.btnHide = New System.Windows.Forms.RadioButton
        Me.btnShow = New System.Windows.Forms.RadioButton
        Me.grpDrawLines = New System.Windows.Forms.GroupBox
        Me.btnLinesYes = New System.Windows.Forms.RadioButton
        Me.btnLinesNo = New System.Windows.Forms.RadioButton
        Me.grpDrawAll = New System.Windows.Forms.GroupBox
        Me.btnDrawClear = New System.Windows.Forms.RadioButton
        Me.btnDrawSelect = New System.Windows.Forms.RadioButton
        Me.btnDraw = New System.Windows.Forms.Button
        Me.GroupBox4.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.grpDrawLines.SuspendLayout()
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
        Me.lstShapes.Location = New System.Drawing.Point(8, 112)
        Me.lstShapes.Name = "lstShapes"
        Me.lstShapes.Size = New System.Drawing.Size(760, 304)
        Me.lstShapes.Sorting = System.Windows.Forms.SortOrder.Ascending
        Me.lstShapes.TabIndex = 15
        Me.lstShapes.Tag = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.lstShapes.View = System.Windows.Forms.View.Details
        '
        'GroupBox4
        '
        Me.GroupBox4.Controls.Add(Me.btnRetrieveClear)
        Me.GroupBox4.Controls.Add(Me.btnRetrieveSelect)
        Me.GroupBox4.Location = New System.Drawing.Point(400, 8)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(96, 88)
        Me.GroupBox4.TabIndex = 19
        Me.GroupBox4.TabStop = False
        Me.GroupBox4.Text = "ShapeTypes"
        '
        'btnRetrieveClear
        '
        Me.btnRetrieveClear.Location = New System.Drawing.Point(16, 64)
        Me.btnRetrieveClear.Name = "btnRetrieveClear"
        Me.btnRetrieveClear.Size = New System.Drawing.Size(72, 16)
        Me.btnRetrieveClear.TabIndex = 1
        Me.btnRetrieveClear.Text = "Clear All"
        '
        'btnRetrieveSelect
        '
        Me.btnRetrieveSelect.Checked = True
        Me.btnRetrieveSelect.Location = New System.Drawing.Point(16, 32)
        Me.btnRetrieveSelect.Name = "btnRetrieveSelect"
        Me.btnRetrieveSelect.Size = New System.Drawing.Size(72, 16)
        Me.btnRetrieveSelect.TabIndex = 0
        Me.btnRetrieveSelect.TabStop = True
        Me.btnRetrieveSelect.Text = "Select All"
        '
        'cbExistingOnly
        '
        Me.cbExistingOnly.Location = New System.Drawing.Point(664, 12)
        Me.cbExistingOnly.Name = "cbExistingOnly"
        Me.cbExistingOnly.Size = New System.Drawing.Size(112, 40)
        Me.cbExistingOnly.TabIndex = 18
        Me.cbExistingOnly.Text = "Retrieve existing shapes only"
        '
        'btnRetrieve
        '
        Me.btnRetrieve.Location = New System.Drawing.Point(664, 56)
        Me.btnRetrieve.Name = "btnRetrieve"
        Me.btnRetrieve.Size = New System.Drawing.Size(104, 32)
        Me.btnRetrieve.TabIndex = 17
        Me.btnRetrieve.Text = "Retrieve "
        '
        'clbLevel
        '
        Me.clbLevel.CheckOnClick = True
        Me.clbLevel.Location = New System.Drawing.Point(8, 16)
        Me.clbLevel.MultiColumn = True
        Me.clbLevel.Name = "clbLevel"
        Me.clbLevel.Size = New System.Drawing.Size(384, 79)
        Me.clbLevel.TabIndex = 16
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.GroupBox2)
        Me.GroupBox1.Controls.Add(Me.btnHide)
        Me.GroupBox1.Controls.Add(Me.btnShow)
        Me.GroupBox1.Location = New System.Drawing.Point(504, 8)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(144, 40)
        Me.GroupBox1.TabIndex = 20
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
        'btnHide
        '
        Me.btnHide.Location = New System.Drawing.Point(80, 16)
        Me.btnHide.Name = "btnHide"
        Me.btnHide.Size = New System.Drawing.Size(48, 16)
        Me.btnHide.TabIndex = 2
        Me.btnHide.Text = "Hide"
        '
        'btnShow
        '
        Me.btnShow.Checked = True
        Me.btnShow.Location = New System.Drawing.Point(16, 16)
        Me.btnShow.Name = "btnShow"
        Me.btnShow.Size = New System.Drawing.Size(56, 16)
        Me.btnShow.TabIndex = 6
        Me.btnShow.TabStop = True
        Me.btnShow.Text = "Show"
        '
        'grpDrawLines
        '
        Me.grpDrawLines.Controls.Add(Me.btnLinesYes)
        Me.grpDrawLines.Controls.Add(Me.btnLinesNo)
        Me.grpDrawLines.Location = New System.Drawing.Point(504, 56)
        Me.grpDrawLines.Name = "grpDrawLines"
        Me.grpDrawLines.Size = New System.Drawing.Size(144, 40)
        Me.grpDrawLines.TabIndex = 21
        Me.grpDrawLines.TabStop = False
        Me.grpDrawLines.Text = "Draw lines"
        '
        'btnLinesYes
        '
        Me.btnLinesYes.Checked = True
        Me.btnLinesYes.Location = New System.Drawing.Point(16, 16)
        Me.btnLinesYes.Name = "btnLinesYes"
        Me.btnLinesYes.Size = New System.Drawing.Size(48, 16)
        Me.btnLinesYes.TabIndex = 5
        Me.btnLinesYes.TabStop = True
        Me.btnLinesYes.Text = "Yes"
        '
        'btnLinesNo
        '
        Me.btnLinesNo.Location = New System.Drawing.Point(80, 16)
        Me.btnLinesNo.Name = "btnLinesNo"
        Me.btnLinesNo.Size = New System.Drawing.Size(40, 16)
        Me.btnLinesNo.TabIndex = 7
        Me.btnLinesNo.Text = "No "
        '
        'grpDrawAll
        '
        Me.grpDrawAll.Anchor = System.Windows.Forms.AnchorStyles.Bottom
        Me.grpDrawAll.Controls.Add(Me.btnDrawClear)
        Me.grpDrawAll.Controls.Add(Me.btnDrawSelect)
        Me.grpDrawAll.Location = New System.Drawing.Point(424, 424)
        Me.grpDrawAll.Name = "grpDrawAll"
        Me.grpDrawAll.Size = New System.Drawing.Size(192, 40)
        Me.grpDrawAll.TabIndex = 23
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
        Me.btnDraw.Location = New System.Drawing.Point(624, 424)
        Me.btnDraw.Name = "btnDraw"
        Me.btnDraw.Size = New System.Drawing.Size(144, 40)
        Me.btnDraw.TabIndex = 22
        Me.btnDraw.Text = "Draw"
        '
        'frmRelateShape
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(784, 470)
        Me.Controls.Add(Me.grpDrawAll)
        Me.Controls.Add(Me.btnDraw)
        Me.Controls.Add(Me.grpDrawLines)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.GroupBox4)
        Me.Controls.Add(Me.cbExistingOnly)
        Me.Controls.Add(Me.btnRetrieve)
        Me.Controls.Add(Me.clbLevel)
        Me.Controls.Add(Me.lstShapes)
        Me.Name = "frmRelateShape"
        Me.Text = "frmRelateShape"
        Me.GroupBox4.ResumeLayout(False)
        Me.GroupBox1.ResumeLayout(False)
        Me.grpDrawLines.ResumeLayout(False)
        Me.grpDrawAll.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private lstCriteria As New ListView

    Private Sub frmRelateShape_Unload(ByVal Cancel As Integer)

        If Cancel = 1 Then
            Dim frm As frmRelateShape = New frmRelateShape
            Hide()
            frm.Close()
            frm.Dispose()
        End If

    End Sub


    Private Function fncGetShapeTypeList(ByVal visShape As Visio.Shape) As String

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
            Case ACTIONITEM_DRILLDOWN
                Select Case visShape.Cells("Prop.AbstractionID").ResultIU
                    Case ABSTRACTION_SYSTEM, ABSTRACTION_OBJECT
                        strSQL = "GetShapeTypeList " & ABSTRACTION_OBJECT
                    Case ABSTRACTION_BUSINESS, ABSTRACTION_STEP
                        strSQL = "GetShapeTypeList " & ABSTRACTION_STEP
                    Case ABSTRACTION_DEVICE
                        strSQL = "GetShapeTypeList " & ABSTRACTION_DEVICE
                End Select
            Case ACTIONITEM_DRILLUP
                Select Case visShape.Cells("Prop.AbstractionID").ResultIU
                    Case ABSTRACTION_OBJECT
                        strSQL = "GetShapeTypeList " & ABSTRACTION_SYSTEM
                    Case ABSTRACTION_STEP
                        strSQL = "GetShapeTypeList " & ABSTRACTION_BUSINESS
                    Case ABSTRACTION_DEVICE
                        strSQL = "GetShapeTypeList " & ABSTRACTION_DEVICE
                End Select
        End Select

        Return strSQL

    End Function


    Private Sub lstShapes_ColumnClick(ByVal sender As Object, ByVal e As System.Windows.Forms.ColumnClickEventArgs)

        subListViewSort(sender, e, lstShapes)

    End Sub

    Private Sub btnDrawSelect_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDrawSelect.CheckedChanged

        subListViewSelectAll(sender, e, lstShapes)

    End Sub

    Private Sub btnDrawClear_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDrawClear.CheckedChanged

        subListViewClearAll(sender, e, lstShapes)

    End Sub

    Private Sub btnRetrieveSelect_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnRetrieveSelect.CheckedChanged

        subCheckListBoxSelectAll(sender, e, clbLevel)

    End Sub

    Private Sub btnRetrieveClear_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnRetrieveClear.CheckedChanged

        subCheckListBoxClearAll(sender, e, clbLevel)

    End Sub

    Private Sub btnHide_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnHide.CheckedChanged

        '--- CANNOT DRAW RELATION LINES IF PARENT WILL BE HIDDEN
        btnLinesYes.Checked = False
        btnLinesNo.Checked = True

    End Sub


    Private Sub frmRelateShape_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        btnDraw.Enabled = False
        grpDrawAll.Enabled = False

        '*** FIND SHAPE ***
        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection

        If visSelection.Count = 0 Then

            MsgBox("Please select a SMARTS Shape first.")

        Else

            '---POPULATE CRITERIA COMBO BOX
            Dim visShape As Visio.Shape = visSelection.Item(1)
            Dim strSQL As String = fncGetShapeTypeList(visShape)
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



    Private Function subGetCriteria() As Boolean

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

        Return booCheckedAny

    End Function


    Private Sub subGetRelatedShapes(ByVal visShape As Visio.Shape)

        '--- SELECT THE RELATED SHAPE OF THIS SHAPE ")
        Dim intRelationType As Integer
        Dim strSQL As String

        Select Case g_intAction
            Case ACTIONITEM_DRILLDOWN
                intRelationType = RELATIONTYPE_CONTAINED
                strSQL = "EXEC GetAssociationIDs " & TABLE_CONTAINER & "," & visShape.Cells("Prop.ShapeID").ResultIU & ", NULL"
            Case ACTIONITEM_DRILLUP
                intRelationType = RELATIONTYPE_CONTAINER
                strSQL = "EXEC GetAssociationIDs " & TABLE_CONTAINER & "," & visShape.Cells("Prop.ShapeID").ResultIU & ", NULL"
            Case Else
                Select Case visShape.Cells("Prop.AbstractionID").ResultIU
                    Case ABSTRACTION_SYSTEM, ABSTRACTION_BUSINESS
                        intRelationType = RELATIONTYPE_DIRECT
                        strSQL = "EXEC GetAssociationIDs " & TABLE_RELATION & "," & visShape.Cells("Prop.ShapeID").ResultIU & ", NULL"
                    Case ABSTRACTION_OBJECT
                        If g_intAction = ACTIONITEM_SYSTEM Then
                            intRelationType = RELATIONTYPE_DIRECT
                            strSQL = "EXEC GetAssociationIDs " & TABLE_RELATION & "," & visShape.Cells("Prop.ShapeID").ResultIU & ", NULL"
                        Else
                            intRelationType = RELATIONTYPE_CONTAINER
                            strSQL = "EXEC GetAssociationIDs " & TABLE_CONTAINER & "," & visShape.Cells("Prop.ShapeID").ResultIU & ", NULL"
                        End If
                    Case ABSTRACTION_DEVICE, ABSTRACTION_STEP
                        If g_intAction = ACTIONITEM_SYSTEM Then
                            intRelationType = RELATIONTYPE_CONTAINED
                            strSQL = "EXEC GetAssociationIDs " & TABLE_CONTAINER & "," & visShape.Cells("Prop.ShapeID").ResultIU & ", NULL"
                        Else
                            intRelationType = RELATIONTYPE_DIRECT
                            strSQL = "EXEC GetAssociationIDs " & TABLE_RELATION & "," & visShape.Cells("Prop.ShapeID").ResultIU & ", NULL"
                        End If
                End Select
        End Select

        '--- GET LIST OF POSSIBLE ASSOCIATIONS
        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
        Dim dtAssoc As DataTable = sqlCmd.ExecuteDataTable

        '--- RETRIEVE ASSOCIATIONS
        strSQL = ""
        For i As Integer = 0 To dtAssoc.Rows.Count - 1
            strSQL = strSQL & " EXEC GetAssociation '" & dtAssoc.Rows(i).Item("Assoc_Table") & "'," & dtAssoc.Rows(i).Item("Assoc_ID") & ";"
        Next

        If Len(strSQL) > EMPTY_INT Then

            sqlCmd = New PLDbCommand(strSQL, sqlConn)
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
                sqlTable = PopulateDataTable_SelectedShapes(visShape, sqlTable, sqlSet.Tables(i))
                sqlTable.AcceptChanges()
            Next

            If sqlTable.Rows.Count > 0 Then
                '---FILTER OUT SHAPETYPES NOT WANTED
                sqlTable = fncDataTableFilterShapeType(lstCriteria, sqlTable)
                '---FILTER OUT RELATIONS ALREADY DRAWN
                sqlTable = fncDataTableFilterNonExistingAssocOnly(sqlTable)
                sqlTable.AcceptChanges()
            End If

            If sqlTable.Rows.Count > 0 Then
                '--- HAS RELATIONS, ENABLE BUTTONS
                btnDraw.Enabled = True
                grpDrawAll.Enabled = True
                If cbExistingOnly.Checked = True Then
                    '---FILTER OUT EXISTING SHAPES ONLY
                    sqlTable = fncDataTableFilterExistingItemsOnly(sqlTable, True)
                End If
                subPopulateListView_Assoc(lstShapes, sqlTable)
            End If

        End If

        sqlConn.Close()


    End Sub




    Private Sub btnRetrieve_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnRetrieve.Click

        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection

        If visSelection.Count = 0 Then

            MsgBox("Please select a SMARTS Shape first.")

        Else

            If subGetCriteria() = False Then
                '--- NO SHAPETYPES WERE CHECKED, ERROR OUT
                btnDraw.Enabled = False
                MsgBox("At least one shapetype must be selected")
                Exit Sub
            End If

            Dim visShape As Visio.Shape = visSelection.Item(1)
            If booFormValid(Me, visShape) Then
                lstShapes.Clear()
                '---GET RELATED SHAPES
                subGetRelatedShapes(visShape)

                btnDrawSelect_CheckedChanged(sender, e)
                If lstShapes.Items.Count = EMPTY_INT Then
                    btnDraw.Enabled = False
                    grpDrawAll.Enabled = False
                End If

            Else
                '---WRONG FORM
                Exit Sub
            End If

        End If

    End Sub

    Private Sub btnDraw_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDraw.Click

        '---FOCUS ON SELECTED SHAPE
        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection
        If visSelection.Count > 0 Then

            Dim visShape As Visio.Shape = visSelection.Item(1)
            If booFormValid(Me, visShape) Then

                '--- GET LIST OF ITEM SHAPES SELECTED
                Dim dtItems As DataTable = fncCreateTable_Items(lstShapes, "Item2")

                Dim intShapeIndex As Integer = 0
                For j As Integer = 0 To dtItems.Rows.Count - 1
                    subDrawShape_Item(visShape, dtItems.Rows(j), intShapeIndex, dtItems.Rows.Count)
                    intShapeIndex = intShapeIndex + 1
                Next

                ''--- DRAW ITEM SHAPES SELECTED
                '--- IF CHECKED, DRAW LINES
                If btnLinesYes.Checked = True Then
                    '--- GET LIST OF RELATION SHAPES SELECTED
                    Dim dtAssocs As DataTable = fncCreateTable_Assocs(lstShapes)
                    ''--- DRAW ITEM SHAPES SELECTED
                    For j As Integer = 0 To dtAssocs.Rows.Count - 1
                        subDrawShape_Assoc(visShape, dtAssocs.Rows(j))
                    Next
                End If
                '--- IF CHECKED, DELETE SELECTED SHAPE
                If btnHide.Checked = True Then
                    subDeleteShape(visShape)
                End If

                '--- UNLOAD FORM
                frmRelateShape_Unload(1)

            Else

                Exit Sub

            End If

        End If

    End Sub

End Class
