<%@ Page Language="vb" AutoEventWireup="false" CodeFile="Sys.aspx.vb" Inherits="Sys" %>
<%@ Import Namespace="SMARTSCommon.CommonClass" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD Xhtml 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
		<title>SMARTS Browser</title>
		<link href="MyStyles.css" type="text/css" rel="stylesheet"/>
</head>
	<body id="thebody"> 
		<form id="theForm" method="post" runat="server">
			<table id="tblSystems" cellspacing="3" cellpadding="3" style="width:95%; text-align:center">
				<tr>
					<td>
						<h4><label>System</label></h4>
						<hr/>
					</td>
				</tr>
				<tr>
					<td>
						<table style="width:100%">
							<tr>
								<td align="left" valign="top" style="width:60%">
									<h6>Shapes in the <b>System</b> level contain <b>Objects</b>, 
										have <b>Attributes</b> and <b>Artifacts</b>, and relate to 
										other <b>Systems</b>.</h6>
								</td>
								<td style="width:5%"></td>
								<td align="right" style="width:35%">
									<h6><a href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</a><br/>
										<a href="default.aspx">SMARTS Browser Home</a><br/>
										<a href="../SMARTSADMIN/sys.aspx?id=<%=Request.QueryString("id")%>&type=<%=SHAPETYPE_SYSTEM%>" >Edit This System</a><br/>																											
										<asp:Hyperlink id="urlHistory" Runat="server">View History</asp:Hyperlink><br/>
									</h6>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<asp:datagrid id="grdName" BorderWidth="1px" style="width:100%" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center" 
							Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Name" DataField="Shape_Name"></asp:BoundColumn>
							</Columns>
						</asp:datagrid>
						<asp:datagrid id="grdDescription" BorderWidth="1px" style="width:100%" HeaderStyle-Font-Size="10pt"
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center"  Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Description" DataField="Shape_Desc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid>
						<asp:datagrid id="grdLifecycle" BorderWidth="1px" style="width:100%" HeaderStyle-Font-Size="10pt"
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center"  Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="LifeCycle" DataField="Lifecycle_Name"></asp:BoundColumn>
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
						<h5><label>EXTERNAL INFORMATION Artifacts</label></h5>
						<asp:datagrid id="grdArtifacts" BorderWidth="1px" style="width:100%" HeaderStyle-Font-Size="10pt"
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center"  Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:TemplateColumn ItemStyle-HorizontalAlign="center" ItemStyle-Width="20%" HeaderStyle-Width="20%">
									<ItemTemplate>
										<asp:Hyperlink runat="server" Target="_blank" id="urlArtifact_Location" NavigateUrl='<%# Container.DataItem("Related_Desc") %>'>
											View
										</asp:Hyperlink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Artifact" ItemStyle-Width="65%" HeaderStyle-Width="65%" FooterStyle-Width="65%">
									<ItemTemplate>
										<asp:Hyperlink runat="server" NavigateUrl='<%# "artifact.aspx?id=" & Request.querystring("id") & "&type=" & Request.querystring("type") & "&artifact=" &  Container.DataItem("Related_ID")%>' id="urlArtifact">
											<%# Container.DataItem("Related_Name")%>
										</asp:Hyperlink>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br/>
						<h5><label>CONTAINS Objects of Systems</label></h5>
						<asp:datagrid id="grdObjects" Runat="server" BorderWidth="1" style="width:100%" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" autogeneratecolumns="False" HeaderStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
							HeaderStyle-HorizontalAlign="center"  ItemStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left">
							<Columns>
								<asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Type" DataField="Related_TypeName"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="Object" ItemStyle-Width="35%" HeaderStyle-Width="35%">
									<ItemTemplate>
										<asp:Hyperlink id="urlObject" runat="server" NavigateUrl='<%# "object.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID")%>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:Hyperlink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn HeaderText="Description" ItemStyle-Width="50%" HeaderStyle-Width="50%" DataField="Related_Desc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br/>
						<h5><label>RELATIONS with Systems</label></h5>
						<asp:datagrid id="grdRelations" Runat="server" BorderWidth="1" style="width:100%" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" autogeneratecolumns="False" HeaderStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
							HeaderStyle-HorizontalAlign="center"  ItemStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left">
							<Columns>
								<asp:TemplateColumn HeaderText="System" ItemStyle-Width="15%" HeaderStyle-Width="15%">
									<ItemTemplate>
										<asp:Hyperlink id="urlRelationPrincipal" runat="server" NavigateUrl='<%# "sys.aspx?id=" & Container.DataItem("Principal_ID") & "&type=" & Container.DataItem("Principal_TypeID")%>'>
											<%# Container.DataItem("Principal_Name")%>
										</asp:Hyperlink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn ItemStyle-Width="35%" HeaderText="Description" DataField="Principal_Desc"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="System" ItemStyle-Width="15%" HeaderStyle-Width="15%">
									<ItemTemplate>
										<asp:Hyperlink id="urlRelationRelated" runat="server" NavigateUrl='<%# "sys.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID")%>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:Hyperlink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn ItemStyle-Width="35%" HeaderText="Description" DataField="Related_Desc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
