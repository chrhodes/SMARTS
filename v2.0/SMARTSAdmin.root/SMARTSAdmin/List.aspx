<%@ Page Language="vb" AutoEventWireup="false" CodeFile="List.aspx.vb" Inherits="List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"  runat="server">
		<title>SMARTS Administration</title>
		<link href="MyStyles.css" type="text/css" rel="stylesheet"/>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
</head>

	<body id="theBody" >
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
