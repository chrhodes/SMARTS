<%@ Page Language="vb" AutoEventWireup="false" Inherits="SmartsBrowser.List" Codebehind="List.aspx.vb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD Xhtml 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
		<title>SMARTS Browser</title>
		<link href="MyStyles.css" type="text/css" rel="stylesheet"/>
</head>
	<body id="thebody" >
		<form id="theForm" method="post" runat="server">
			<table border="0" width='90%' style="text-align:center;height:100%">
				<tr>
					<td style="width:100%">
						<h4><asp:label Runat="server" id="Label1"></asp:label></h4>
						<asp:ListBox height="100%" style="width:100%" id="grdList" Runat="server" AutoPostBack="True"></asp:ListBox>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
