<%@ Page Language="vb" AutoEventWireup="false" Inherits="SmartsBrowser.history" Codebehind="history.aspx.vb" %>

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
						<h4><label>History</label></h4>
						<hr/>
					</td>
				</tr>
				<tr>
					<td>
						<table style="width:100%">
							<tr>
								<td valign="top" align="left" style="width:60%"></td>
								<td style="width:5%"></td>
								<td align="right" style="width:35%">
									<h6><a href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</a><br/>
										<a href="default.aspx">SMARTS Browser Home</a><br/>
										<asp:hyperlink id="urlReturn" Runat="server">Return</asp:hyperlink><br/>
									</h6>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><asp:datagrid id="grdShapeInfo" HeaderStyle-HorizontalAlign="center"  HeaderStyle-Font-Bold="True"
							FooterStyle-Horizontalstyle="text-align:center" ItemStyle-HorizontalAlign="center" HeaderStyle-ForeColor="#ffffff"
							HeaderStyle-BackColor="#000099" HeaderStyle-Font-Size="10pt" ItemStyle-Font-Size="10pt" Font-Names="Arial"
							AutoGenerateColumns="False" BorderWidth="1" style="width:100%" Runat="server">
							<Columns>
								<asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Function" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" DataField="Function"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="45%" HeaderStyle-Width="45%" HeaderText="Value" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" DataField="Value"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="20%" HeaderStyle-Width="20%" HeaderText="Contact" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" DataField="Contact"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Date" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" DataField="DateTime"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br/>
						<h5><label>Attribute Values</label></h5>
						<asp:datagrid id="grdAttributeValues" HeaderStyle-HorizontalAlign="center"  HeaderStyle-Font-Bold="True"
							FooterStyle-Horizontalstyle="text-align:center" ItemStyle-HorizontalAlign="center" HeaderStyle-ForeColor="#ffffff"
							HeaderStyle-BackColor="#000099" HeaderStyle-Font-Size="10pt" ItemStyle-Font-Size="10pt" Font-Names="Arial"
							AutoGenerateColumns="False" BorderWidth="1" style="width:100%" Runat="server">
							<Columns>
								<asp:BoundColumn ItemStyle-Width="1%" HeaderText="HiddenID" DataField="HiddenID" Visible="False"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="1%" HeaderText="HiddenName" DataField="HiddenName" Visible="False"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="25%" ItemStyle-Font-Bold="True" HeaderStyle-Width="25%" HeaderText="Attribute"
									HeaderStyle-HorizontalAlign="center"  ItemStyle-HorizontalAlign="Left" DataField="Attribute"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Function" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" DataField="Function"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="25%" HeaderStyle-Width="25%" HeaderText="Value" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" DataField="Value"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="20%" HeaderStyle-Width="20%" HeaderText="Contact" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" DataField="Contact"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Date" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" DataField="DateTime"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br/>
						<h5><label>Relation</label></h5>
						<asp:datagrid id="grdRelation" HeaderStyle-HorizontalAlign="center"  HeaderStyle-Font-Bold="True"
							FooterStyle-Horizontalstyle="text-align:center" ItemStyle-HorizontalAlign="center" HeaderStyle-ForeColor="#ffffff"
							HeaderStyle-BackColor="#000099" HeaderStyle-Font-Size="10pt" ItemStyle-Font-Size="10pt" Font-Names="Arial"
							AutoGenerateColumns="False" BorderWidth="1" style="width:100%" Runat="server">
							<Columns>
								<asp:BoundColumn ItemStyle-Width="1%" HeaderText="HiddenName" DataField="HiddenName" Visible="False"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="1%" HeaderText="HiddenID" DataField="HiddenID" Visible="False"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="20%" HeaderStyle-Width="20%" HeaderText="Relation" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="True" ItemStyle-Font-Bold="True" DataField="Relation"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Function" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" DataField="Function"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="30%" HeaderStyle-Width="30%" HeaderText="Value" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" DataField="Value"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="20%" HeaderStyle-Width="20%" HeaderText="Contact" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" DataField="Contact"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Date" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" DataField="DateTime"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br/>
						<h5><label>Containment</label></h5>
						<asp:datagrid id="grdContainment" HeaderStyle-HorizontalAlign="center"  HeaderStyle-Font-Bold="True"
							FooterStyle-Horizontalstyle="text-align:center" ItemStyle-HorizontalAlign="center" HeaderStyle-ForeColor="#ffffff"
							HeaderStyle-BackColor="#000099" HeaderStyle-Font-Size="10pt" ItemStyle-Font-Size="10pt" Font-Names="Arial"
							AutoGenerateColumns="False" BorderWidth="1" style="width:100%" Runat="server">
							<Columns>
								<asp:BoundColumn ItemStyle-Width="1%" HeaderStyle-Width="1%" HeaderText="HiddenID" DataField="HiddenID"
									Visible="False"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="40%" HeaderStyle-Width="40%" HeaderText="Containment" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" DataField="Containment"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="20%" HeaderStyle-Width="20%" HeaderText="Function" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" DataField="Function"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="20%" HeaderStyle-Width="20%" HeaderText="Contact" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" DataField="Contact"></asp:BoundColumn>
								<asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Date" HeaderStyle-HorizontalAlign="center" 
									ItemStyle-HorizontalAlign="Left" DataField="DateTime"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></td>
				</tr>
			</table>
		</form>
	</body>
</html>
