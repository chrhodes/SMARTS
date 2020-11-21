<%@ Page Language="vb" AutoEventWireup="false" CodeFile="Relation.aspx.vb" Inherits="Relation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD Xhtml 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
		<title>SMARTS Browser</title>
		<link href="MyStyles.css" type="text/css" rel="stylesheet"/>
</head>
	<body id="thebody"> 
		<form id="theForm" method="post" runat="server">
			<table id="tblPage" cellspacing="3" cellpadding="3" style="width:95%; text-align:center">
				<tr>
					<td>
						<h4><label>Relation</label></h4>
						<hr/>
						<asp:label id="lblRelationID" Text='<%# Request.QueryString("relation") %>' Visible="False" Runat="server">
						</asp:label>
 					</td>
				</tr>
				<tr>
					<td align="right">
						<h6>
							<a href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</a><br/>
							<a href="default.aspx">SMARTS Browser Home</a><br/>
							<a href="../SMARTSADMIN/relation.aspx?id=<%=Request.QueryString("id")%>&type=<%=Request.QueryString("type")%>&relation=<%=Request.QueryString("relation")%>">Edit This Relation</a><br/>																											
					<br/>
						</h6>
					</td>
				</tr>
				<tr>
					<td>
						<asp:datagrid id="grdName"  BorderWidth="1px" style="width:100%" HeaderStyle-Font-Size="10pt"
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center"  Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Name" DataField="Assoc_Name"></asp:BoundColumn>
							</Columns>
						</asp:datagrid>
						<asp:datagrid id="grdDescription" BorderWidth="1px" style="width:100%" HeaderStyle-Font-Size="10pt" 
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"  ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center"  Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Description" DataField="Assoc_Desc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br/>
						<h5><label>DIRECTION</label></h5>
					<asp:datagrid id="grdRelations" Runat="server" style="width:100%" BorderWidth="1" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" autogeneratecolumns="False" HeaderStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
							HeaderStyle-HorizontalAlign="center"  ItemStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left">
							<Columns>
								<asp:TemplateColumn>
									<ItemTemplate>
										<asp:label id="lblRelationPrincipalID" Runat="server" Visible="False" Text='<%# Container.DataItem("Principal_ID")%>'></asp:label>
										<asp:Hyperlink runat="server" id="urlRelationPrincipal" >
											<%# Container.DataItem("Principal_Name")%> 								
										</asp:Hyperlink>
										(<%# Container.DataItem("Principal_TypeName")%>) 
										<asp:Hyperlink runat="server" id="urlRelationPrincipalContainer">
										<%# Container.DataItem("PrincipalContainer_Name")%>
										</asp:Hyperlink>
										<b> <%# Container.DataItem("Assoc_Direction")%> </b>
										<asp:Hyperlink runat="server" id="urlRelationRelated">
											<%# Container.DataItem("Related_Name")%> 								
										</asp:Hyperlink>
										(<%# Container.DataItem("Related_TypeName")%>) 
										<asp:Hyperlink runat="server" id="urlRelationRelatedContainer">
										<%# Container.DataItem("RelatedContainer_Name")%>
										</asp:Hyperlink>
									</ItemTemplate>
								</asp:TemplateColumn>	
							</Columns>
						</asp:datagrid><br/>
						<h5><label>ATTRIBUTES</label></h5>
						<asp:datagrid id="grdAttribute" BorderWidth="1px" style="width:100%" HeaderStyle-Font-Size="10pt"
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center"  Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Attribute" DataField="Attribute_Name"></asp:BoundColumn>
								<asp:TemplateColumn HeaderStyle-Font-Size="10pt" HeaderStyle-Width="43%" HeaderStyle-BackColor="#000099"
									HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center" 
									HeaderText="Value">
									<ItemTemplate>
										<asp:Hyperlink id="urlAttributeValue" Runat="server" Target="_blank" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value") %>'>
											<%# Container.DataItem("AttributeValue_Value")%>
										</asp:Hyperlink>
										<asp:label id="lblAttributeValue" Runat="server" text='<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value") %>'>
										</asp:label>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br/>	
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
