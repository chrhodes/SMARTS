<%@ Page Language="vb" AutoEventWireup="false" Codebehind="enterprise.aspx.vb" Inherits="SMARTSBROWSER.enterprise" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Enterprise Attributes</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<LINK href="MyStyles.css" type="text/css" rel="stylesheet">
		<LINK href="datagrid.css" type="text/css" rel="stylesheet">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body ID="theBody" MS_POSITIONING="GridLayout">
		<form id="theForm" method="post" runat="server">
			<table id="tblSystems" cellSpacing="3" cellPadding="3" width="95%" align="center">
				<tr>
					<td>
						<h4><label>Enterprise Report</label></h4>
						<hr>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%">
							<tr>
								<td align="left" width="35%">
									<h6><A href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</A><br>
										<A href="default.aspx">SMARTS Browser Home</A><br>
									</h6>
								</td>
								<td vAlign="top" align="left" width="60%"></td>
								<td width="5%"></td>
							</tr>
							<tr>
								<td align="center" colSpan="3">
									<h4>Select up to 6 attributes to display</h4>
								</td>
							</tr>
							<tr>
								<td colSpan="3">
									<asp:CheckBoxList id="cblAttributes" runat="server" RepeatColumns="3" Width="100%" BorderWidth="1"
										Font-Name="Arial" Font-Size="9pt" DataValueField="sta_id" DataTextField="sta_name"></asp:CheckBoxList>
								</td>
							</tr>
							<tr>
								<td align="center" colSpan="3"><asp:button id="btnViewReport" runat="server" Text="View Report"></asp:button></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
