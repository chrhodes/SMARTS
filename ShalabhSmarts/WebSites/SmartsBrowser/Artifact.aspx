<%@ Page Language="vb" AutoEventWireup="false" Inherits="SmartsBrowser.Artifact" Codebehind="Artifact.aspx.vb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD Xhtml 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
		<title>SMARTS Browser</title>
		<link href="MyStyles.css" type="text/css" rel="stylesheet"/>
</head>
	<body id="thebody"  onunload="refreshParent()">
		<form id="theForm" method="post" runat="server">
			<table id="tblPage" cellspacing="3" cellpadding="3" style="width:95%; text-align:center">
				<tr>
					<td>
						<h4><asp:label id="lblPage" Runat="server"></asp:label></h4>
						<hr/>
						<asp:label id="lblArtifactID" Runat="server" Visible="False" Text='<%# Request.QueryString("artifact") %>'>
						</asp:label>
						<asp:label id="lblArtifactAbstraction" Runat="server" Visible="False"></asp:label>
					</td>
				</tr>
				<tr>
					<td align="right">
						<h6>
							<a href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</a><br/>
							<a href="default.aspx">SMARTS Browser Home</a><br/>
							<asp:hyperlink id="urlPrevious" Runat="server"></asp:hyperlink>
						</h6>
					</td>
				</tr>
				<tr>
					<td>
						<asp:datagrid id="grdName" BorderWidth="1px" style="width:100%" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center" 
							Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Name" DataField="Artifact_Name"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br/>
						<asp:datagrid id="grdDescription" BorderWidth="1px" style="width:100%" HeaderStyle-Font-Size="10pt"
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center"  Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Description" DataField="Artifact_Desc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br/>
						<asp:datagrid id="grdLocation" BorderWidth="1px" style="width:100%" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center" 
							Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Location" DataField="Artifact_Loc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br/>
						<asp:datagrid id="grdContact" BorderWidth="1px" style="width:100%" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center" 
							Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Contact" DataField="Artifact_Contact"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br/>
						<asp:datagrid id="grdNote" BorderWidth="1px" style="width:100%" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center" 
							Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Note" DataField="Artifact_Note"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
