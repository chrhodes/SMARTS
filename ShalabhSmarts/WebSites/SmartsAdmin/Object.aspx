<%@ Page Language="vb" AutoEventWireup="false" Inherits="SmartsAdmin._Object" Codebehind="Object.aspx.vb" %>
<%@ Import Namespace="SMARTSCommon.CommonClass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"  runat="server">
		<title>SMARTS Administration</title>
		<link href="MyStyles.css" type="text/css" rel="stylesheet"/>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
</head>

	<body id="theBody">
		<form id="theForm" method="post" runat="server">
			<table id="tblSystems" cellspacing="3" cellpadding="3" width="100%" align="center">
				<tr>
					<td>
						<h4><label>Object</label></h4>
						<hr/>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%">
							<tr>
								<td align="left" valign="top" width="60%">
									<h6>Shapes in the <b>Object</b> level are contained by a <a href="sys.aspx">System</a>, 
										hosted by <a href="device.aspx">Devices</a>, used by <a href="step.aspx">Process 
											Steps</a>, contain <b>Functional Pieces</b>, have <b>Attributes</b> and <a href="artifact.aspx">
											Artifacts</a>, and relate to other <b>Objects</b>.</h6>
								</td>
								<td width="5%"></td>
								<td align="right" width="35%">
									<h6><a href="default.aspx">SMARTS Administration Home</a><br/>
										<a href="../SMARTSBROWSER/default.aspx">SMARTS Browser Home</a><br/>
										<asp:HyperLink id="urlBrowseThis" Runat="server">Browse to this Object</asp:HyperLink><br/>
										<asp:HyperLink id="urlChangeContainer" Runat="server">Change Container</asp:HyperLink><br/>
										<asp:HyperLink id="urlHistory" Runat="server">View History</asp:HyperLink><br/>
									</h6>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%">
							<tr>
								<td width="33%"><font style="FONT-WEIGHT: bold; FONT-FAMILY: Arial" size="2">SYSTEM 
										&nbsp;&nbsp;</font></td>
								<td width="33%"><font style="FONT-WEIGHT: bold; FONT-FAMILY: Arial" size="2">TYPE 
										&nbsp;&nbsp;</font></td>
								<td width="34%"><font style="FONT-WEIGHT: bold; FONT-FAMILY: Arial" size="2">NAME 
										&nbsp;&nbsp;<a title="View list of existing objects" style="FONT-SIZE: 8pt; FONT-FAMILY: Arial" href="List.aspx?list=<%=LIST_OBJECTS%>" target="_blank" >
											View All Objects</a></font></td>
							</tr>
							<tr>
								<td><asp:dropdownlist id="ddlSystemList" AutoPostBack="True" Width="100%" Runat="server" DataValueField="Shape_ID" DataTextField="Shape_Name"></asp:dropdownlist></td>
								<td><asp:dropdownlist id="ddlTypeList" AutoPostBack="True" Width="100%" Runat="server" DataValueField="ShapeType_ID" DataTextField="ShapeType_Name"></asp:dropdownlist></td>
								<td><asp:dropdownlist id="ddlList" AutoPostBack="True" Width="100%" Runat="server" DataValueField="Related_ID"	DataTextField="Related_Name"></asp:dropdownlist></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><asp:label id="lblMessage" Runat="server" Font-Bold="True" Visible="False" ForeColor="red"></asp:label></td>
				</tr>
				<tr>
					<td>
						<asp:datagrid id="grdName" Width="100%" Runat="server" AutoGenerateColumns="False" BorderWidth="1px"
							OnCancelCommand="ControlCancel" OnEditCommand="ControlEdit" OnUpdateCommand="ControlUpdate"
							OnItemDataBound="ControlItemDataBound"
							HeaderStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center"							
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" 
							ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"	>
							<Columns>
								<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Submit" CancelText="Cancel" EditText="Edit" HeaderStyle-Width="15%" ItemStyle-Width="15%" >
								</asp:EditCommandColumn>
								<asp:TemplateColumn HeaderText="Name" HeaderStyle-Width="30%" ItemStyle-Width="30%">
									<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "Principal_Name") %>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="txtName" Runat="server" Font-Names="Arial" Width="100%" Text='<%# DataBinder.Eval(Container.DataItem, "Principal_Name") %>'></asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="ShapeType" HeaderStyle-Width="25%" ItemStyle-Width="25%">
									<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "Principal_TypeName") %></ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="System" HeaderStyle-Width="30%" ItemStyle-Width="30%">
									<ItemTemplate>
										<asp:HyperLink ID="urlSystem" Runat="server" NavigateUrl='<%# "sys.aspx?id=" & Container.DataItem("PrincipalContainer_ID")%>'>
											<%# Container.DataItem("PrincipalContainer_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid>
						<asp:datagrid id="grdDescription" Width="100%" Runat="server" AutoGenerateColumns="False" BorderWidth="1"
							OnEditCommand="ControlEdit" OnUpdateCommand="ControlUpdate" OnItemDataBound="ControlItemDataBound"
							oncancelcommand="ControlCancel" Font-Names="Arial">
							<Columns>
								<asp:EditCommandColumn HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Width="15%"
									HeaderStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
									HeaderStyle-HorizontalAlign="Center" ButtonType="LinkButton" EditText="Edit" UpdateText="Submit" CancelText="Cancel"></asp:EditCommandColumn>
								<asp:TemplateColumn HeaderText="Description" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
									HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "Shape_Desc") %></ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="txtDescription" Runat="server" Font-Names="Arial" Width="100%" Height="100%"
											TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "Shape_Desc") %>'></asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid>
						<asp:datagrid id="grdLifecycle" Width="100%" Runat="server" AutoGenerateColumns="False" BorderWidth="1"
							OnCancelCommand="ControlCancel" OnEditCommand="ControlEdit" OnUpdateCommand="ControlUpdate"
							OnItemDataBound="ControlItemDataBound">
							<Columns>
								<asp:EditCommandColumn  HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
									ItemStyle-width="15%" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
									HeaderStyle-HorizontalAlign="Center" ButtonType="LinkButton" EditText="Edit" UpdateText="Submit" CancelText="Cancel"></asp:EditCommandColumn>
								<asp:TemplateColumn Visible="False">
									<ItemTemplate>
										<asp:Label id="lblLifecycle_ID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lifecycle_ID") %>' >
										</asp:Label>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Lifecycle" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
									HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "Lifecycle_Name") %>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:DropDownList id="ddlLifecycle" Runat="server" Width="100%" DataTextField="Lifecycle_Name" DataValueField="Lifecycle_ID"></asp:DropDownList>
									</EditItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br/>
						<h5><label>ATTRIBUTES</label></h5>
						<asp:datagrid id="grdAttribute" Width="100%" Runat="server" AutoGenerateColumns="False" BorderWidth="1"
							OnCancelCommand="ControlCancel" OnEditCommand="ControlEdit" OnUpdateCommand="ControlUpdate"
							OnItemDataBound="ControlItemDataBound">
							<Columns>
								<asp:EditCommandColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
									HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
									HeaderStyle-HorizontalAlign="Center" ButtonType="LinkButton" EditText="Edit" UpdateText="Submit" CancelText="Cancel"></asp:EditCommandColumn>
								<asp:TemplateColumn HeaderStyle-Font-Size="10pt" HeaderStyle-Width="42%" HeaderStyle-BackColor="#000099"
									HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center"
									HeaderText="Attribute">
									<ItemTemplate>
										<asp:Label id="lblSTA_ID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ShapeTypeAttribute_ID") %>' Visible="False">
										</asp:Label>
										<input type="text" value="<%# DataBinder.Eval(Container.DataItem, "Attribute_Name") %>" title="<%# DataBinder.Eval(Container.DataItem, "ShapeTypeAttribute_Desc") %>" onclick="alert('<%# DataBinder.Eval(Container.DataItem, "ShapeTypeAttribute_Desc") %>')" style="Height:17px; width:350px; background-color:transparent; color:#000000; border-style:none; text-align:left" >										
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderStyle-Font-Size="10pt" HeaderStyle-Width="43%" HeaderStyle-BackColor="#000099"
									HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center"
									HeaderText="Value">
									<ItemTemplate>
										<asp:HyperLink ID="urlAttributeValue" Runat="server" target="_blank" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value") %>'>
											<%# Container.DataItem("AttributeValue_Value")%>
										</asp:HyperLink>
										<asp:Label id="lblAttributeValue" Runat="server" text='<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value") %>'></asp:Label>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:DropDownList id="ddlAttributeValue" Runat="server" Width="100%"></asp:DropDownList>
										<asp:TextBox ID="txtAttributeValue" Runat="server" Width="100%" text='<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value") %>'></asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br/>
						<h5><label>EXTERNAL INFORMATION </label><a href="artifact.aspx"><b>Artifacts</b></a></h5>
						<asp:datagrid id="grdArtifacts" Width="100%" Runat="server" BorderWidth="1" OnItemDataBound="ControlItemDataBound"
							OnDeleteCommand="ControlDeleteCommand" OnItemCommand="ControlItemCommand" ShowFooter="True"
							FooterStyle-HorizontalAlign="Left" FooterStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left"
							ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True"
							HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
							<Columns>
								<asp:TemplateColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Size="10pt"
									HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Center"
									FooterStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<asp:LinkButton ID="btnArtifactDelete" CommandName="Delete" Text="Delete" Runat="Server"></asp:LinkButton>
									</ItemTemplate>
									<FooterTemplate>
										<asp:LinkButton ID="btnArtifactAdd" Commandname="Insert" Text="Add" Runat="server" Visible="True"></asp:LinkButton>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%" FooterStyle-Width="15%">
									<ItemTemplate>
										<asp:HyperLink runat="server" Target="_blank" ID="urlArtifact_Location" NavigateUrl='<%# Container.DataItem("Related_Desc") %>'>
											View
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Artifact" ItemStyle-Width="70%" HeaderStyle-Width="70%" FooterStyle-Width="70%">
									<ItemTemplate>
										<asp:Label ID="lblArtifactID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Related_ID") %>' Visible="False">
										</asp:Label>
										<asp:HyperLink Runat="server" NavigateUrl='<%# "artifact.aspx?id=" & ddlList.SelectedItem.Value & "&type=" & ddlTypeList.SelectedItem.Value & "&artifact=" &  Container.DataItem("Related_ID")%>' ID="urlArtifact">
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
									<FooterTemplate>
										<asp:DropDownList ID="ddlArtifacts" runat="server" DataTextField="Artifact_Name" DataValueField="Artifact_ID"
											Width="100%" Visible="true"></asp:DropDownList>
									</FooterTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br/>
						<h5><label>CONTAINS Objects of </label><a href="sys.aspx"><b>Systems</b></a> </h5>
						<asp:Label Runat="server" id="lblStub" Width="100%" BackColor="#000099" ForeColor="#ffffff"
							Font-Bold="True" Font-Size="10pt" BorderColor="#ffffff" BorderWidth="1">Functional Piece</asp:Label>
						<br/>
						<h5><label>USED BY </label><a href="step.aspx"><b>Process Steps</b></a> of <a href="businessprocess.aspx"><b>Business Processes</b></a></h5>
						<asp:datagrid id="grdStepObject" Width="100%" Runat="server" BorderWidth="1" ItemStyle-HorizontalAlign="Left"
							ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True"
							HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
							<Columns>
								<asp:TemplateColumn HeaderText="Business Process" ItemStyle-Width="25%" HeaderStyle-Width="25%">
									<ItemTemplate>
										<asp:HyperLink ID="urlStepBusinessProcess" Runat="server" NavigateUrl='<%# "BusinessProcess.aspx?id=" & Container.DataItem("RelatedContainer_ID") & "&type=" & Container.DataItem("RelatedContainer_TypeID") %>'>
											<%# Container.DataItem("RelatedContainer_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Process Step" ItemStyle-Width="25%" HeaderStyle-Width="25%">
									<ItemTemplate>
										<asp:HyperLink ID="urlStepObject" Runat="server" NavigateUrl='<%# "Step.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID") %>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn ItemStyle-Width="50%" HeaderStyle-Width="50%" HeaderText="Description" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Related_Desc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br/>
						<h5><label>HOSTED BY</label> <a href="device.aspx"><b>Devices</b></a></h5>						
						<asp:datagrid id="grdDeviceObject" Width="100%" Runat="server" BorderWidth="1" ItemStyle-HorizontalAlign="Left"
							ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True"
							HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
							<Columns>
								<asp:BoundColumn ItemStyle-Width="25%" HeaderStyle-Width="25%" HeaderText="Environment" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Related_Environment"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="Device" ItemStyle-Width="25%" HeaderStyle-Width="25%">
									<ItemTemplate>
										<asp:HyperLink ID="urlDeviceObjectServer" Runat="server" NavigateUrl='<%# "Device.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID") %>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn ItemStyle-Width="50%" HeaderStyle-Width="50%" HeaderText="Description" HeaderStyle-HorizontalAlign="Center"
									ItemStyle-HorizontalAlign="Left" DataField="Related_Desc"></asp:BoundColumn>
							</Columns>
						</asp:datagrid><br/>
						<h5><label>RELATIONS with Objects </label> of <a href="sys.aspx"> Systems </a> </h5>
						<asp:datagrid id="grdRelations" Width="100%" Runat="server" BorderWidth="1" OnItemDataBound="ControlItemDataBound"
							OnDeleteCommand="ControlDeleteCommand" OnItemCommand="ControlItemCommand" ShowFooter="True"
							FooterStyle-HorizontalAlign="Left" FooterStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left"
							ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True"
							HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099"
							ItemStyle-Width="15%">
							<Columns>
								<asp:TemplateColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Size="10pt"
									HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Center"
									FooterStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<asp:LinkButton ID="btnRelationDelete" CommandName="Delete" Text="Delete" Runat="Server"></asp:LinkButton>
									</ItemTemplate>
									<FooterTemplate>
										<asp:LinkButton ID="btnRelationAdd" CommandName="Insert" Text="Add" Runat="server"></asp:LinkButton>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Direction" ItemStyle-Width="10%" HeaderStyle-Width="10%">
									<ItemTemplate>
										<asp:Label ID="lblDirection" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Assoc_Direction") %>' >
										</asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<asp:DropDownList ID="ddlDirection" runat="server" Width="100%" Visible="true">
											<asp:ListItem Value="0">From</asp:ListItem>
											<asp:ListItem Value="1">To</asp:ListItem>
										</asp:DropDownList>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="System" ItemStyle-Width="25%" HeaderStyle-Width="25%">
									<ItemTemplate>
										<asp:HyperLink Runat="server" NavigateUrl='<%# "sys.aspx?id=" & Container.DataItem("RelatedContainer_ID") & "&type=" & Container.DataItem("RelatedContainer_TypeID")%>' ID="urlRelationSystem">
											<%# Container.DataItem("RelatedContainer_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
									<FooterTemplate>
										<asp:DropDownList ID="ddlRelatedSystem" OnSelectedIndexChanged="DataBindDependentList" runat="server"
												DataTextField="Shape_Name" DataValueField="Shape_ID" AutoPostBack="True" Width="100%" Visible="true"></asp:DropDownList>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Object" ItemStyle-Width="25%" HeaderStyle-Width="25%">
									<ItemTemplate>
										<asp:HyperLink Runat="server" NavigateUrl='<%# "object.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID")%>' ID="urlRelationObject">
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
									<FooterTemplate>
										<asp:dropdownlist id="ddlRelated" Runat="server" Width="100%" DataTextField="Related_Name" DataValueField="Related_ID"></asp:dropdownlist>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Relation" ItemStyle-Wrap="True" ItemStyle-Width="25%" HeaderStyle-Width="25%">
									<ItemTemplate>
										<asp:Label ID="lblRelationID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Assoc_ID") %>' Visible="False">
										</asp:Label>
										<asp:HyperLink Runat="server" NavigateUrl='<%# "Relation.aspx?id=" & Container.DataItem("Principal_ID") & "&type=" & Container.DataItem("Principal_TypeID") & "&relation=" &  Container.DataItem("Assoc_ID")%>' ID="urlRelationName">
											<%#DummyLink(Container.DataItem("Assoc_Name"))%>
										</asp:HyperLink>
									</ItemTemplate>
									<FooterTemplate>
										<asp:TextBox ID="txtRelation_Name" Runat="server" Font-Names="Arial" Width="100%" Height="100%"></asp:TextBox>
									</FooterTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
