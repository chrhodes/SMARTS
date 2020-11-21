<%@ Page Language="vb" AutoEventWireup="false" Codebehind="BusinessProcess.aspx.vb" Inherits="SMARTSBROWSER.BusinessProcess" %>
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
			<table id="tblBusinesses" cellSpacing="3" cellPadding="3" width="95%" align="center">
				<tr>
					<td>
						<h4><label>Business Process</label></h4>
						<hr>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%">
						<tr>
					<td align="left" valign="top" width="60%">
						<h6>Shapes in the <b>Business Process</b> level contain <B>Process 
								Steps</B>, have <b>Attributes</b> and <B>Artifacts</B>, 
							and relate to other <b>Business Processes</b>.</h6>
					</td>
					<td width="5%"></td>
					<td align="right" width="35%">
						<h6><A href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</A><br>
							<A href="default.aspx">SMARTS Browser Home</A><br>
							<A href="../SMARTSADMIN/businessprocess.aspx?id=<%=Request.QueryString("id")%>&type=<%=Request.QueryString("type")%>" >Edit This Business Process</A><br>
							<asp:HyperLink id="urlHistory" Runat="server">View History</asp:HyperLink><br>
						</h6>
					</td>
					</tr>
					</table>
				</tr>
				<tr>
					<td>
						<asp:datagrid id="grdName" BorderWidth="1px" Width="100%" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center"
							Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Name" DataField="Shape_Name"></asp:BoundColumn>
							</Columns>
						</asp:datagrid>
						<asp:datagrid id="grdDescription" BorderWidth="1px" Width="100%" HeaderStyle-Font-Size="10pt"
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center" Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Description" DataField="Shape_Desc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid>
						<asp:datagrid id="grdLifecycle" BorderWidth="1px" Width="100%" HeaderStyle-Font-Size="10pt"
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center" Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="LifeCycle" DataField="Lifecycle_Name"></asp:BoundColumn>
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
						<h5><label>EXTERNAL INFORMATION Artifact</label></h5>
						<asp:datagrid id="grdArtifacts" BorderWidth="1px" Width="100%" HeaderStyle-Font-Size="10pt"
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center" Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:TemplateColumn ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%" HeaderStyle-Width="20%">
									<ItemTemplate>
										<asp:HyperLink runat="server" Target="_blank" ID="urlArtifact_Location" NavigateUrl='<%# Container.DataItem("Related_Desc") %>'>
											View
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Artifact" ItemStyle-Width="65%" HeaderStyle-Width="65%" FooterStyle-Width="65%">
									<ItemTemplate>
										<asp:HyperLink runat=server NavigateUrl='<%# "artifact.aspx?id=" & Request.querystring("id") & "&type=" & Request.querystring("type") & "&artifact=" &  Container.DataItem("Related_ID")%>' ID="urlArtifact">
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br>
						<h5><label>CONTAINS Process Steps of Business Process</label></h5>
						<asp:datagrid id="grdSteps" BorderWidth="1px" Width="100%" HeaderStyle-Font-Size="10pt"
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center" Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Type" DataField="Related_TypeName"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText=" Name" ItemStyle-Width="35%" HeaderStyle-Width="35%">
									<ItemTemplate>
										<asp:HyperLink ID="urlStep" Runat=server NavigateUrl='<%# "Step.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID")%>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn HeaderText="Description" ItemStyle-width="50%" HeaderStyle-width="50%" DataField="Related_Desc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br>
						<h5><label>RELATIONS with Business Processes</label></h5>
						<asp:datagrid id="grdRelations" Runat="server" BorderWidth="1" Width="100%" HeaderStyle-BackColor="#000099"
							HeaderStyle-ForeColor="#ffffff" autogeneratecolumns="False" HeaderStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
							HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left">
							<Columns>
								<asp:TemplateColumn HeaderText="Business Process" ItemStyle-Width="15%" HeaderStyle-Width="15%">
									<ItemTemplate>
										<asp:HyperLink ID="urlRelationPrincipal" Runat=server NavigateUrl='<%# "BusinessProcess.aspx?id=" & Container.DataItem("Principal_ID") & "&type=" & Container.DataItem("Principal_TypeID")%>'>
											<%# Container.DataItem("Principal_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn ItemStyle-Width="35%" HeaderText="Description" DataField="Principal_Desc"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="Business Process" ItemStyle-Width="15%" HeaderStyle-Width="15%">
									<ItemTemplate>
										<asp:HyperLink ID="urlRelationRelated" Runat=server NavigateUrl='<%# "BusinessProcess.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID")%>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn ItemStyle-Width="35%" HeaderText="Description" DataField="Related_Desc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
