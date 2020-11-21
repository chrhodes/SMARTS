<%@ Page Language="vb" AutoEventWireup="false" Inherits="SmartsBrowser.EnterpriseReport" Codebehind="EnterpriseReport.aspx.vb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD Xhtml 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
		<title>SMARTS Browser</title>
		<link href="MyStyles.css" type="text/css" rel="stylesheet"/>
</head>
	<body id="thebody">
		<form id="theForm" method="post" runat="server">
			<table id="tblSystems" cellspacing="3" cellpadding="3" style="width:95%; text-align:center">
				<tr>
					<td>
						<h4><label>Enterprise Reports</label></h4>
						<hr/>
					</td>
				</tr>
				<tr>
					<td>
						<table style="width:100%">
							<tr>
								<td align="left" style="width:35%">
									<h6><a href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</a><br/>
										<a href="default.aspx">SMARTS Browser Home</a><br/>
										<a href="enterprise.aspx">Select Attributes</a><br/>
										<br/>
										<asp:Button id="btnShow" Text="Show All" Runat="server"></asp:Button>
										<asp:Button id="btnPage" Text="Show Page" Runat="server"></asp:Button>
									</h6>
								</td>
								<td valign="top" align="left" style="width:60%"></td>
								<td style="width:5%"></td>
							</tr>
							<tr>
								<td>
									<asp:datagrid id="grdEnterprise" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="True"
										FooterStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#ffffff"
										HeaderStyle-BackColor="#000099" HeaderStyle-Font-Size="10pt" ItemStyle-Font-Size="10pt" Font-Names="Arial"
										OnPageIndexChanged="grdEnterprise_Paged" AutoGenerateColumns="True" BorderWidth="1" style="width:100%"
										Runat="server">
										<PagerStyle  Font-Names="Arial" Font-Size="10pt" Mode="NextPrev" PrevPageText="Prev" NextPageText="Next"
											Position="Top"></PagerStyle>
									</asp:datagrid>
									<br/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
