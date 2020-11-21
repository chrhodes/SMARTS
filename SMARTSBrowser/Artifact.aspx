<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Artifact.aspx.vb" Inherits="SMARTSBROWSER.Artifact" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SMARTS Browser</title>
		<LINK href="MyStyles.css" type="text/css" rel="stylesheet">
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<script language="javascript" src="lifeglobals.js"></script>
	</HEAD>
	<body ID="theBody" MS_POSITIONING="GridLayout" onunload="refreshParent()">
		<form id="theForm" method="post" runat="server">
			<table id="tblPage" cellSpacing="3" cellPadding="3" width="95%" align="center">
				<tr>
					<td>
						<h4><asp:Label ID="lblPage" Runat="server"></asp:Label></h4>
						<hr>
						<asp:label id=lblArtifactID Runat="server" Visible="False" Text='<%# Request.QueryString("artifact") %>'>
						</asp:label>
						<asp:Label id="lblArtifactAbstraction" Runat="server" Visible="False"></asp:Label>
					</td>
				</tr>
				<tr>
					<td align="right">
						<h6>
							<A href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</A><br>
							<A href="default.aspx">SMARTS Browser Home</A><br>
							<asp:hyperlink ID="urlPrevious" Runat="server"></asp:hyperlink>
						</h6>
					</td>
				</tr>
				<tr>
					<td>
						<asp:datagrid id="grdName" BorderWidth="1px" Width="100%" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center"
							Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Name" DataField="Artifact_Name"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br>
						<asp:datagrid id="grdDescription" BorderWidth="1px" Width="100%" HeaderStyle-Font-Size="10pt"
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center" Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Description" DataField="Artifact_Desc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br>
						<asp:datagrid id="grdLocation" BorderWidth="1px" Width="100%" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center"
							Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Location" DataField="Artifact_Loc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br>
						<asp:datagrid id="grdContact" BorderWidth="1px" Width="100%" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center"
							Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Contact" DataField="Artifact_Contact"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br>
						<asp:datagrid id="grdNote" BorderWidth="1px" Width="100%" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center"
							Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Note" DataField="Artifact_Note"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
