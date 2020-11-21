Imports Microsoft.Office.Interop
Imports PacificLife.Life.Enterprise.Data

Public Class frmDrillUp

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
    Friend WithEvents btnRelation As System.Windows.Forms.Button
    Friend WithEvents cbExisting As System.Windows.Forms.CheckBox
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents btnLinesYes As System.Windows.Forms.RadioButton
    Friend WithEvents btnLinesNo As System.Windows.Forms.RadioButton
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents btnHide As System.Windows.Forms.RadioButton
    Friend WithEvents btnShow As System.Windows.Forms.RadioButton
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.btnRelation = New System.Windows.Forms.Button
        Me.cbExisting = New System.Windows.Forms.CheckBox
        Me.GroupBox3 = New System.Windows.Forms.GroupBox
        Me.btnLinesYes = New System.Windows.Forms.RadioButton
        Me.btnLinesNo = New System.Windows.Forms.RadioButton
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.btnHide = New System.Windows.Forms.RadioButton
        Me.btnShow = New System.Windows.Forms.RadioButton
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'btnRelation
        '
        Me.btnRelation.Location = New System.Drawing.Point(8, 208)
        Me.btnRelation.Name = "btnRelation"
        Me.btnRelation.Size = New System.Drawing.Size(144, 40)
        Me.btnRelation.TabIndex = 4
        Me.btnRelation.Text = "Retrieve Relations"
        '
        'cbExisting
        '
        Me.cbExisting.Location = New System.Drawing.Point(24, 168)
        Me.cbExisting.Name = "cbExisting"
        Me.cbExisting.Size = New System.Drawing.Size(128, 32)
        Me.cbExisting.TabIndex = 11
        Me.cbExisting.Text = "Draw lines between existing shapes"
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.btnLinesYes)
        Me.GroupBox3.Controls.Add(Me.btnLinesNo)
        Me.GroupBox3.Location = New System.Drawing.Point(8, 88)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(144, 72)
        Me.GroupBox3.TabIndex = 13
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "Draw lines"
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
        'btnLinesNo
        '
        Me.btnLinesNo.Location = New System.Drawing.Point(16, 48)
        Me.btnLinesNo.Name = "btnLinesNo"
        Me.btnLinesNo.Size = New System.Drawing.Size(64, 16)
        Me.btnLinesNo.TabIndex = 7
        Me.btnLinesNo.Text = "No "
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.GroupBox2)
        Me.GroupBox1.Controls.Add(Me.btnHide)
        Me.GroupBox1.Controls.Add(Me.btnShow)
        Me.GroupBox1.Location = New System.Drawing.Point(8, 8)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(144, 72)
        Me.GroupBox1.TabIndex = 12
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
        Me.btnHide.Location = New System.Drawing.Point(16, 48)
        Me.btnHide.Name = "btnHide"
        Me.btnHide.Size = New System.Drawing.Size(80, 16)
        Me.btnHide.TabIndex = 2
        Me.btnHide.Text = "Hide"
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
        'frmDrillUp
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(160, 254)
        Me.Controls.Add(Me.GroupBox3)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.cbExisting)
        Me.Controls.Add(Me.btnRelation)
        Me.Name = "frmDrillUp"
        Me.Text = "Drill Up Level"
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region


    Private Sub frmDrillUp_Unload(ByVal Cancel As Integer)

        If Cancel = 1 Then
            Dim frm As frmDrillUp = New frmDrillUp
            Hide()
            frm.Close()
            frm.Dispose()
        End If

    End Sub


    Private Sub btnRelation_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnRelation.Click

        '---SET FOCUS ON SELECTED SHAPE
        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection

        If visSelection.Count = 0 Then

            '---NOTHING WAS SELECTED, RAISE ERRORMSG
            MsgBox("Please select a SMARTS Shape first.")

        Else

            '--- SELECT THE CONTAINER SHAPE OF THIS SHAPE ")
            Dim visShape As Visio.Shape = visSelection.Item(1)
            If booFormValid(Me, visShape) Then
                Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
                Dim sqlTable As DataTable = fncDataTableRelatedShapes(sqlConn, RELATIONTYPE_CONTAINER, visShape)
                '--- FILTER OUT THE SHAPES THAT ARE NOT THE SAME ABSTRACTION (THIS GETS MOST IMMEDIATE CONTAINER)
                Dim sqlTableFiltered As DataTable = sqlTable.Copy
                sqlTableFiltered = fncDataTableFilterShapeAbstraction(sqlTableFiltered, visShape.Cells("Prop.AbstractionID").ResultIU)
                '--- CHECK ONE LEVEL HIGHER FOR OBJECT AND STEP SHAPES
                If sqlTableFiltered.Rows.Count = EMPTY_INT Then
                    Select Case visShape.Cells("Prop.AbstractionID").ResultIU
                        Case ABSTRACTION_OBJECT
                            sqlTable = fncDataTableFilterShapeAbstraction(sqlTable, ABSTRACTION_SYSTEM)
                        Case ABSTRACTION_STEP
                            sqlTable = fncDataTableFilterShapeAbstraction(sqlTable, ABSTRACTION_BUSINESS)
                    End Select
                End If

                If sqlTable.Rows.Count > 0 Then

                    '--- DRAW THE CONTAINER
                    subDrawShapes(sqlConn, sqlTable, visShape, True)
                    If btnShow.Checked = True Then
                        g_booRelationReplace = False
                        If cbExisting.Checked = True Then
                            subDrawRelationsAll_ExistingShapes(sqlConn, sqlTable)
                            '---DRAW RELATIONS OF EXISTING SHAPES
                            If btnLinesNo.Checked = True Then
                                '--- DELETE SHAPE'S RELATIONS
                                subDeleteRelations(visShape)
                            End If
                        Else
                            '---DRAW RELATIONS TO CHILDREN
                            If btnLinesYes.Checked = True Then
                                subDrawRelations(RELATIONTYPE_CONTAINER, sqlTable, visShape.Name)
                            End If
                        End If
                    Else
                        '''--- btnHide IS CHECKED
                        g_booRelationReplace = True
                        '--- DELETE SELECTED SHAPE
                        subDeleteShape(visShape)
                        '---DRAW RELATIONS OF EXISTING SHAPES
                        If cbExisting.Checked = True Then
                            subDrawRelationsAll_ExistingShapes(sqlConn, sqlTable)
                        End If
                    End If

                Else

                    MsgBox("Next level does not exist.")

                End If

                sqlConn.Close()

            Else
                Exit Sub
            End If

        End If

        '--- UNLOAD FORM
        frmDrillUp_Unload(1)

    End Sub


    Private Sub cbExisting_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbExisting.CheckedChanged

    End Sub
End Class
