Imports PacificLife.Life.Enterprise.Data

Public Class enterprise
    Inherits BaseClass

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Protected WithEvents btnShow As System.Web.UI.WebControls.Button
    Protected WithEvents btnPage As System.Web.UI.WebControls.Button
    'Protected WithEvents cblAttributeList As System.Web.UI.WebControls.CheckBoxList
    Protected WithEvents btnViewReport As System.Web.UI.WebControls.Button
    Protected WithEvents cblAttributes As System.Web.UI.WebControls.CheckBoxList

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here

        If Not Page.IsPostBack Then

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            Dim sqlCmd As PLDbCommand = New PLDbCommand("EXEC GetReport_LevelAttributeList", sqlConn)
            Dim sqlTable As DataTable = sqlCmd.ExecuteDataTable

            cblAttributes.DataSource = sqlTable
            cblAttributes.DataBind()

            sqlConn.Close()

        End If

    End Sub

    Sub btnViewReport_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnViewReport.Click

        Dim intNumSelected As Integer
        Dim strParams As String

        intNumSelected = 0
        strParams = ""
        For i As Integer = 0 To cblAttributes.Items.Count - 1
            If intNumSelected < 6 Then
                If cblAttributes.Items(i).Selected = True Then
                    intNumSelected = intNumSelected + 1
                    strParams = strParams & CStr(cblAttributes.Items(i).Value) & ","
                End If
            Else
                Exit For
            End If
        Next
        If intNumSelected < 6 Then
            For j As Integer = 0 To (5 - intNumSelected)
                strParams = strParams & "NULL,"
            Next
        End If

        strParams = Left(strParams, Len(strParams) - 1)

        Response.Redirect("EnterpriseReport.aspx?attributes=" & strParams)

    End Sub


End Class
