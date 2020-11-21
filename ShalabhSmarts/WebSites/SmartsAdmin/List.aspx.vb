Imports PacificLife.Life.Enterprise.Data
Imports System.Data
Imports SMARTSCommon.CommonClass

Public Class List
    Inherits BaseClass

    Protected WithEvents grdDesc As System.Web.UI.WebControls.ListBox
    'Protected WithEvents grdList As System.Web.UI.WebControls.ListBox
    'Protected WithEvents Label1 As System.Web.UI.WebControls.Label


#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Protected Sub DataBindList(ByVal sqlConn As PLDbConnection)

        Dim sqlCmd As PLDbCommand
        Dim sqlReader As PLDbDataReader
        Dim sqlSet As New DataSet

        '**** GET LIST & LABEL NAME ***
        Select Case Request.QueryString("list")
            Case LIST_ARTIFACTS
                Label1.Text = "Existing Artifacts"
                sqlCmd = New PLDbCommand("GetArtifactList", sqlConn)
            Case LIST_ATTRIBUTES
                Label1.Text = "Existing Attributes"
                sqlCmd = New PLDbCommand("GetAttributeList", sqlConn)
            Case LIST_SYSTEMS
                Label1.Text = "Existing Systems"
                sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_SYSTEM & ",NULL", sqlConn)
            Case LIST_OBJECTS
                Label1.Text = "Existing Objects"
                sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_OBJECT & ",NULL", sqlConn)
            Case LIST_DEVICES
                Label1.Text = "Existing Devices"
                sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_DEVICE & ",NULL", sqlConn)
            Case LIST_PIECES
                Label1.Text = "Existing Functional Pieces"
                sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_PIECE & ",NULL", sqlConn)
            Case LIST_BUSINESSES
                Label1.Text = "Existing Business Processes"
                sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_BUSINESS & ",NULL", sqlConn)
            Case LIST_STEPS
                Label1.Text = "Existing Process Steps"
                sqlCmd = New PLDbCommand("GetShapeList " & ABSTRACTION_STEP & ",NULL", sqlConn)
        End Select
        sqlReader = sqlCmd.ExecuteReader

        grdList.DataSource = sqlReader

        '**** GET TEXT & VALUES ***
        Select Case Request.QueryString("list")
            Case LIST_ARTIFACTS
                grdList.DataTextField = "Artifact_Name"
                grdList.DataValueField = "Artifact_ID"
            Case LIST_ATTRIBUTES
                grdList.DataTextField = "Attribute_Name"
                grdList.DataValueField = "Attribute_ID"
            Case LIST_SYSTEMS, LIST_OBJECTS, LIST_DEVICES, _
                LIST_PIECES, LIST_BUSINESSES, LIST_STEPS
                grdList.DataTextField = "shape_name"
                grdList.DataValueField = "shape_id"
        End Select

        grdList.DataBind()

        sqlReader.Close()

    End Sub



    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here

        If Not Page.IsPostBack Then

            Dim sqlConn As PLDbConnection = SMARTSConnectionOpen()
            DataBindList(sqlConn)
            sqlConn.Close()

        End If

    End Sub

End Class
