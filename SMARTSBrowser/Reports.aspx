<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Reports.aspx.vb" Inherits="SMARTSBROWSER.Reports" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Reports</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<LINK href="MyStyles.css" type="text/css" rel="stylesheet">
		<LINK href="datagrid.css" type="text/css" rel="stylesheet">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body id="theBody" MS_POSITIONING="GridLayout">
		<form id="theForm" method="post" runat="server">
			<table id="tblSystems" cellSpacing="3" cellPadding="3" width="95%" align="center">
				<tr>
					<td>
						<h5><label><%=Request.QueryString("shapetypename")%>
								Reports</label></h5>
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
										<br>
										<asp:button id="btnShow" Runat="server" Text="Show All"></asp:button><asp:button id="btnPage" Runat="server" Text="Show Page"></asp:button></h6>
								</td>
								<td vAlign="top" align="left" width="60%"></td>
								<td width="5%"></td>
							</tr>
							<tr>
								<td><asp:datagrid id="grdAttributeValues" Runat="server" Width="100%" BorderWidth="1" AutoGenerateColumns="True"
										OnPageIndexChanged="grdAttributeValues_Paged" Font-Name="Arial" ItemStyle-Font-Size="10pt"
										HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
										ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="True"
										HeaderStyle-HorizontalAlign="Left">
										<PagerStyle Font-Name="Arial" Font-Size="10pt" Mode="NextPrev" PrevPageText="Prev" NextPageText="Next"
											Position="Top"></PagerStyle>
									</asp:datagrid><br>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
