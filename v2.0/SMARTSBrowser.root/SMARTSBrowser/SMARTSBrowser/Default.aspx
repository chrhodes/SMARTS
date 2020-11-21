<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD Xhtml 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
		<title>SMARTS Browser</title>
		<link href="MyStyles.css" type="text/css" rel="stylesheet"/>
</head>
<body>
		<form id="theForm" method="post" runat="server">
		<table style="width:97%; text-align:left" border="0">
				<tr>
					<td>
						<table style="width:100%">
							<tr>
								<td colspan="3">
									<h4>SMARTS Browser</h4>
									<hr/>
								</td>
							</tr>
							<tr>
								<td align="right" colspan="3">
									<h6><a href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</a></h6>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<h6><b>BROWSE</b> To view information about a shape, first select the level and 
										type of shape to view, then select the specific object from the list. To view 
										further details about this shape(e.g. Visio diagrams, website links), click 
										"View Details".
									</h6>
								</td>
							</tr>
							<tr>
								<td valign="top" style="width:25%">
									<h5>1. Select Level:</h5>
									<asp:dropdownlist id="ddlLevelList" runat="server" AutoPostBack="True" Visible="true" style="width:100%"></asp:dropdownlist></td>
								<td valign="top" style="width:25%">
									<h5>2. Select Type:</h5>
									<asp:dropdownlist id="ddlTypeList" AutoPostBack="True" style="width:100%" DataTextField="ShapeType_Name"
										DataValueField="ShapeType_ID" Runat="server"></asp:dropdownlist></td>
								<td valign="top" style="width:50%">
									<h5>3. Select Item:</h5>
									<asp:dropdownlist id="ddlList" AutoPostBack="True" style="width:100%" DataTextField="Display_Name" DataValueField="Item_ID"
										Runat="server"></asp:dropdownlist></td>
							</tr>
							<tr>
								<td style="text-align:center" colspan="3"><asp:label id="lblMessage" Visible="False" Runat="server" Font-Bold="True" ForeColor="#ff3366"></asp:label><br/>
									<asp:datagrid id="grdDescription" style="width:100%; text-align: left;" Runat="server" BorderWidth="1" ItemStyle-HorizontalAlign="Left"
										ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="center"  HeaderStyle-Font-Bold="True"
										HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
										<Columns>
											<asp:BoundColumn ItemStyle-Width="100%" HeaderStyle-Width="100%" HeaderText="Description" HeaderStyle-HorizontalAlign="center" 
												ItemStyle-HorizontalAlign="Left" DataField="Shape_Desc"></asp:BoundColumn>
										</Columns>
									</asp:datagrid><br/>
									<asp:button id="ViewDetails" runat="server" Text="View Details"></asp:button></td>
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
						<table style="width:100%">
							<tr>
								<td colspan="3">
									<hr/>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<h5>OR, SEARCH by Field<br/>
									</h5>
									<h6>for <b>Value</b> (leave blank to retrieve all values)<br/>
										<asp:textbox id="boxSearchValue" runat="server" style="width:100%"></asp:textbox></h6>
								</td>
							</tr>
							<tr>
								<td style="width:33%">
									<h6>in <b>Field</b><br/>
										<asp:dropdownlist id="ddlSearchField" runat="server" AutoPostBack="True" style="width:100%" DataTextField="Attribute_Name"
											DataValueField="Attribute_ID"></asp:dropdownlist></h6>
								</td>
								<td style="width:33%">
									<h6>in <b>Level</b><br/>
										<asp:dropdownlist id="ddlSearchLevel" runat="server" AutoPostBack="True" style="width:100%"></asp:dropdownlist></h6>
								</td>
								<td style="width:34%">
									<h6>and <b>Type</b><br/>
										<asp:dropdownlist id="ddlSearchType" runat="server" AutoPostBack="True" style="width:100%" DataTextField="ShapeType_Name"
											DataValueField="ShapeType_ID"></asp:dropdownlist></h6>
								</td>
							</tr>
							<tr>
								<td valign="middle" style="text-align:center" colspan="3"><asp:button id="btnSearchValue" runat="server" Text="Search for Value"></asp:button></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<input id="PageX" type="hidden" value="0" name="PageX" runat="server"/> <input id="PageY" type="hidden" value="0" name="PageY" runat="server"/>
		</form>
</body>
</html>
