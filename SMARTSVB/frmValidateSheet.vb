Imports Microsoft.Office.Interop
Imports PacificLife.Life.Enterprise.Data


Public Class frmValidateSheet

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
    Friend WithEvents btnValidate As System.Windows.Forms.RadioButton
    Friend WithEvents btnRefresh As System.Windows.Forms.RadioButton
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.btnSubmit = New System.Windows.Forms.Button
        Me.btnValidate = New System.Windows.Forms.RadioButton
        Me.btnRefresh = New System.Windows.Forms.RadioButton
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'btnSubmit
        '
        Me.btnSubmit.Location = New System.Drawing.Point(16, 104)
        Me.btnSubmit.Name = "btnSubmit"
        Me.btnSubmit.Size = New System.Drawing.Size(136, 40)
        Me.btnSubmit.TabIndex = 6
        Me.btnSubmit.Text = "Submit"
        '
        'btnValidate
        '
        Me.btnValidate.Checked = True
        Me.btnValidate.Location = New System.Drawing.Point(16, 48)
        Me.btnValidate.Name = "btnValidate"
        Me.btnValidate.Size = New System.Drawing.Size(112, 24)
        Me.btnValidate.TabIndex = 3
        Me.btnValidate.TabStop = True
        Me.btnValidate.Text = "Validate Page"
        '
        'btnRefresh
        '
        Me.btnRefresh.Location = New System.Drawing.Point(16, 16)
        Me.btnRefresh.Name = "btnRefresh"
        Me.btnRefresh.Size = New System.Drawing.Size(112, 24)
        Me.btnRefresh.TabIndex = 2
        Me.btnRefresh.Text = "Refresh Page"
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.btnRefresh)
        Me.GroupBox1.Controls.Add(Me.btnValidate)
        Me.GroupBox1.Location = New System.Drawing.Point(16, 8)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(136, 80)
        Me.GroupBox1.TabIndex = 7
        Me.GroupBox1.TabStop = False
        '
        'frmValidateSheet
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(168, 158)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.btnSubmit)
        Me.Name = "frmValidateSheet"
        Me.Text = "Refresh Or Validate"
        Me.GroupBox1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region


    Private Sub frmValidateSheet_Unload(ByVal Cancel As Integer)

        If Cancel = 1 Then
            Dim frm As frmValidateSheet = New frmValidateSheet
            Hide()
            frm.Close()
            frm.Dispose()
        End If

    End Sub


    Private Sub btnSubmit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        '--- FIND SHAPES ON THE PAGE
        Dim visShapes As Visio.Shapes = g_visApp.ActivePage.Shapes

        If btnValidate.Checked = True Then
            '--- VALIDATE PAGE
            subVerify(visShapes)
        Else
            '--- REFRESH PAGE
            subRefresh(visShapes)
        End If

        '--- UNLOAD FORM
        frmValidateSheet_Unload(1)

    End Sub

    Private Sub subRefresh(ByVal visShapes As Visio.Shapes)

        '--- ONLY REFRESH THE SMARTS SHAPES
        Dim visShape As Visio.Shape
        Dim strSQLRelation As String = ""
        Dim strSQLItem As String = ""
        For Each visShape In visShapes
            If visShape.CellExists("Prop.AbstractionID", False) = True Then
                If visShape.Cells("Prop.AbstractionID").ResultIU = ABSTRACTION_RELATION Then
                    '--- REFRESH SHAPE RELATION
                    If visShape.Cells("Prop.ShapeTypeID").ResultIU = SHAPETYPE_CROSSRELATION Then
                        strSQLRelation = strSQLRelation & "EXEC GetContainer " & CStr(visShape.Cells("Prop.ShapeID").ResultIU) & "; "
                    Else
                        strSQLRelation = strSQLRelation & "EXEC GetRelation " & CStr(visShape.Cells("Prop.ShapeID").ResultIU) & "; "
                    End If
                Else
                    '--- REFRESH SHAPE ITEM
                    strSQLItem = strSQLItem & "EXEC GetItem " & TABLE_SHAPE & " ," & CStr(visShape.Cells("Prop.ShapeID").ResultIU) & "; "
                End If
            End If
        Next

        '---CREATE SQL DataSet
        Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
        Dim sqlCmd As PLDbCommand
        Dim sqlAdapter As PLDbDataAdapter
        Dim sqlSet As New DataSet

        '---REFRESHES SHAPE INFO
        If Len(Trim(strSQLItem)) > EMPTY_INT Then
            sqlCmd = New PLDbCommand(strSQLItem, sqlConn)
            sqlAdapter = New PLDbDataAdapter(sqlCmd)
            sqlAdapter.Fill(sqlSet)
            subRefreshShapes(sqlSet, False)
        Else
            MsgBox("No SMARTS shapes exist. Only SMARTS shapes can be refreshed.")
        End If

        '---REFRESHES RELATION INFO
        If Len(Trim(strSQLRelation)) > EMPTY_INT Then
            sqlCmd = New PLDbCommand(strSQLRelation, sqlConn)
            sqlAdapter = New PLDbDataAdapter(sqlCmd)
            Dim sqlSet2 As New DataSet
            sqlAdapter.Fill(sqlSet2)
            subRefreshShapes(sqlSet2, True)
        Else
            MsgBox("No SMARTS relations exist. Only SMARTS relations can be refreshed.")
        End If

        sqlConn.Close()

    End Sub


    Protected Sub subVerify(ByVal visShapes As Visio.Shapes)

        '--- ONLY VALIDATE THE SMARTS RELATIONS
        Dim visShape As Visio.Shape
        Dim strSQL As String = ""
        For Each visShape In visShapes
            If visShape.CellExists("Prop.AbstractionID", False) = True Then
                If visShape.Cells("Prop.AbstractionID").ResultIU = ABSTRACTION_RELATION Then
                    '--- VALIDATING SHAPE RELATION
                    If visShape.Cells("Prop.ShapeTypeID").ResultIU = SHAPETYPE_CROSSRELATION Then
                        strSQL = strSQL & "EXEC GetContainer " & CStr(visShape.Cells("Prop.ShapeID").ResultIU) & "; "
                    Else
                        strSQL = strSQL & "EXEC GetRelation " & CStr(visShape.Cells("Prop.ShapeID").ResultIU) & "; "
                    End If
                End If
            End If
        Next

        '---CREATE SQL DataTable
        If Len(Trim(strSQL)) > EMPTY_INT Then
            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            Dim sqlCmd As PLDbCommand = New PLDbCommand(strSQL, sqlConn)
            Dim sqlAdapter As PLDbDataAdapter = New PLDbDataAdapter(sqlCmd)
            Dim sqlSet As New DataSet
            sqlAdapter.Fill(sqlSet)
            sqlConn.Close()
            '---VALIDATE RELATIONS
            subVerifyAssociations(sqlSet, visShapes)
        Else
            MsgBox("No SMARTS relations exist. Only SMARTS relations can be validated.")
        End If


    End Sub

End Class
