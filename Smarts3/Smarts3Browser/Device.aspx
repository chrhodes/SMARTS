<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Device.aspx.cs" Inherits="Smarts3Browser.Device" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMARTS3 Browser</title>
    <link href="Styles/Site.css" type="text/css" rel="stylesheet" />
</head>
<body id="thebody">
    <form id="theForm" method="post" runat="server">
    <table id="tblSystems" cellspacing="3" cellpadding="3" style="width: 95%" style="text-align: center">
        <tr>
            <td>
                <h4>
                    <label>Device</label>
                </h4>
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td align="left" valign="top" style="width: 60%">
                            <h6>
                                Shapes in the <b>Device</b> level contain other <b>Devices</b> and <b>IPs</b>, host
                                <b>Objects</b>, have <b>Attributes</b> and </b>Artifacts</b>, and relate to other
                                <b>Devices</b>.</h6>
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td align="right" style="width: 35%">
                            <h6>
                                <a href="../Smarts3Admin/default.aspx">SMARTS3 Administration Home</a><br />
                                <a href="default.aspx">SMARTS3 Browser Home</a><br />
                                <a href="../Smarts3Admin/device.aspx?id=<%=Request.QueryString["id"]%>&type=<%=Request.QueryString["type"]%>">
                                    Edit This Device</a><br />
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
                    HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="center"
                    ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center"
                    runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundColumn HeaderText="Name" HeaderStyle-Width="75%" ItemStyle-Width="75%"
                            DataField="Shape_Name"></asp:BoundColumn>
                        <asp:BoundColumn HeaderText="ShapeType" HeaderStyle-Width="25%" ItemStyle-Width="25%"
                            DataField="ShapeType_Name"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
                <asp:DataGrid ID="grdDescription" BorderWidth="1px" Style="width: 100%" HeaderStyle-Font-Size="10pt"
                    HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
                    HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center" runat="server"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundColumn HeaderText="Description" DataField="Shape_Desc"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
                <asp:DataGrid ID="grdLifecycle" BorderWidth="1px" Style="width: 100%" HeaderStyle-Font-Size="10pt"
                    HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
                    HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center" runat="server"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundColumn HeaderText="LifeCycle" DataField="Lifecycle_Name"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid><br />
                <h5>
                    <label>
                        ATTRIBUTES</label></h5>
                <asp:DataGrid ID="grdAttribute" BorderWidth="1px" Style="width: 100%" HeaderStyle-Font-Size="10pt"
                    HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
                    HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center" runat="server"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundColumn HeaderText="Attribute" DataField="Attribute_Name"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderStyle-Font-Size="10pt" HeaderStyle-Width="43%" HeaderStyle-BackColor="#000099"
                            HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
                            HeaderStyle-HorizontalAlign="center" HeaderText="Value">
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
                    HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
                    HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center" runat="server"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateColumn ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%" HeaderStyle-Width="20%">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" Target="_blank" ID="urlArtifact_Location" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Related_Desc") %>'>
											View
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Artifact" ItemStyle-Width="65%" HeaderStyle-Width="65%"
                            FooterStyle-Width="65%">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" NavigateUrl='<%# "artifact.aspx?id=" 
                                            + Request.QueryString["id"] 
                                            + "&type=" 
                                            + Request.QueryString["type"] 
                                            + "&artifact=" 
                                            + DataBinder.Eval(Container.DataItem, "Related_ID")%>' ID="urlArtifact">
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid><br />--%>
                <h5>
                    <label>
                        CONTAINED BY Devices</label></h5>
                <asp:DataGrid ID="grdContainedByDevice" runat="server" Style="width: 100%" ItemStyle-HorizontalAlign="Left"
                    ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="center" HeaderStyle-Font-Bold="True"
                    HeaderStyle-Font-Size="10pt" AutoGenerateColumns="False" HeaderStyle-ForeColor="#ffffff"
                    HeaderStyle-BackColor="#000099">
                    <Columns>
                        <asp:BoundColumn HeaderText="Type" DataField="Related_TypeName"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="Device" ItemStyle-Width="65%" HeaderStyle-Width="65%">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlContainedByDevice" runat="server" NavigateUrl='<%# "device.aspx?id=" 
                                                + DataBinder.Eval(Container.DataItem, "Related_ID") 
                                                + "&type=" 
                                                + DataBinder.Eval(Container.DataItem, "Related_TypeID")%>'>
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid><br />
                <h5>
                    <label>
                        CONTAINS Devices</label></h5>
                <asp:DataGrid ID="grdContainDevice" runat="server" Style="width: 100%" ItemStyle-HorizontalAlign="Left"
                    ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="center" HeaderStyle-Font-Bold="True"
                    HeaderStyle-Font-Size="10pt" AutoGenerateColumns="False" HeaderStyle-ForeColor="#ffffff"
                    HeaderStyle-BackColor="#000099">
                    <Columns>
                        <asp:BoundColumn HeaderText="Type" DataField="Related_TypeName"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="Device" ItemStyle-Width="65%" HeaderStyle-Width="65%">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlContainDevice" runat="server" NavigateUrl='<%# "device.aspx?id=" 
                                                + DataBinder.Eval(Container.DataItem, "Related_ID") 
                                                + "&type=" 
                                                + DataBinder.Eval(Container.DataItem, "Related_TypeID")%>'>
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid><br />
                <asp:DataGrid ID="grdAddress" runat="server" Style="width: 100%" ItemStyle-HorizontalAlign="Left"
                    ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="center" HeaderStyle-Font-Bold="True"
                    HeaderStyle-Font-Size="10pt" AutoGenerateColumns="False" HeaderStyle-ForeColor="#ffffff"
                    HeaderStyle-BackColor="#000099" ItemStyle-Width="15%">
                    <Columns>
                        <asp:BoundColumn HeaderText="IP Address" DataField="Related_Name"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid><br />
                <h5>
                    <label>
                        HOSTS Objects of Systems</label></h5>
                <asp:DataGrid ID="grdDeviceObject" Style="width: 100%" runat="server" BorderWidth="1px"
                    ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="center"
                    HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt" AutoGenerateColumns="False"
                    HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
                    <Columns>
                        <asp:TemplateColumn HeaderText="System" ItemStyle-Width="29%" HeaderStyle-Width="29%">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlDeviceObjectSystem" runat="server" NavigateUrl='<%# "sys.aspx?id=" 
                                                + DataBinder.Eval(Container.DataItem, "RelatedContainer_ID")%>'>
											<%# DataBinder.Eval(Container.DataItem, "RelatedContainer_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn HeaderText="Type" DataField="Related_TypeName"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="Object" ItemStyle-Width="35%" HeaderStyle-Width="35%">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlDeviceObjectObject" runat="server" NavigateUrl='<%# "object.aspx?id=" 
                                                + DataBinder.Eval(Container.DataItem, "Related_ID") 
                                                + "&type=" 
                                                + DataBinder.Eval(Container.DataItem, "Related_TypeID")%>'>
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid><br />
                <h5>
                    <label>
                        RELATIONS with Devices</label></h5>
                <asp:DataGrid ID="grdRelations" Style="width: 100%" runat="server" BorderWidth="1"
                    ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt"
                    HeaderStyle-HorizontalAlign="center" HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt"
                    AutoGenerateColumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
                    <Columns>
                        <asp:BoundColumn HeaderText="Direction" DataField="Assoc_Direction"></asp:BoundColumn>
                        <asp:BoundColumn HeaderText="Type" DataField="Related_TypeName"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="Device" ItemStyle-Width="30%" HeaderStyle-Width="30%">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlRelationDeviceName" runat="server" NavigateUrl='<%# "Device.aspx?id=" 
                                                + DataBinder.Eval(Container.DataItem, "Related_ID") 
                                                + "&type=" 
                                                +  DataBinder.Eval(Container.DataItem, "Related_TypeID")%>'>
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Relation" ItemStyle-Wrap="True" ItemStyle-Width="25%"
                            HeaderStyle-Width="25%">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" NavigateUrl='<%# "Relation.aspx?id=" 
                                                + DataBinder.Eval(Container.DataItem, "Principal_ID") 
                                                + "&type=" 
                                                + DataBinder.Eval(Container.DataItem, "Principal_TypeID") 
                                                + "&relation=" 
                                                +  DataBinder.Eval(Container.DataItem, "Assoc_ID")%>' ID="urlRelationName">
											<%# Dummylink(DataBinder.Eval(Container.DataItem, "Assoc_Name").ToString())%>
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
