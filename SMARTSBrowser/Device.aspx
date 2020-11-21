<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Device.aspx.vb" Inherits="SMARTSBROWSER.Device" %>
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
			<table id="tblSystems" cellSpacing="3" cellPadding="3" width="95%" align="center">
				<tr>
					<td>
						<h4><label>Device</label></h4>
						<hr>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%">
							<tr>
								<td align="left" valign="top" width="60%">
									<h6>Shapes in the <b>Device</b> level contain other <b>Devices</b> and <b>IPs</b>, 
										host <b>Objects</b>, have <b>Attributes</b> and </b>Artifacts</b>, and relate to other <b>Devices</b>.</h6>
								</td>
								<td width="5%"></td>
								<td align="right" width="35%">
									<h6><A href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</A><br>
										<A href="default.aspx">SMARTS Browser Home</A><br>
										<A href="../SMARTSADMIN/device.aspx?id=<%=Request.QueryString("id")%>&type=<%=Request.QueryString("type")%>" >Edit This Device</A><br>										
										<asp:HyperLink id="urlHistory" Runat="server">View History</asp:HyperLink><br>
									</h6>
								</td>
							</tr>	
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<asp:datagrid id="grdName"  BorderWidth="1px" Width="100%" HeaderStyle-Font-Size="10pt"
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center" Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Name" HeaderStyle-Width="75%" ItemStyle-Width="75%" DataField="Shape_Name"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="ShapeType" HeaderStyle-Width="25%" ItemStyle-Width="25%" DataField="ShapeType_Name"></asp:BoundColumn>
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
						<h5><label>EXTERNAL INFORMATION Artifacts</label></h5>
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
						<h5><label>CONTAINED BY Devices</label></h5>
						<asp:datagrid id="grdContainedByDevice" Runat="server" Width="100%" 
							ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center"
							HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff"
							HeaderStyle-BackColor="#000099">
							<Columns>
								<asp:BoundColumn HeaderText="Type" DataField="Related_TypeName" ></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="Device" ItemStyle-Width="65%" HeaderStyle-Width="65%">
									<ItemTemplate>
										<asp:HyperLink ID="urlContainedByDevice" Runat=server NavigateUrl='<%# "device.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID")%>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br>
						<h5><label>CONTAINS Devices</label></h5>
						<asp:datagrid id="grdContainDevice" Runat="server" Width="100%"
							ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center"
							HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff"
							HeaderStyle-BackColor="#000099">
							<Columns>
								<asp:BoundColumn HeaderText="Type" DataField="Related_TypeName" ></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="Device" ItemStyle-Width="65%" HeaderStyle-Width="65%">
									<ItemTemplate>
										<asp:HyperLink ID="urlContainDevice" Runat=server NavigateUrl='<%# "device.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID")%>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br>
						<asp:datagrid id="grdAddress" Runat="server" Width="100%" 
							ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center"
							HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff"
							HeaderStyle-BackColor="#000099" ItemStyle-Width="15%">
							<Columns>
								<asp:BoundColumn HeaderText="IP Address" DataField="Related_Name"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br>
						<h5><label>HOSTS Objects of Systems</label></h5>
						<asp:datagrid id="grdDeviceObject" Width="100%" Runat="server" BorderWidth="1px" 
							ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True"
							HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
							<Columns>
								<asp:TemplateColumn HeaderText="System" ItemStyle-Width="29%" HeaderStyle-Width="29%">
									<ItemTemplate>
										<asp:HyperLink ID="urlDeviceObjectSystem" Runat=server NavigateUrl='<%# "sys.aspx?id=" & Container.DataItem("RelatedContainer_ID")%>'>
											<%# Container.DataItem("RelatedContainer_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn HeaderText="Type" DataField="Related_TypeName"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="Object" ItemStyle-Width="35%" HeaderStyle-Width="35%">
									<ItemTemplate>
										<asp:HyperLink ID="urlDeviceObjectObject" Runat=server NavigateUrl='<%# "object.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID")%>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br>
						<h5><label>RELATIONS with Devices</label></h5>
						<asp:datagrid id="grdRelations" Width="100%" Runat="server" BorderWidth="1"
							ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Left"
							ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True"
							HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
							<Columns>
								<asp:BoundColumn HeaderText="Direction" DataField="Assoc_Direction"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="Type" DataField="Related_TypeName"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="Device" ItemStyle-Width="30%" HeaderStyle-Width="30%">
									<ItemTemplate>
										<asp:HyperLink ID="urlRelationDeviceName" Runat=server NavigateUrl='<%# "Device.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID")%>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Relation" ItemStyle-Wrap="True" ItemStyle-Width="25%" HeaderStyle-Width="25%">
									<ItemTemplate>
										<asp:HyperLink runat=server NavigateUrl='<%# "Relation.aspx?id=" & Container.DataItem("Principal_ID") & "&type=" & Container.DataItem("Principal_TypeID") & "&relation=" &  Container.DataItem("Assoc_ID")%>' ID="urlRelationName">
											<%# DummyLink(Container.DataItem("Assoc_Name"))%>
										</asp:HyperLink>
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
