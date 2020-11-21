<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Relation.aspx.vb" Inherits="SMARTSBROWSER.Relation" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SMARTS Browser</title>
		<LINK href="MyStyles.css" type="text/css" rel="stylesheet">
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<BODY ID="theBody"> 
		<form id="theForm" method="post" runat="server">
			<table id="tblPage" cellSpacing="3" cellPadding="3" width="95%" align="center">
				<tr>
					<td>
						<h4><label>Relation</label></h4>
						<hr>
						<asp:label id=lblRelationID Text='<%# Request.QueryString("relation") %>' Visible="False" Runat="server">
						</asp:label>
 					</td>
				</tr>
				<tr>
					<td align="right">
						<h6>
							<A href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</A><br>
							<A href="default.aspx">SMARTS Browser Home</A><br>
							<A href="../SMARTSADMIN/relation.aspx?id=<%=Request.QueryString("id")%>&type=<%=Request.QueryString("type")%>&relation=<%=Request.QueryString("relation")%>">Edit This Relation</A><br>																											
					<br>
						</h6>
					</td>
				</tr>
				<tr>
					<td>
						<asp:datagrid id="grdName"  BorderWidth="1px" Width="100%" HeaderStyle-Font-Size="10pt"
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center" Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Name" DataField="Assoc_Name"></asp:BoundColumn>
							</Columns>
						</asp:datagrid>
						<asp:datagrid id="grdDescription" BorderWidth="1px" Width="100%" HeaderStyle-Font-Size="10pt" 
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"  ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center" Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Description" DataField="Assoc_Desc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br>
						<h5><label>DIRECTION</label></h5>
					<asp:datagrid id="grdRelations" Runat="server" Width="100%" BorderWidth="1" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" autogeneratecolumns="False" HeaderStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
							HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left">
							<Columns>
								<asp:TemplateColumn>
									<ItemTemplate>
										<asp:label id="lblRelationPrincipalID" Runat="server" Visible="False" Text='<%# Container.DataItem("Principal_ID")%>'></asp:Label>
										<asp:HyperLink runat=server ID="urlRelationPrincipal" >
											<%# Container.DataItem("Principal_Name")%> 								
										</asp:HyperLink>
										(<%# Container.DataItem("Principal_TypeName")%>) 
										<asp:HyperLink runat=server ID="urlRelationPrincipalContainer">
										<%# Container.DataItem("PrincipalContainer_Name")%>
										</asp:HyperLink>
										<b> <%# Container.DataItem("Assoc_Direction")%> </b>
										<asp:HyperLink runat=server ID="urlRelationRelated">
											<%# Container.DataItem("Related_Name")%> 								
										</asp:HyperLink>
										(<%# Container.DataItem("Related_TypeName")%>) 
										<asp:HyperLink runat=server ID="urlRelationRelatedContainer">
										<%# Container.DataItem("RelatedContainer_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>	
							</Columns>
						</asp:datagrid><br>
						<h5><label>ATTRIBUTES</label></h5>
						<asp:datagrid id="grdAttribute" BorderWidth="1px" Width="100%" HeaderStyle-Font-Size="10pt"
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center" Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Attribute" DataField="Attribute_Name"></asp:BoundColumn>
								<asp:TemplateColumn HeaderStyle-Font-Size="10pt" HeaderStyle-Width="43%" HeaderStyle-BackColor="#000099"
									HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center"
									HeaderText="Value">
									<ItemTemplate>
										<asp:HyperLink ID="urlAttributeValue" Runat="server" Target=_blank NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value") %>'>
											<%# Container.DataItem("AttributeValue_Value")%>
										</asp:HyperLink>
										<asp:Label id="lblAttributeValue" Runat="server" text='<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value") %>'>
										</asp:Label>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br>	
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
