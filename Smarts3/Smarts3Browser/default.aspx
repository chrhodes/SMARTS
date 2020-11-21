<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="default.aspx.cs" Inherits="Smarts3Browser.default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SMARTS3 Browser</title>
    <link href="Styles/Site.css" type="text/css" rel="stylesheet" />
</head>
<body id="theBody">
    <form id="theForm" method="post" runat="server">
    <table style="width: 97%; text-align: left" border="0">
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td colspan="3">
                            <h4>
                                SMARTS3 Browser</h4>
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="3">
                            <h6>
                                <a href="../Smarts3Admin/default.aspx">SMARTS3 Administration Home</a></h6>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <h6>
                                <b>BROWSE</b> To view information about a shape, first select the level and type
                                of shape to view, then select the specific object from the list. To view further
                                details about this shape(e.g. Visio diagrams, website links), click "View Details".
                            </h6>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="width: 25%">
                            <h5>
                                1. Select Level:</h5>
                            <asp:DropDownList ID="ddlLevelList" runat="server" AutoPostBack="True" Visible="true"
                                Style="width: 100%" OnSelectedIndexChanged="ddlLevelList_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td valign="top" style="width: 25%">
                            <h5>
                                2. Select Type:</h5>
                            <asp:DropDownList ID="ddlTypeList" AutoPostBack="True" Style="width: 100%" DataTextField="ShapeType_Name"
                                DataValueField="ShapeType_ID" runat="server" OnSelectedIndexChanged="ddlTypeList_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td valign="top" style="width: 50%">
                            <h5>
                                3. Select Item:</h5>
                            <asp:DropDownList ID="ddlList" AutoPostBack="True" Style="width: 100%" DataTextField="Display_Name"
                                DataValueField="Item_ID" runat="server" OnSelectedIndexChanged="ddlList_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center" colspan="3">
                            <asp:Label ID="lblMessage" Visible="False" runat="server" Font-Bold="True" ForeColor="#ff3366"></asp:Label><br />
                            <asp:DataGrid ID="grdDescription" Style="width: 100%; text-align: left;" runat="server"
                                BorderWidth="1" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="center"
                                HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt" AutoGenerateColumns="False"
                                HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
                                <Columns>
                                    <asp:BoundColumn ItemStyle-Width="100%" HeaderStyle-Width="100%" HeaderText="Description"
                                        HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Left" DataField="Shape_Desc">
                                    </asp:BoundColumn>
                                </Columns>
                            </asp:DataGrid><br />
                            <asp:Button ID="btnViewDetails" runat="server" Text="View Details" OnClick="ViewDetails_Click"
                                OnLoad="Page_Load"></asp:Button>
                        </td>
                    </tr>
                    <!--
							<tr>
								<td colspan="3">
									<hr/>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<h6><b>REPORT</b> To view reports, first select the level and type of shape to 
										view, then select the report you wish to generate
									</h6>
								</td>
							</tr>
							<tr>
								<td valign="top" style="width:25%">
									<h5>1. Select Level:</h5>
									<asp:dropdownlist id="ddlReportLevel" runat="server" AutoPostBack="True" Visible="true" style="width:100%"></asp:dropdownlist></td>
								<td valign="top" style="width:25%">
									<h5>2. Select Type:</h5>
									<asp:dropdownlist id="ddlReportShapeType" AutoPostBack="True" style="width:100%" DataTextField="ShapeType_Name"
										DataValueField="ShapeType_ID" Runat="server"></asp:dropdownlist></td>
								<td valign="top" style="width:50%">
									<h5>3. Select Item:</h5>
									<asp:dropdownlist id="ddlReportName" AutoPostBack="True" style="width:100%" Runat="server"></asp:dropdownlist></td>
							</tr>
							<tr>
								<td style="text-align:center" colspan="3"><asp:button id="btnViewReport" runat="server" Text="View Report"></asp:button></td>
							</tr>
							-->
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td colspan="3">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <h5>
                                OR, SEARCH by Field<br />
                            </h5>
                            <h6>
                                for <b>Value</b> (leave blank to retrieve all values)<br />
                                <asp:TextBox ID="boxSearchValue" runat="server" Style="width: 100%"></asp:TextBox></h6>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 33%">
                            <h6>
                                in <b>Field</b><br />
                                <asp:DropDownList ID="ddlSearchField" runat="server" AutoPostBack="True" Style="width: 100%"
                                    DataTextField="Attribute_Name" DataValueField="Attribute_ID">
                                </asp:DropDownList>
                            </h6>
                        </td>
                        <td style="width: 33%">
                            <h6>
                                in <b>Level</b><br />
                                <asp:DropDownList ID="ddlSearchLevel" runat="server" AutoPostBack="True" Style="width: 100%"
                                    OnSelectedIndexChanged="ddlSearchLevel_SelectedIndexChanged">
                                </asp:DropDownList>
                            </h6>
                        </td>
                        <td style="width: 34%">
                            <h6>
                                and <b>Type</b><br />
                                <asp:DropDownList ID="ddlSearchType" runat="server" AutoPostBack="True" Style="width: 100%"
                                    DataTextField="ShapeType_Name" DataValueField="ShapeType_ID">
                                </asp:DropDownList>
                            </h6>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" style="text-align: center" colspan="3">
                            <asp:Button ID="btnSearchValue" runat="server" Text="Search for Value" OnClick="btnSearchValue_Click">
                            </asp:Button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <input id="PageX" type="hidden" value="0" name="PageX" runat="server" />
    <input id="PageY" type="hidden" value="0" name="PageY" runat="server" />
    </form>
</body>
</html>
