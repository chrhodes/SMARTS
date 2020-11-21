<%@ Page Language="vb" AutoEventWireup="false" Codebehind="List.aspx.vb" Inherits="SMARTSAdmin.List" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<HEAD>
		<title>List</title>
		<LINK href="MyStyles.css" type="text/css" rel="stylesheet">
		<meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
		<meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body id="theBody" MS_POSITIONING="GridLayout">
		<form id="theForm" method="post" runat="server">
			<table border="0" width="90%" align="center" height="90%">
				<tr>
					<td width='100%'>
						<h4><asp:Label Runat="server" id="Label1"></asp:Label></h4>
						<asp:ListBox height="90%" Width="100%" id="grdList" Runat="server" AutoPostBack="True"></asp:ListBox>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
