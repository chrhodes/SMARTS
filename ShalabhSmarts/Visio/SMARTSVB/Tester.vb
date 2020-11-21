Imports PacificLife.Life.Enterprise.Data


Module Tester

    Sub MainTest()

        Dim conn As PLDbConnection
        Try
            conn = SMARTSVB.BaseClass.SMARTSConnectionOpen()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

End Module
