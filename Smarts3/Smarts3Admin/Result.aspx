<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="Smarts3Admin.Result" %>
<%@ Import Namespace="Smarts3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Smarts3 Browser</title>
    <link href="Styles/Site.css" type="text/css" rel="stylesheet" />
</head>
<body id="thebody">
    <form id="theForm" method="post" runat="server">
    <table style="width: 95%; text-align: center">
        <tr>
            <td>
                <table id="tblSystem" cellspacing="3" cellpadding="3" style="width: 100%; text-align: center">
                    <tbody>
                        <tr>
                            <td>
                                <h4>
                                    <label>Search Results</label>
                                </h4>
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <h6>
                                    <a href="../Smarts3Admin/default.aspx">SMARTS3 Administration Home</a><br />
                                    <a href="default.aspx">SMARTS3 Browser Home</a><br />
                                </h6>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DataGrid ID="grdItem" runat="server" 
                                    AutoGenerateColumns="False" ItemStyle-Font-Size="10pt"
                                    ItemStyle-HorizontalAlign="Left" BorderWidth="1" Style="width: 100%" HeaderStyle-Font-Size="10pt"
                                    HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center" HeaderStyle-ForeColor="#ffffff"
                                    HeaderStyle-BackColor="#000099">
                                    <ItemStyle Font-Size="10pt" HorizontalAlign="Left"></ItemStyle>
                                    <HeaderStyle Font-Size="10pt" Font-Bold="True" HorizontalAlign="center" ForeColor="White" BackColor="#000099"></HeaderStyle>
                                    <Columns>
                                        <asp:BoundColumn Visible="False" DataField="Item_ID"></asp:BoundColumn>
                                        <asp:BoundColumn Visible="False" DataField="Item_Abstraction"></asp:BoundColumn>
                                        <asp:BoundColumn Visible="False" DataField="Item_TypeID"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="Item_Type" HeaderText="Type" SortExpression="Item_Type">
                                            <HeaderStyle Width="15%"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="Name">
                                            <HeaderStyle Width="30%"></HeaderStyle>
                                            <ItemStyle Width="30%"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="urlItem" runat="server">
														<%# DataBinder.Eval(Container.DataItem, "Item_Name")%>
                                                </asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="Item_Field" HeaderText="Field" SortExpression="Item_Field">
                                            <HeaderStyle Width="25%"></HeaderStyle>
                                        </asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="Value">
                                            <HeaderStyle Font-Size="10pt" Font-Bold="True" HorizontalAlign="center" ForeColor="White"
                                                Width="25%" BackColor="#000099"></HeaderStyle>
                                            <ItemStyle Font-Size="10pt"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="urlAttributeValue" runat="server" 
                                                        Target="_blank" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Item_Value") %>'>
														<%# DataBinder.Eval(Container.DataItem, "Item_Value")%>
                                                </asp:HyperLink>
                                                <asp:Label ID="lblAttributeValue" runat="server" 
                                                        Text='<%# DataBinder.Eval(Container.DataItem, "Item_Value") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                </asp:DataGrid>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
