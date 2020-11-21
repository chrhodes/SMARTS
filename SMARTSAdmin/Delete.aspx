<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Delete.aspx.vb" Inherits="SMARTSAdmin.Delete" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SMARTS Administration</title>
		<LINK href="MyStyles.css" type="text/css" rel="stylesheet">
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body id="theBody" MS_POSITIONING="GridLayout">
		<form id="theForm" method="post" runat="server">
			<table height="97%" width="97%" align="center" border="0">
				<tr>
					<td colSpan="3">
						<h4>SMARTS Administration</h4>
						<hr>
					</td>
				</tr>
				<tr>
					<td align="right" colSpan="3">
						<h6><A href="default.aspx">SMARTS Administration Home</A></h6>
					</td>
				</tr>
				<tr>
					<td colSpan="3">
						<h5>DELETE</h5>
						<h6>To delete a shape, first select the level and type of shape, then select the 
							specific object from the list. If the shape still has dependent shapes and/or 
							relations, it will not appear in the list as its dependents need to be deleted 
							first before the shape itself can be deleted.
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
					<td align="center" colSpan="3"><asp:datagrid id="grdDescription" Width="100%" Runat="server" BorderWidth="1" ItemStyle-HorizontalAlign="Left"
							ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt"
							autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
							<Columns>
								<asp:BoundColumn ItemStyle-Width="100%" HeaderStyle-Width="100%" HeaderText="Description" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Shape_Desc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br>
					</td>
				</tr>
				<tr>
					<td colSpan="3"><asp:Label ID="lblMessage" Font-Bold="True" Visible="False" Runat="server" ForeColor="red"></asp:Label></td>
				</tr>
				<tr>
					<td colSpan="3">
						<asp:Label ID="lblLog" Runat="server" Visible="True" Font-Name="arial" Font-Size="10pt" Font-Bold="True">Comment:</asp:Label>
						<asp:TextBox ID="txtLog" Runat="server" Width="100%" visible="True" TextMode="MultiLine" Font-Name="arial"
							Font-Size="10pt"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="center" colSpan="3">
						<asp:button id="btnDelete" runat="server" Text="Delete"></asp:button></td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
