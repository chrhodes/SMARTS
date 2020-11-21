<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Relation.aspx.cs" Inherits="Smarts3Browser.Relation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMARTS3 Browser</title>
    <link href="Styles/Site.css" type="text/css" rel="stylesheet" />
</head>
<body id="thebody">
    <form id="theForm" method="post" runat="server">
    <table id="tblPage" cellspacing="3" cellpadding="3" style="width: 95%; text-align: center">
        <tr>
            <td>
                <h4>
                    <label>
                        Relation</label></h4>
                <hr />
                <asp:Label ID="lblRelationID" Text='<%# Request.QueryString["relation"] %>' Visible="False"
                    runat="server">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                <h6>
                    <a href="../Smarts3Admin/default.aspx">SMARTS3 Administration Home</a><br />
                    <a href="default.aspx">SMARTS3 Browser Home</a><br />
                    <a href="../Smarts3Admin/relation.aspx?id=<%=Request.QueryString["id"]%>&type=<%=Request.QueryString["type"]%>&relation=<%=Request.QueryString["relation"]%>">
                        Edit This Relation</a><br />
                    <br />
                </h6>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataGrid ID="grdName" BorderWidth="1px" Style="width: 100%" HeaderStyle-Font-Size="10pt"
                    HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
                    HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center" runat="server"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundColumn HeaderText="Name" DataField="Assoc_Name"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
                <asp:DataGrid ID="grdDescription" BorderWidth="1px" Style="width: 100%" HeaderStyle-Font-Size="10pt"
                    HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
                    HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center" runat="server"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundColumn HeaderText="Description" DataField="Assoc_Desc"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid><br />
                <h5>
                    <label>
                        DIRECTION</label></h5>
                <asp:DataGrid ID="grdRelations" runat="server" Style="width: 100%" BorderWidth="1"
                    HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" AutoGenerateColumns="False"
                    HeaderStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center"
                    ItemStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left">
                    <Columns>
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <asp:Label ID="lblRelationPrincipalID" runat="server" Visible="False" Text='<%# DataBinder.Eval(Container.DataItem, "Principal_ID")%>'></asp:Label>
                                <asp:HyperLink runat="server" ID="urlRelationPrincipal">
											<%# DataBinder.Eval(Container.DataItem, "Principal_Name")%> 								
                                </asp:HyperLink>
                                (<%# DataBinder.Eval(Container.DataItem, "Principal_TypeName")%>)
                                <asp:HyperLink runat="server" ID="urlRelationPrincipalContainer">
										<%# DataBinder.Eval(Container.DataItem, "PrincipalContainer_Name")%>
                                </asp:HyperLink>
                                <b>
                                    <%# DataBinder.Eval(Container.DataItem, "Assoc_Direction")%>
                                </b>
                                <asp:HyperLink runat="server" ID="urlRelationRelated">
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%> 								
                                </asp:HyperLink>
                                (<%# DataBinder.Eval(Container.DataItem, "Related_TypeName")%>)
                                <asp:HyperLink runat="server" ID="urlRelationRelatedContainer">
										<%# DataBinder.Eval(Container.DataItem, "RelatedContainer_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
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
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
