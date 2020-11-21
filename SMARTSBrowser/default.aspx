<%@ Page Language="vb" AutoEventWireup="false" Codebehind="default.aspx.vb" Inherits="SMARTSBROWSER._default" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SMARTS Browser</title>
		<LINK href="MyStyles.css" type="text/css" rel="stylesheet">
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body ID="theBody" MS_POSITIONING="GridLayout">
		<form id="theForm" method="post" runat="server">
			<table height="97%" width="97%" align="center" border="0">
				<tr>
					<td>
						<table width="100%">
							<tr>
								<td colSpan="3">
									<h4>SMARTS Browser</h4>
									<hr>
								</td>
							</tr>
							<tr>
								<td align="right" colSpan="3">
									<h6><A href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</A></h6>
								</td>
							</tr>
							<tr>
								<td colSpan="3">
									<h6><b>BROWSE</b> To view information about a shape, first select the level and 
										type of shape to view, then select the specific object from the list. To view 
										further details about this shape(e.g. Visio diagrams, website links), click 
										"View Details".
									</h6>
								</td>
							</tr>
							<tr>
								<TD vAlign="top" width="25%">
									<H5>1. Select Level:</H5>
									<asp:dropdownlist id="ddlLevelList" runat="server" AutoPostBack="True" Visible="true" Width="100%"></asp:dropdownlist></TD>
								<TD vAlign="top" width="25%">
									<H5>2. Select Type:</H5>
									<asp:dropdownlist id="ddlTypeList" AutoPostBack="True" width="100%" DataTextField="ShapeType_Name"
										DataValueField="ShapeType_ID" Runat="server"></asp:dropdownlist></TD>
								<td vAlign="top" width="50%">
									<h5>3. Select Item:</h5>
									<asp:dropdownlist id="ddlList" AutoPostBack="True" Width="100%" DataTextField="Display_Name" DataValueField="Item_ID"
										Runat="server"></asp:dropdownlist></td>
							</tr>
							<tr>
								<td align="center" colSpan="3"><asp:label id="lblMessage" Visible="False" Runat="server" Font-Bold="True" ForeColor="#ff3366"></asp:label><br>
									<asp:datagrid id="grdDescription" Width="100%" Runat="server" BorderWidth="1" ItemStyle-HorizontalAlign="Left"
										ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True"
										HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
										<Columns>
											<asp:BoundColumn ItemStyle-Width="100%" HeaderStyle-Width="100%" HeaderText="Description" HeaderStyle-HorizontalAlign="Center"
												ItemStyle-HorizontalAlign="Left" DataField="Shape_Desc"></asp:BoundColumn>
										</Columns>
									</asp:datagrid><br>
									<asp:button id="ViewDetails" runat="server" Text="View Details"></asp:button></td>
							</tr>
							<!--
							<tr>
								<td colSpan="3">
									<hr>
								</td>
							</tr>
							<tr>
								<td colSpan="3">
									<h6><b>REPORT</b> To view reports, first select the level and type of shape to 
										view, then select the report you wish to generate
									</h6>
								</td>
							</tr>
							<tr>
								<TD vAlign="top" width="25%">
									<H5>1. Select Level:</H5>
									<asp:dropdownlist id="ddlReportLevel" runat="server" AutoPostBack="True" Visible="true" Width="100%"></asp:dropdownlist></TD>
								<TD vAlign="top" width="25%">
									<H5>2. Select Type:</H5>
									<asp:dropdownlist id="ddlReportShapeType" AutoPostBack="True" width="100%" DataTextField="ShapeType_Name"
										DataValueField="ShapeType_ID" Runat="server"></asp:dropdownlist></TD>
								<td vAlign="top" width="50%">
									<h5>3. Select Item:</h5>
									<asp:dropdownlist id="ddlReportName" AutoPostBack="True" Width="100%" Runat="server"></asp:dropdownlist></td>
							</tr>
							<tr>
								<td align="center" colSpan="3"><asp:button id="btnViewReport" runat="server" Text="View Report"></asp:button></td>
							</tr>
							-->
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%">
							<tr>
								<td colSpan="3">
									<hr>
								</td>
							</tr>
							<TR>
								<td colSpan="3">
									<h5>OR, SEARCH by Field<br>
									</h5>
									<h6>for <b>Value</b> (leave blank to retrieve all values)<br>
										<asp:textbox id="boxSearchValue" runat="server" Width="100%"></asp:textbox></h6>
								</td>
							</TR>
							<tr>
								<td width="33%">
									<h6>in <b>Field</b><br>
										<asp:dropdownlist id="ddlSearchField" runat="server" AutoPostBack="True" Width="100%" DataTextField="Attribute_Name"
											DataValueField="Attribute_ID"></asp:dropdownlist></h6>
								</td>
								<td width="33%">
									<h6>in <b>Level</b><br>
										<asp:dropdownlist id="ddlSearchLevel" runat="server" AutoPostBack="True" Width="100%"></asp:dropdownlist></h6>
								</td>
								<td width="34%">
									<h6>and <b>Type</b><br>
										<asp:dropdownlist id="ddlSearchType" runat="server" AutoPostBack="True" Width="100%" DataTextField="ShapeType_Name"
											DataValueField="ShapeType_ID"></asp:dropdownlist></h6>
								</td>
							</tr>
							<TR>
								<td vAlign="middle" align="center" colSpan="3"><asp:button id="btnSearchValue" runat="server" Text="Search for Value"></asp:button></td>
							</TR>
						</table>
					</td>
				</tr>
			</table>
			<input id="PageX" type="hidden" value="0" name="PageX" runat="server"> <input id="PageY" type="hidden" value="0" name="PageY" runat="server">
		</form>
	</body>
</HTML>
