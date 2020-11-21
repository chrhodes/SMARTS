Imports Microsoft.Office.Interop
Imports PacificLife.Life.Enterprise.Data

Public Class frmEditVisio

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
    Friend WithEvents btnClear As System.Windows.Forms.RadioButton
    Friend WithEvents btnMarkNotInUse As System.Windows.Forms.RadioButton
    Friend WithEvents btnMarkDoesNotExist As System.Windows.Forms.RadioButton
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents cbGroup As System.Windows.Forms.CheckBox
    Friend WithEvents dlgColor As System.Windows.Forms.ColorDialog
    Friend WithEvents btnColorPicker As System.Windows.Forms.Button
    Friend WithEvents tbColorPicker As System.Windows.Forms.TextBox


    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.btnSubmit = New System.Windows.Forms.Button
        Me.btnClear = New System.Windows.Forms.RadioButton
        Me.btnMarkNotInUse = New System.Windows.Forms.RadioButton
        Me.btnMarkDoesNotExist = New System.Windows.Forms.RadioButton
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.cbGroup = New System.Windows.Forms.CheckBox
        Me.dlgColor = New System.Windows.Forms.ColorDialog
        Me.btnColorPicker = New System.Windows.Forms.Button
        Me.tbColorPicker = New System.Windows.Forms.TextBox
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'btnSubmit
        '
        Me.btnSubmit.Location = New System.Drawing.Point(184, 72)
        Me.btnSubmit.Name = "btnSubmit"
        Me.btnSubmit.Size = New System.Drawing.Size(144, 32)
        Me.btnSubmit.TabIndex = 8
        Me.btnSubmit.Text = "Submit"
        '
        'btnClear
        '
        Me.btnClear.Checked = True
        Me.btnClear.Location = New System.Drawing.Point(8, 16)
        Me.btnClear.Name = "btnClear"
        Me.btnClear.Size = New System.Drawing.Size(136, 24)
        Me.btnClear.TabIndex = 6
        Me.btnClear.TabStop = True
        Me.btnClear.Text = "None"
        '
        'btnMarkNotInUse
        '
        Me.btnMarkNotInUse.Location = New System.Drawing.Point(8, 64)
        Me.btnMarkNotInUse.Name = "btnMarkNotInUse"
        Me.btnMarkNotInUse.Size = New System.Drawing.Size(128, 24)
        Me.btnMarkNotInUse.TabIndex = 5
        Me.btnMarkNotInUse.Text = "Mark as Not In Use"
        '
        'btnMarkDoesNotExist
        '
        Me.btnMarkDoesNotExist.Location = New System.Drawing.Point(8, 40)
        Me.btnMarkDoesNotExist.Name = "btnMarkDoesNotExist"
        Me.btnMarkDoesNotExist.Size = New System.Drawing.Size(144, 24)
        Me.btnMarkDoesNotExist.TabIndex = 4
        Me.btnMarkDoesNotExist.Text = "Mark as Does Not Exist"
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.btnMarkDoesNotExist)
        Me.GroupBox1.Controls.Add(Me.btnMarkNotInUse)
        Me.GroupBox1.Controls.Add(Me.btnClear)
        Me.GroupBox1.Location = New System.Drawing.Point(16, 8)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(160, 96)
        Me.GroupBox1.TabIndex = 9
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Edit Pattern"
        '
        'cbGroup
        '
        Me.cbGroup.Checked = True
        Me.cbGroup.CheckState = System.Windows.Forms.CheckState.Checked
        Me.cbGroup.Location = New System.Drawing.Point(184, 48)
        Me.cbGroup.Name = "cbGroup"
        Me.cbGroup.Size = New System.Drawing.Size(144, 16)
        Me.cbGroup.TabIndex = 14
        Me.cbGroup.Text = "Apply to group"
        '
        'btnColorPicker
        '
        Me.btnColorPicker.Location = New System.Drawing.Point(184, 16)
        Me.btnColorPicker.Name = "btnColorPicker"
        Me.btnColorPicker.Size = New System.Drawing.Size(112, 24)
        Me.btnColorPicker.TabIndex = 15
        Me.btnColorPicker.Text = "Choose Color"
        '
        'tbColorPicker
        '
        Me.tbColorPicker.Location = New System.Drawing.Point(304, 16)
        Me.tbColorPicker.Name = "tbColorPicker"
        Me.tbColorPicker.Size = New System.Drawing.Size(24, 20)
        Me.tbColorPicker.TabIndex = 15
        Me.tbColorPicker.Text = ""
        '
        'frmEditVisio
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(344, 118)
        Me.Controls.Add(Me.cbGroup)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.btnSubmit)
        Me.Controls.Add(Me.btnColorPicker)
        Me.Controls.Add(Me.tbColorPicker)
        Me.Name = "frmEditVisio"
        Me.Text = "Edit Visio"
        Me.GroupBox1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub frmEditVisio_Unload(ByVal Cancel As Integer)

        If Cancel = 1 Then
            Dim frm As frmEditVisio = New frmEditVisio
            Hide()
            frm.Close()
            frm.Dispose()
        End If

    End Sub



    Private Sub btnSubmit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        '---SET FOCUS ON SELECTED SHAPE
        Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection

        If visSelection.Count = 0 Then
            '---NOTHING WAS SELECTED, RAISE ERRORMSG
            MsgBox("Please select a SMARTS Shape first.")
        Else
            Dim visShape As Visio.Shape = visSelection.Item(1)
            If btnClear.Checked = True Then
                visShape.Cells("FillBkgndTrans").FormulaForce = "0%"
                visShape.Cells("FillPattern").ResultIUForce = 1
            ElseIf btnMarkDoesNotExist.Checked = True Then
                visShape.Cells("FillBkgndTrans").FormulaForce = "30%"
                visShape.Cells("FillPattern").ResultIUForce = 26
            ElseIf btnMarkNotInUse.Checked = True Then
                visShape.Cells("FillBkgndTrans").FormulaForce = "75%"
                visShape.Cells("FillPattern").ResultIUForce = 5
            End If
            'visShape.Cells("FillForegnd").Formula = "RGB(" & cboColorPicker.SelectedColor.R & "," & cboColorPicker.SelectedColor.G & "," & cboColorPicker.SelectedColor.B & ")"
            visShape.Cells("FillForegnd").Formula = "RGB(" & tbColorPicker.BackColor.R & "," & tbColorPicker.BackColor.G & "," & tbColorPicker.BackColor.B & ")"

            If cbGroup.Checked = True Then
                '---CHANGE ALL ITS CONTAINEDS/CONTAINERS
                Dim visContained As Visio.Shape
                Dim visShapes As Visio.Shapes = g_visApp.ActivePage.Shapes
                For Each visContained In visShapes
                    If visContained.Cells("Prop.AbstractionID").ResultIU <> ABSTRACTION_RELATION Then
                        If (visContained.Cells("Prop.ContainerID").ResultIU = visShape.Cells("Prop.ShapeID").ResultIU _
                            And visContained.Cells("Prop.ContainerID").ResultIU <> EMPTY_INT _
                            And visContained.Cells("Prop.ContainerTypeID").ResultIU = visShape.Cells("Prop.ShapeTypeID").ResultIU) _
                            Or (visContained.Cells("Prop.ContainerID").ResultIU = visShape.Cells("Prop.ContainerID").ResultIU _
                            And visContained.Cells("Prop.ContainerID").ResultIU <> EMPTY_INT _
                            And visContained.Cells("Prop.ContainerTypeID").ResultIU = visShape.Cells("Prop.ContainerTypeID").ResultIU) _
                            Or (visContained.Cells("Prop.ShapeID").ResultIU = visShape.Cells("Prop.ContainerID").ResultIU _
                            And visShape.Cells("Prop.ContainerID").ResultIU <> EMPTY_INT _
                            And visContained.Cells("Prop.ShapeTypeID").ResultIU = visShape.Cells("Prop.ContainerTypeID").ResultIU) Then

                            visContained.Cells("FillBkgndTrans").FormulaForce() = visShape.Cells("FillBkgndTrans").ResultStr(33)
                            visContained.Cells("FillPattern").ResultIUForce = visShape.Cells("FillPattern").ResultIU
                            visContained.Cells("FillForegnd").Formula = visShape.Cells("FillForegnd").ResultIU
                        End If
                    End If
                Next
            End If
        End If


        '---UNLOAD FORM
        frmEditVisio_Unload(1)

    End Sub

    Private Sub btnColorPicker_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnColorPicker.Click

        dlgColor.Color = tbColorPicker.BackColor
        If dlgColor.ShowDialog() = DialogResult.OK Then
            tbColorPicker.BackColor = dlgColor.Color
        End If

    End Sub



End Class
