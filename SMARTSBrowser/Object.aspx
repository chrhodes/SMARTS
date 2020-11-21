<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Object.aspx.vb" Inherits="SMARTSBROWSER._Object" %>
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
						<h4><label>Object</label></h4>
						<hr>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%">
							<tr>
								<td align="left" valign="top" width="60%">
									<h6>Shapes in the <b>Object</b> level are contained by a <b>System</b>, 
										hosted by <b>Devices</b>, used by <b>Process Steps</b>, contain <b>Functional Pieces</b>, have <b>Attributes</b> 
										and <b>Artifacts</b>, and relate to other <b>Objects</b>.</h6>
								</td>
								<td width="5%"></td>
								<td align="right" width="35%">
									<h6><A href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</A><br>
										<A href="default.aspx">SMARTS Browser Home</A><br>
										<A href="../SMARTSADMIN/object.aspx?id=<%=Request.QueryString("id")%>&type=<%=Request.QueryString("type")%>" >Edit This Object</A><br>																				
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
								<asp:BoundColumn HeaderText="Name" HeaderStyle-Width="40%" ItemStyle-Width="40%" DataField="Principal_Name"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="ShapeType" HeaderStyle-Width="30%" ItemStyle-Width="30%" DataField="Principal_TypeName"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="System" HeaderStyle-Width="40%" ItemStyle-Width="40%">
									<ItemTemplate>
										<asp:HyperLink ID="urlSystem" Runat=server NavigateUrl='<%# "sys.aspx?id=" & Container.DataItem("Related_ID")%>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
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
						<h5><label>CONTAINS Objects of Systems</label></h5>
						<asp:Label Runat="server" id="lblStub" Width="100%" BackColor="#000099" ForeColor="#ffffff"
							Font-Bold="True" Font-Size="10pt" BorderColor="#ffffff" BorderWidth="1">Functional Piece</asp:Label>
						<br>
						<h5><label>USED BY Process Steps of Business Processes</label></h5>
						<asp:datagrid id="grdStepObject" Width="100%" Runat="server" BorderWidth="1" ItemStyle-HorizontalAlign="Left"
							ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True"
							HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
							<Columns>
								<asp:TemplateColumn HeaderText="Business Process" ItemStyle-Width="25%" HeaderStyle-Width="25%">
									<ItemTemplate>
										<asp:HyperLink ID="urlStepBusinessProcess" Runat=server NavigateUrl='<%# "BusinessProcess.aspx?id=" & Container.DataItem("RelatedContainer_ID") & "&type=" & Container.DataItem("RelatedContainer_TypeID") %>'>
											<%# Container.DataItem("RelatedContainer_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Process Step" ItemStyle-Width="25%" HeaderStyle-Width="25%">
									<ItemTemplate>
										<asp:HyperLink ID="urlStepObject" Runat=server NavigateUrl='<%# "Step.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID") %>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn ItemStyle-Width="50%" HeaderStyle-Width="50%" HeaderText="Description" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Related_Desc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br>
						<h5><label>HOSTED BY Devices</label></h5>						
						<asp:datagrid id="grdDeviceObject" Width="100%" Runat="server" BorderWidth="1" ItemStyle-HorizontalAlign="Left"
							ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True"
							HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
							<Columns>
								<asp:BoundColumn ItemStyle-Width="25%" HeaderStyle-Width="25%" HeaderText="Environment" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Related_Environment"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="Device" ItemStyle-Width="25%" HeaderStyle-Width="25%">
									<ItemTemplate>
										<asp:HyperLink ID="urlDeviceObjectServer" Runat=server NavigateUrl='<%# "Device.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID") %>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn ItemStyle-Width="50%" HeaderStyle-Width="50%" HeaderText="Description" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Related_Desc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br>
						<h5><label>RELATIONS with Objects of Systems</label></h5>
						<asp:datagrid id="grdRelations" Width="100%" Runat="server" BorderWidth="1"
							ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Left"
							ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True"
							HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
							<Columns>
								<asp:BoundColumn HeaderText="Direction" DataField="Assoc_Direction"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="System" ItemStyle-Width="25%" HeaderStyle-Width="25%">
									<ItemTemplate>
										<asp:HyperLink runat=server NavigateUrl='<%# "sys.aspx?id=" & Container.DataItem("RelatedContainer_ID") & "&type=" & Container.DataItem("RelatedContainer_TypeID")%>' ID="urlRelationSystem">
											<%# DummyLink(Container.DataItem("RelatedContainer_Name"))%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn HeaderText="Type" DataField="Related_TypeName" ItemStyle-Width="10%" HeaderStyle-Width="10%"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="Object" ItemStyle-Width="25%" HeaderStyle-Width="25%">
									<ItemTemplate>
										<asp:HyperLink runat=server NavigateUrl='<%# "object.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID")%>' ID="urlRelationObject">
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Relation" ItemStyle-Wrap="True" ItemStyle-Width="30%" HeaderStyle-Width="30%">
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
