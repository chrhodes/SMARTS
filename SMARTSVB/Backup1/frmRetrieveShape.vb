Imports PacificLife.Life.Enterprise.Data
Imports Microsoft.Office.Interop


Public Class frmRetrieveShape

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
    Friend WithEvents btnRetrieve As System.Windows.Forms.Button
    Friend WithEvents lstShapes As System.Windows.Forms.ListView
    Friend WithEvents grpDrawAll As System.Windows.Forms.GroupBox
    Friend WithEvents btnDrawClear As System.Windows.Forms.RadioButton
    Friend WithEvents btnDrawSelect As System.Windows.Forms.RadioButton
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.btnRetrieve = New System.Windows.Forms.Button
        Me.lstShapes = New System.Windows.Forms.ListView
        Me.grpDrawAll = New System.Windows.Forms.GroupBox
        Me.btnDrawClear = New System.Windows.Forms.RadioButton
        Me.btnDrawSelect = New System.Windows.Forms.RadioButton
        Me.grpDrawAll.SuspendLayout()
        Me.SuspendLayout()
        '
        'btnRetrieve
        '
        Me.btnRetrieve.Anchor = CType(((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btnRetrieve.Location = New System.Drawing.Point(384, 360)
        Me.btnRetrieve.Name = "btnRetrieve"
        Me.btnRetrieve.Size = New System.Drawing.Size(120, 40)
        Me.btnRetrieve.TabIndex = 1
        Me.btnRetrieve.Text = "Retrieve"
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
        Me.lstShapes.Location = New System.Drawing.Point(16, 16)
        Me.lstShapes.Name = "lstShapes"
        Me.lstShapes.Size = New System.Drawing.Size(504, 328)
        Me.lstShapes.TabIndex = 2
        Me.lstShapes.View = System.Windows.Forms.View.Details
        '
        'grpDrawAll
        '
        Me.grpDrawAll.Anchor = System.Windows.Forms.AnchorStyles.Bottom
        Me.grpDrawAll.Controls.Add(Me.btnDrawClear)
        Me.grpDrawAll.Controls.Add(Me.btnDrawSelect)
        Me.grpDrawAll.Location = New System.Drawing.Point(168, 360)
        Me.grpDrawAll.Name = "grpDrawAll"
        Me.grpDrawAll.Size = New System.Drawing.Size(192, 40)
        Me.grpDrawAll.TabIndex = 15
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
        'frmRetrieveShape
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(536, 414)
        Me.Controls.Add(Me.grpDrawAll)
        Me.Controls.Add(Me.lstShapes)
        Me.Controls.Add(Me.btnRetrieve)
        Me.Name = "frmRetrieveShape"
        Me.Text = "Retrieve Shape"
        Me.grpDrawAll.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region


    Private Shared pvtShape_AbstractionID As Integer
    Private Shared pvtShape_ShapeTypeID As Integer


    Private Sub frmRetrieveShape_Unload(ByVal Cancel As Integer)

        If Cancel = 1 Then
            Dim frm As frmRetrieveShape = New frmRetrieveShape
            Hide()
            frm.Close()
            frm.Dispose()
        End If

    End Sub

    Private Sub frmRetrieveShape_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load


        '*** FIND SHAPE ***
        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection
        If visSelection.Count = 0 Then

            MsgBox("Please select a SMARTS Shape first.")

        Else

            Dim visShape As Visio.Shape = visSelection.Item(1)
            pvtShape_AbstractionID = visShape.Cells("Prop.AbstractionID").ResultIU
            pvtShape_ShapeTypeID = visShape.Cells("Prop.ShapeTypeID").ResultIU

            '---MAKE DB CALL GETSHAPELIST BY TYPE
            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            Dim strSQL As String = "GetShapeList_Browser " & visShape.Cells("Prop.ShapeTypeID").ResultIU
            Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
            Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable

            sqlTable = fncDataTableFilterNonExistingItemsOnly(sqlTable, False)
            subPopulateListView(sqlTable, visShape)

            sqlConn.Close()

        End If

    End Sub

    Private Sub btnRetrieve_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnRetrieve.Click

        '--- AT LEAST ONE SHAPE MUST BE SELECTED
        If lstShapes.SelectedItems.Count = EMPTY_INT Then
            Exit Sub
        End If

        '---FOCUS ON SELECTED SHAPE
        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection
        If visSelection.Count > 0 Then
            Dim visShape As Visio.Shape = visSelection.Item(1)
            If booFormValid(Me, visShape) Then
                If pvtShape_ShapeTypeID = visShape.Cells("Prop.ShapeTypeID").ResultIU Then
                    '--- CREATE LIST OF SHAPES SELECTED
                    Dim dtTable As DataTable = fncCreateTable_Items(lstShapes, "Item")
                    '--- DRAW SHAPES SELECTED
                    Dim intShapeIndex As Integer = 0
                    For j As Integer = 0 To dtTable.Rows.Count - 1
                        subDrawShape_Item(visShape, dtTable.Rows(j), intShapeIndex, dtTable.Rows.Count)
                        intShapeIndex = intShapeIndex + 1
                    Next
                    '--- DELETE CURRENT SHAPE
                    subDeleteShape(visShape)
                    '--- UNLOAD FORM
                    frmRetrieveShape_Unload(1)
                Else
                    MsgBox("List does not correspond to this shapetype. Choose [Retrieve] to refresh list.")
                End If

            Else

                Exit Sub

            End If

        End If

    End Sub

    Private Sub subPopulateListView(ByVal SQLTable As DataTable, ByVal visShape As Visio.Shape)

        '---GRAB MAX COLUMM WIDTH 
        Dim c As DataColumn
        For Each c In SQLTable.Columns

            'adding names of columns as Listview columns
            Dim h As New ColumnHeader

            '--- MAKE THIS THE STANDARD WIDTH UNLESS OTHERWISE STATED
            Select Case c.ColumnName
                Case "Item_Name", "Item_Desc"
                    h.Text = Replace(c.ColumnName, "_", " ")
                    h.Width = lstShapes.Width / 2
                Case "Container_ID"
                    h.Text = "ItemContainer ID"
                    h.Width = 0
                Case "Container_TypeID"
                    h.Text = "ItemContainer TypeID"
                    h.Width = 0
                Case Else
                    h.Text = Replace(c.ColumnName, "_", " ")
                    h.Width = 0
            End Select

            lstShapes.Columns.Add(h)
        Next

        '--- ADD AN ABSTRACTION ID FOR THIS LISTVIEW
        Dim h2 As New ColumnHeader
        h2.Text = "Item AbstractionID"
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


    Private Sub lstShapes_ColumnClick(ByVal sender As Object, ByVal e As System.Windows.Forms.ColumnClickEventArgs)

        subListViewSort(sender, e, lstShapes)

    End Sub

    Private Sub btnDrawSelect_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDrawSelect.CheckedChanged

        subListViewSelectAll(sender, e, lstShapes)

    End Sub

    Private Sub btnDrawClear_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDrawClear.CheckedChanged

        subListViewClearAll(sender, e, lstShapes)

    End Sub

End Class
