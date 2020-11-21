<%@ Page Language="vb" AutoEventWireup="false" Codebehind="history.aspx.vb" Inherits="SMARTSAdmin.history" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>History</title>
		<LINK href="MyStyles.css" type="text/css" rel="stylesheet">
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body id="theBody">
		<form id="theForm" method="post" runat="server">
			<table id="tblSystems" cellSpacing="3" cellPadding="3" width="95%" align="center">
				<tr>
					<td>
						<h4><label>History</label></h4>
						<hr>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%">
							<tr>
								<td vAlign="top" align="left" width="60%"></td>
								<td width="5%"></td>
								<td align="right" width="35%">
									<h6><A href="default.aspx">SMARTS Administration Home</A><br>
										<A href="../SMARTSBROWSER/default.aspx">SMARTS Browser Home</A><br>
										<asp:hyperlink id="urlReturn" Runat="server">Return</asp:hyperlink><br>
									</h6>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><asp:datagrid id="grdShapeInfo" Runat="server" Width="100%" BorderWidth="1" AutoGenerateColumns="False"
							Font-Name="Arial" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
							<Columns>
								<asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Function" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Function"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="45%" HeaderStyle-Width="45%" HeaderText="Value" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Value"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="20%" HeaderStyle-Width="20%" HeaderText="Contact" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Contact"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Date" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="DateTime"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br>
						<h5><label>Attribute Values</label></h5>
						<asp:datagrid id="grdAttributeValues" Runat="server" Width="100%" BorderWidth="1" AutoGenerateColumns="False"
							Font-Name="Arial" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
							<Columns>
								<asp:BoundColumn ItemStyle-Width="1%" HeaderText="HiddenID" DataField="HiddenID" Visible="False"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="1%" HeaderText="HiddenName" DataField="HiddenName" Visible="False"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="25%" ItemStyle-Font-Bold="True" HeaderStyle-Width="25%" HeaderText="Attribute"
									HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" DataField="Attribute"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Function" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Function"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="25%" HeaderStyle-Width="25%" HeaderText="Value" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Value"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="20%" HeaderStyle-Width="20%" HeaderText="Contact" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Contact"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Date" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="DateTime"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br>
						<h5><label>Relation</label></h5>
						<asp:datagrid id="grdRelation" Runat="server" Width="100%" BorderWidth="1" AutoGenerateColumns="False"
							Font-Name="Arial" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
							<Columns>
								<asp:BoundColumn ItemStyle-Width="1%" HeaderText="HiddenName" DataField="HiddenName" Visible="False"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="1%" HeaderText="HiddenID" DataField="HiddenID" Visible="False"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="20%" HeaderStyle-Width="20%" HeaderText="Relation" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="True" ItemStyle-Font-Bold="True" DataField="Relation"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Function" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Function"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="30%" HeaderStyle-Width="30%" HeaderText="Value" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Value"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="20%" HeaderStyle-Width="20%" HeaderText="Contact" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Contact"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Date" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="DateTime"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br>
						<h5><label>Containment</label></h5>
						<asp:datagrid id="grdContainment" Runat="server" Width="100%" BorderWidth="1" AutoGenerateColumns="False"
							Font-Name="Arial" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
							<Columns>
								<asp:BoundColumn ItemStyle-Width="1%" HeaderStyle-Width="1%" HeaderText="HiddenID" DataField="HiddenID"
									Visible="False"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="40%" HeaderStyle-Width="40%" HeaderText="Containment" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Containment"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="20%" HeaderStyle-Width="20%" HeaderText="Function" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Function"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="20%" HeaderStyle-Width="20%" HeaderText="Contact" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Contact"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Date" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="DateTime"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
