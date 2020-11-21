<%@ Page Language="vb" AutoEventWireup="false" Codebehind="EnterpriseReport.aspx.vb" Inherits="SMARTSBROWSER.EnterpriseReport"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Enterprise Reports</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<LINK href="MyStyles.css" type="text/css" rel="stylesheet">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<BODY ID="theBody">
		<form id="theForm" method="post" runat="server">
			<table id="tblSystems" cellSpacing="3" cellPadding="3" width="95%" align="center">
				<tr>
					<td>
						<h4><label>Enterprise Reports</label></h4>
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
										<A href="enterprise.aspx">Select Attributes</A><br>
										<br>
										<asp:Button ID="btnShow" Text="Show All" Runat="server"></asp:Button>
										<asp:Button ID="btnPage" Text="Show Page" Runat="server"></asp:Button>
									</h6>
								</td>
								<td vAlign="top" align="left" width="60%"></td>
								<td width="5%"></td>
							</tr>
							<tr>
								<td>
									<asp:datagrid id="grdEnterprise" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="True"
										FooterStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#ffffff"
										HeaderStyle-BackColor="#000099" HeaderStyle-Font-Size="10pt" ItemStyle-Font-Size="10pt" Font-Name="Arial"
										OnPageIndexChanged="grdEnterprise_Paged" AutoGenerateColumns="True" BorderWidth="1" Width="100%"
										Runat="server">
										<PagerStyle Font-Name="Arial" Font-Size="10pt" Mode="NextPrev" PrevPageText="Prev" NextPageText="Next"
											Position="Top"></PagerStyle>
									</asp:datagrid>
									<br>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</BODY>
</HTML>
