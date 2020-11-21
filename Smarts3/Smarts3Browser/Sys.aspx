<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sys.aspx.cs" Inherits="Smarts3Browser.Sys" %>
<%@ Import Namespace="Smarts3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
		<title>SMARTS3 Browser</title>
		<link href="Styles/Site.css" type="text/css" rel="stylesheet"/>
</head>
<body id="theBody">
    <form id="theForm" method="post" runat="server">
        <table id="tblSystems" cellspacing="3" cellpadding="3" style="width: 95%; text-align: center">
            <tr>
                <td>
                    <h4><label>System</label></h4>
                    <hr />
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td align="left" valign="top" style="width: 60%">
                                <h6>
                                    Shapes in the <b>System</b> level contain <b>Objects</b>, have <b>Attributes</b>
                                    and <b>Artifacts</b>, and relate to other <b>Systems</b>.</h6>
                            </td>
                            <td style="width: 5%">
                            </td>
                            <td align="right" style="width: 35%">
                                <h6>
                                    <a href="../Smarts3Admin/default.aspx">SMARTS3 Administration Home</a><br />
                                    <a href="default.aspx">SMARTS3 Browser Home</a><br />
                                    <a href="../Smarts3Admin/sys.aspx?id=<%=Request.QueryString["id"]%>&type=<%=Common.SHAPETYPE_SYSTEM%>">
                                        Edit This System</a><br />
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
                        HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
                        HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="left" runat="server"
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundColumn HeaderText="Name" DataField="Shape_Name"></asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid>
                    <asp:DataGrid ID="grdDescription" BorderWidth="1px" Style="width: 100%" HeaderStyle-Font-Size="10pt"
                        HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
                        HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="left" runat="server"
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundColumn HeaderText="Description" DataField="Shape_Desc"></asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid>
                    <asp:DataGrid ID="grdLifecycle" BorderWidth="1px" Style="width: 100%" HeaderStyle-Font-Size="10pt"
                        HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
                        HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="left" runat="server"
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundColumn HeaderText="LifeCycle" DataField="Lifecycle_Name"></asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid><br />
                    <h5><label>ATTRIBUTES</label></h5>
                    <asp:DataGrid ID="grdAttribute" BorderWidth="1px" Style="width: 100%" HeaderStyle-Font-Size="10pt"
                        HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left"
                        HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="left" runat="server"
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundColumn HeaderText="Attribute" DataField="Attribute_Name"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderStyle-Font-Size="10pt" HeaderStyle-Width="43%" HeaderStyle-BackColor="#000099"
                                HeaderStyle-ForeColor="#ffffff" HeaderStyle-Font-Bold="True"
                                HeaderStyle-HorizontalAlign="left" HeaderText="Value"
                                ItemStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <asp:HyperLink ID="urlAttributeValue" runat="server" Target="_blank" 
                                        NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value") %>'>
											    <%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value")%>
                                    </asp:HyperLink>
                                    <asp:Label ID="lblAttributeValue" runat="server" 
                                        Text='<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid><br />
    <%--                <h5>
                        <label>EXTERNAL INFORMATION Artifacts</label>
                    </h5>
                    <asp:DataGrid ID="grdArtifacts" BorderWidth="1px" Style="width: 100%" HeaderStyle-Font-Size="10pt"
                        HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
                        HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="left" runat="server"
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateColumn ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%" HeaderStyle-Width="20%">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" Target="_blank" ID="urlArtifact_Location" 
                                        NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Related_Desc") %>'>
											    View
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Artifact" ItemStyle-Width="65%" HeaderStyle-Width="65%"
                                FooterStyle-Width="65%">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" 
                                        NavigateUrl='<%# "artifact.aspx?id=" + Request.QueryString["id"] 
                                            + "&type=" + Request.QueryString["type"] 
                                            + "&artifact=" 
                                            +  DataBinder.Eval(Container.DataItem, "Related_ID") %>'
                                        ID="urlArtifact">
											    <%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid><br />--%>
                    <h5><label>CONTAINS Objects of Systems</label></h5>
                    <asp:DataGrid ID="grdObjects" runat="server" BorderWidth="1" Style="width: 100%"
                        HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" AutoGenerateColumns="False"
                        HeaderStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center"
                        ItemStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left">
                        <Columns>
                            <asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Type"
                                DataField="Related_TypeName"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="Object" ItemStyle-Width="35%" HeaderStyle-Width="35%">
                                <ItemTemplate>
                                    <asp:HyperLink ID="urlObject" runat="server" 
                                        NavigateUrl='<%# "object.aspx?id=" 
                                            + DataBinder.Eval(Container.DataItem, "Related_ID") 
                                            + "&type=" 
                                            + DataBinder.Eval(Container.DataItem, "Related_TypeID")%>'>
											    <%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn HeaderText="Description" ItemStyle-Width="50%" HeaderStyle-Width="50%"
                                DataField="Related_Desc"></asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid><br />
                    <h5><label>RELATIONS with Systems</label></h5>
                    <asp:DataGrid ID="grdRelations" runat="server" BorderWidth="1" Style="width: 100%"
                        HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" AutoGenerateColumns="False"
                        HeaderStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center"
                        ItemStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left">
                        <Columns>
                            <asp:TemplateColumn HeaderText="System" ItemStyle-Width="15%" HeaderStyle-Width="15%">
                                <ItemTemplate>
                                    <asp:HyperLink ID="urlRelationPrincipal" runat="server" 
                                        NavigateUrl='<%# "sys.aspx?id=" + DataBinder.Eval(Container.DataItem, "Principal_ID") 
                                            + "&type=" + DataBinder.Eval(Container.DataItem, "Principal_TypeID")%>'>
											    <%# DataBinder.Eval(Container.DataItem, "Principal_Name")%>
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn ItemStyle-Width="35%" HeaderText="Description" DataField="Principal_Desc">
                            </asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="System" ItemStyle-Width="15%" HeaderStyle-Width="15%">
                                <ItemTemplate>
                                    <asp:HyperLink ID="urlRelationRelated" runat="server" 
                                        NavigateUrl='<%# "sys.aspx?id=" 
                                            + DataBinder.Eval(Container.DataItem, "Related_ID") 
                                            + "&type=" 
                                            + DataBinder.Eval(Container.DataItem, "Related_TypeID")%>'>
											    <%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn ItemStyle-Width="35%" HeaderText="Description" DataField="Related_Desc">
                            </asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid><br />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

