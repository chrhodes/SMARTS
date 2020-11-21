Imports SMARTSVB.BaseClass
Imports Microsoft.Office.Interop
Imports PacificLife.Life.Enterprise.Data

Module Startup


    Sub Main()

        Dim intIndex As Integer
        Dim arrCommandLine As Array = System.Environment.GetCommandLineArgs
        Dim strCommand As String
        Dim strFunction As String = "/VBCall="

        '--- SEARCH FOR FUNCTION NAME
            For intIndex = 0 To UBound(arrCommandLine)
                If InStr(arrCommandLine(intIndex), strFunction, CompareMethod.Text) > EMPTY_INT Then
                    strCommand = arrCommandLine(intIndex).Substring(strFunction.Length)
                    Exit For
                End If
            Next

        Dim frm As BaseClass = New BaseClass

        '---SET FOCUS ON SELECTED SHAPE
        Dim visApp As Visio.Application = GetObject(, "Visio.Application")
        g_visApp = visApp

        If strCommand = "ValidateSheet" Or strCommand = "ShowRelations" Then
            Select Case strCommand
                Case "ValidateSheet"
                    g_intAction = ACTIONITEM_VALIDATESHEET
                    frm.subValidate()
                Case "Summarize"
                    g_intAction = ACTIONITEM_SUMMARIZE
                    frm.subSummarize()
                Case "ShowRelations"
                    g_intAction = ACTIONITEM_SHOWRELATIONS
                    frm.subRelate()
                Case Else
                    MsgBox("Error accessing SMARTS")
            End Select
        Else
            Dim visSelection As Visio.Selection = g_visApp.ActiveWindow.Selection
            If visSelection.Count = 0 Then
                '---NOTHING WAS SELECTED, RAISE ERRORMSG
                MsgBox("Please select a SMARTS Shape first.")
            Else
                g_visApp.EventsEnabled = False
                g_visApp.ScreenUpdating = False
                Dim visShape As Visio.Shape = visSelection.Item(1)
                Select Case strCommand
                    Case "DrillDown"
                        g_intAction = ACTIONITEM_DRILLDOWN
                        frm.subRelate()
                        'frm.subDrillDown()
                    Case "DrillUp"
                        g_intAction = ACTIONITEM_DRILLUP
                        frm.subRelate()
                        'frm.subDrillUp()
                    Case "Properties"
                        g_intAction = ACTIONITEM_PROPERTIES
                        frm.subProperties(visShape)
                    Case "RelationBusinessProcess"
                        g_intAction = ACTIONITEM_BUSINESSPROCESS
                        frm.subRelate()
                        'frm.subRelation()
                    Case "RelationInfrastructure"
                        g_intAction = ACTIONITEM_INFRASTRUCTURE
                        frm.subRelate()
                        'frm.subRelation()
                    Case "RelationSystem"
                        g_intAction = ACTIONITEM_SYSTEM
                        frm.subRelate()
                        'frm.subRelation()
                    Case "Retrieve"
                        g_intAction = ACTIONITEM_RETRIEVE
                        frm.subRetrieve()
                    Case "EditVisio"
                        g_intAction = ACTIONITEM_EDITVISIO
                        frm.subEditVisio()
                    Case "ValidateShape"
                        g_intAction = ACTIONITEM_VALIDATESHAPE
                        frm.subValidate()
                    Case "ShapeDrop"
                        g_intAction = ACTIONITEM_SHAPEDROP
                        frm.subShapeDrop()
                    Case "Reconnect"
                        g_intAction = ACTIONITEM_RECONNECT
                        frm.subReconnect(visShape)
                    Case Else
                        MsgBox("Error accessing SMARTS")
                End Select
                g_visApp.EventsEnabled = True
                g_visApp.ScreenUpdating = True
            End If
        End If


    End Sub


End Module
