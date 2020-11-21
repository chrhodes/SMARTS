<%@ Page Language="vb" AutoEventWireup="false" Inherits="SmartsBrowser.LevelReports" Codebehind="LevelReports.aspx.vb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD Xhtml 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
		<title>SMARTS Browser</title>
		<link href="MyStyles.css" type="text/css" rel="stylesheet"/>
</head>
	<body id="thebody">
		<form id="theForm" method="post" runat="server">
			<table id="tblSystems" cellspacing="3" cellpadding="3" style="width:95%" style="text-align:center">
				<tr>
					<td>
						<h4><label>Level Relations Reports</label></h4>
						<hr/>
					</td>
				</tr>
				<tr>
					<td>
						<table style="width:100%">
							<tr>
								<td align="left" style="width:35%">
									<h6><a href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</a><br/>
										<a href="default.aspx">SMARTS Browser Home</a>
										<br/>
										<asp:button id="btnShow" Runat="server" Text="Show All"></asp:button><asp:button id="btnPage" Runat="server" Text="Show Page"></asp:button></h6>
								</td>
								<td valign="top" align="left" style="width:60%"></td>
								<td style="width:5%"></td>
							</tr>
							<tr>
								<td><asp:datagrid id="grdLevel" Runat="server" style="width:100%" BorderWidth="1" AutoGenerateColumns="True"
										OnPageIndexChanged="grdLevel_Paged" Font-Names="Arial" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Size="10pt"
										HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Left"
										FooterStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Left">
										<PagerStyle Font-Names="Arial" Font-Size="10pt" Mode="NextPrev" PrevPageText="Prev" NextPageText="Next"
											Position="Top"></PagerStyle>
									</asp:datagrid><br/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
