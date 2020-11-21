<%@ Page Language="vb" AutoEventWireup="false" Inherits="SmartsBrowser.enterprise" Codebehind="enterprise.aspx.vb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD Xhtml 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
		<title>SMARTS Browser</title>
		<link href="MyStyles.css" type="text/css" rel="stylesheet"/>
</head>
	<body id="thebody" >
		<form id="theForm" method="post" runat="server">
			<table id="tblSystems" cellspacing="3" cellpadding="3" style="width:95%" style="text-align:center">
				<tr>
					<td>
						<h4><label>Enterprise Report</label></h4>
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
									</h6>
								</td>
								<td valign="top" align="left" style="width:60%"></td>
								<td style="width:5%"></td>
							</tr>
							<tr>
								<td style="text-align:center" colspan="3">
									<h4>Select up to 6 attributes to display</h4>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<asp:CheckBoxList id="cblAttributes" runat="server" RepeatColumns="3" style="width:100%" BorderWidth="1"
										Font-Names="Arial" Font-Size="9pt" DataValueField="sta_id" DataTextField="sta_name"></asp:CheckBoxList>
								</td>
							</tr>
							<tr>
								<td style="text-align:center" colspan="3"><asp:button id="btnViewReport" runat="server" Text="View Report"></asp:button></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
