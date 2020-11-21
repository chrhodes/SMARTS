<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Object.aspx.cs" Inherits="Smarts3Browser.Object" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMARTS3 Browser</title>
    <link href="Styles/Site.css" type="text/css" rel="stylesheet" />
</head>
<body id="thebody">
    <form id="theForm" method="post" runat="server">
    <table id="tblSystems" cellspacing="3" cellpadding="3" style="width: 95%; text-align: center">
        <tr>
            <td>
                <h4>
                    <label>
                        Object</label></h4>
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td align="left" valign="top" style="width: 60%">
                            <h6>
                                Shapes in the <b>Object</b> level are contained by a <b>System</b>, hosted by <b>Devices</b>,
                                used by <b>Process Steps</b>, contain <b>Functional Pieces</b>, have <b>Attributes</b>
                                and <b>Artifacts</b>, and relate to other <b>Objects</b>.</h6>
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td align="right" style="width: 35%">
                            <h6>
                                <a href="../Smarts3Admin/default.aspx">SMARTS3 Administration Home</a><br />
                                <a href="default.aspx">SMARTS3 Browser Home</a><br />
                                <a href="../Smarts3Admin/object.aspx?id=<%=Request.QueryString["id"]%>&type=<%=Request.QueryString["type"]%>">
                                    Edit This Object</a><br />
                                <asp:HyperLink ID="urlHistory" runat="server">View History</asp:HyperLink><br />
                            </h6>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataGrid ID="grdName" BorderWidth="1px" Style="width: 100%" HeaderStyle-Font-Size="10pt"
                    HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="left"
                    ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="left"
                    runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundColumn HeaderText="Name" HeaderStyle-Width="40%" ItemStyle-Width="40%"
                            DataField="Principal_Name"></asp:BoundColumn>
                        <asp:BoundColumn HeaderText="ShapeType" HeaderStyle-Width="30%" ItemStyle-Width="30%"
                            DataField="Principal_TypeName"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="System" HeaderStyle-Width="40%" ItemStyle-Width="40%">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlSystem" runat="server" NavigateUrl='<%# "sys.aspx?id=" + DataBinder.Eval(Container.DataItem, "Related_ID")%>'>
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
                <asp:DataGrid ID="grdDescription" BorderWidth="1px" Style="width: 100%" HeaderStyle-Font-Size="10pt"
                    HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="left"
                    ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="left"
                    runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundColumn HeaderText="Description" DataField="Shape_Desc"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
                <asp:DataGrid ID="grdLifecycle" BorderWidth="1px" Style="width: 100%" HeaderStyle-Font-Size="10pt"
                    HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="left"
                    ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="left"
                    runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundColumn HeaderText="LifeCycle" DataField="Lifecycle_Name"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid><br />
                <h5>
                    <label>
                        ATTRIBUTES</label></h5>
                <asp:DataGrid ID="grdAttribute" BorderWidth="1px" Style="width: 100%" HeaderStyle-Font-Size="10pt"
                    HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="left"
                    ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="left"
                    runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundColumn HeaderText="Attribute" DataField="Attribute_Name"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderStyle-Font-Size="10pt" HeaderStyle-Width="43%" HeaderStyle-BackColor="#000099"
                            HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="left"
                            HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="left" HeaderText="Value">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlAttributeValue" runat="server" Target="_blank" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value") %>'>
											<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value")%>
                                </asp:HyperLink>
                                <asp:Label ID="lblAttributeValue" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value") %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid><br />
                <%--<h5>
                    <label>
                        EXTERNAL INFORMATION Artifacts</label></h5>
                <asp:DataGrid ID="grdArtifacts" BorderWidth="1px" Style="width: 100%" HeaderStyle-Font-Size="10pt"
                    HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="left"
                    ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="left"
                    runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateColumn ItemStyle-HorizontalAlign="left" ItemStyle-Width="20%" HeaderStyle-Width="20%">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" Target="_blank" ID="urlArtifact_Location" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Related_Desc") %>'>
											View
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Artifact" ItemStyle-HorizontalAlign="left" ItemStyle-Width="65%"
                            HeaderStyle-Width="65%" FooterStyle-Width="65%">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" NavigateUrl='<%# "artifact.aspx?id=" + Request.QueryString["id"] + "&type=" + Request.QueryString["type"] + "&artifact=" +  DataBinder.Eval(Container.DataItem, "Related_ID")%>'
                                    ID="urlArtifact">
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid><br />--%>
                <h5>
                    <label>
                        CONTAINS Objects of Systems</label></h5>
                <asp:Label runat="server" ID="lblStub" Style="width: 100%" BackColor="#000099" ForeColor="#ffffff"
                    Font-Bold="True" Font-Size="10pt" BorderColor="#ffffff" BorderWidth="1">Functional Piece</asp:Label>
                <br />
                <h5>
                    <label>
                        USED BY Process Steps of Business Processes</label></h5>
                <asp:DataGrid ID="grdStepObject" Style="width: 100%" runat="server" BorderWidth="1"
                    ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="left"
                    HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt" AutoGenerateColumns="False"
                    HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
                    <Columns>
                        <asp:TemplateColumn HeaderText="Business Process" ItemStyle-HorizontalAlign="left"
                            ItemStyle-Width="25%" HeaderStyle-Width="25%">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlStepBusinessProcess" runat="server" NavigateUrl='<%# "BusinessProcess.aspx?id=" + DataBinder.Eval(Container.DataItem, "RelatedContainer_ID") + "&type=" +DataBinder.Eval(Container.DataItem, "RelatedContainer_TypeID") %>'>
											<%# DataBinder.Eval(Container.DataItem, "RelatedContainer_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Process Step" ItemStyle-HorizontalAlign="left" ItemStyle-Width="25%"
                            HeaderStyle-Width="25%">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlStepObject" runat="server" NavigateUrl='<%# "Step.aspx?id=" + DataBinder.Eval(Container.DataItem, "Related_ID") + "&type=" + DataBinder.Eval(Container.DataItem, "Related_TypeID") %>'>
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn ItemStyle-Width="50%" HeaderStyle-Width="50%" HeaderText="Description"
                            HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left" DataField="Related_Desc">
                        </asp:BoundColumn>
                    </Columns>
                </asp:DataGrid><br />
                <h5>
                    <label>
                        HOSTED BY Devices</label></h5>
                <asp:DataGrid ID="grdDeviceObject" Style="width: 100%" runat="server" BorderWidth="1"
                    ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="left"
                    HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt" AutoGenerateColumns="False"
                    HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
                    <Columns>
                        <asp:BoundColumn ItemStyle-Width="25%" HeaderStyle-Width="25%" HeaderText="Environment"
                            HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="Left" DataField="Related_Environment">
                        </asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="Device" ItemStyle-Width="25%" HeaderStyle-Width="25%">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlDeviceObjectServer" runat="server" NavigateUrl='<%# "Device.aspx?id=" 
                                            + DataBinder.Eval(Container.DataItem, "Related_ID") 
                                            + "&type=" 
                                            + DataBinder.Eval(Container.DataItem, "Related_TypeID") %>'>
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn ItemStyle-Width="50%" HeaderStyle-Width="50%" HeaderText="Description"
                            HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="Left" DataField="Related_Desc">
                        </asp:BoundColumn>
                    </Columns>
                </asp:DataGrid><br />
                <h5>
                    <label>
                        RELATIONS with Objects of Systems</label></h5>
                <asp:DataGrid ID="grdRelations" Style="width: 100%" runat="server" BorderWidth="1"
                    ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt"
                    HeaderStyle-HorizontalAlign="left" HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt"
                    AutoGenerateColumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
                    <Columns>
                        <asp:BoundColumn HeaderText="Direction" DataField="Assoc_Direction"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="System" ItemStyle-Width="25%" HeaderStyle-Width="25%">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" NavigateUrl='<%# "sys.aspx?id=" 
                                            + DataBinder.Eval(Container.DataItem, "RelatedContainer_ID") 
                                            + "&type=" 
                                            + DataBinder.Eval(Container.DataItem, "RelatedContainer_TypeID")%>' ID="urlRelationSystem">
											<%# Dummylink(DataBinder.Eval(Container.DataItem, "RelatedContainer_Name").ToString())%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn HeaderText="Type" DataField="Related_TypeName" ItemStyle-Width="10%"
                            HeaderStyle-Width="10%"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="Object" ItemStyle-Width="25%" HeaderStyle-Width="25%">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" NavigateUrl='<%# "object.aspx?id=" + DataBinder.Eval(Container.DataItem, "Related_ID") + "&type=" + DataBinder.Eval(Container.DataItem, "Related_TypeID")%>'
                                    ID="urlRelationObject">
											<%# DataBinder.Eval(Container.DataItem, "Related_Name").ToString()%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Relation" ItemStyle-Wrap="True" ItemStyle-Width="30%"
                            HeaderStyle-Width="30%">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" NavigateUrl='<%# "Relation.aspx?id=" 
                                            + DataBinder.Eval(Container.DataItem, "Principal_ID") 
                                            + "&type=" 
                                            + DataBinder.Eval(Container.DataItem, "Principal_TypeID") 
                                            + "&relation=" 
                                            +  DataBinder.Eval(Container.DataItem, "Assoc_ID")%>' ID="urlRelationName">
											<%# Dummylink((string)DataBinder.Eval(Container.DataItem, "Assoc_Name"))%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid><br />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
