<%@ Page Language="vb" AutoEventWireup="false" CodeFile="Step.aspx.vb" Inherits="_Step" %>

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
						<h4><label>Process Step</label></h4>
						<hr/>
					</td>
				</tr>
				<tr>
					<td>
						<table style="width:100%">
							<tr>
								<td valign="top" align="left" style="width:60%">
									<h6>Shapes in the <b>Process Steps</b> level are contained by a <b>Business Process</b>, use <b>Objects</b>, have <b>Attributes</b>
										and <b>Artifacts</b>, and contain/relate to other <b>Process Steps</b>.</h6>
								</td>
								<td style="width:5%"></td>
								<td align="right" style="width:35%">						
									<h6><a href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</a><br/>
										<a href="default.aspx">SMARTS Browser Home</a><br/>
										<a href="../SMARTSADMIN/step.aspx?id=<%=Request.QueryString("id")%>&type=<%=Request.QueryString("type")%>" >Edit This Process Step</a><br/>																				
										<asp:Hyperlink id="urlHistory" Runat="server">View History</asp:Hyperlink><br/>
									</h6>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<asp:datagrid id="grdName"  BorderWidth="1px" style="width:100%" HeaderStyle-Font-Size="10pt"
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="center" ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center"  Runat="server" AutoGenerateColumns="False">
							<Columns>
								<asp:BoundColumn HeaderText="Name" HeaderStyle-Width="40%" ItemStyle-Width="40%" DataField="Principal_Name"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="ShapeType" HeaderStyle-Width="30%" ItemStyle-Width="30%" DataField="Principal_TypeName"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="Business Process" HeaderStyle-Width="40%" ItemStyle-Width="40%">
									<ItemTemplate>
										<asp:Hyperlink id="urlBusinessProcess" Runat="server" NavigateUrl='<%# "businessprocess.aspx?id=" & Container.DataItem("Related_ID")%>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:Hyperlink>
									</ItemTemplate>
								</asp:TemplateColumn>
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
						<h5><label>CONTAINS Process Steps of Business Processes</label></h5>
						<asp:label Runat="server" id="lblStub" style="width:100%" BackColor="#000099" ForeColor="#ffffff"
							Font-Bold="True" Font-Size="10pt" BorderColor="#ffffff" BorderWidth="1">SubStep</asp:label>
						<br/>
						<h5><label>USES Objects of Systems</label></h5>
						<asp:datagrid id="grdStepObject" style="width:100%" Runat="server" BorderWidth="1px" ItemStyle-HorizontalAlign="Left"
							ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="center"  HeaderStyle-Font-Bold="True"
							HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
							<Columns>
								<asp:TemplateColumn HeaderText="System" ItemStyle-Width="29%" HeaderStyle-Width="29%">
									<ItemTemplate>
										<asp:Hyperlink id="urlStepObjectSystem" runat="server" NavigateUrl='<%# "sys.aspx?id=" & Container.DataItem("RelatedContainer_ID")%>'>
											<%# Container.DataItem("RelatedContainer_Name")%>
										</asp:Hyperlink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn HeaderText="Type" DataField="Related_TypeName" ></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="Object" ItemStyle-Width="35%" HeaderStyle-Width="35%">
									<ItemTemplate>
										<asp:Hyperlink id="urlStepObjectObject" runat="server" NavigateUrl='<%# "object.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID")%>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:Hyperlink>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br/>
						<h5><label>RELATIONS with Process Steps of Business Processes</label></h5>
						<asp:datagrid id="grdRelations" style="width:100%" Runat="server" BorderWidth="1" ItemStyle-HorizontalAlign="Left"
							ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="center"  HeaderStyle-Font-Bold="True"
							HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
							<Columns>
								<asp:BoundColumn HeaderText="Direction" DataField="Assoc_Direction"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="Business Process" ItemStyle-Width="25%" HeaderStyle-Width="25%">
									<ItemTemplate>
										<asp:Hyperlink runat="server" NavigateUrl='<%# "businessprocess.aspx?id=" & Container.DataItem("RelatedContainer_ID") & "&type=" & Container.DataItem("RelatedContainer_TypeID")%>' id="urlRelationRelatedContainer">
											<%# Dummylink(Container.DataItem("RelatedContainer_Name"))%>
										</asp:Hyperlink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn HeaderText="Type" DataField="Related_TypeName" ItemStyle-Width="10%" HeaderStyle-Width="10%"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="Step/Decision" ItemStyle-Width="25%" HeaderStyle-Width="25%">
									<ItemTemplate>
										<asp:Hyperlink runat="server" NavigateUrl='<%# "step.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID")%>' id="urlRelationRelated">
											<%# Container.DataItem("Related_Name")%>
										</asp:Hyperlink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Relation" ItemStyle-Wrap="True" ItemStyle-Width="30%" HeaderStyle-Width="30%">
									<ItemTemplate>
										<asp:Hyperlink runat="server" NavigateUrl='<%# "Relation.aspx?id=" & Container.DataItem("Principal_ID") & "&type=" & Container.DataItem("Principal_TypeID") & "&relation=" &  Container.DataItem("Assoc_ID")%>' id="urlRelationName">
											<%# Dummylink(Container.DataItem("Assoc_Name"))%>
										</asp:Hyperlink>
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
