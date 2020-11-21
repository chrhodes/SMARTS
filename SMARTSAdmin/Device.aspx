<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Device.aspx.vb" Inherits="SMARTSAdmin.Device" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SMARTS Administration</title>
		<LINK href="MyStyles.css" type="text/css" rel="stylesheet">
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body id="theBody">
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
										host <A href="object.aspx">Objects</A>, have <b>Attributes</b> and <A href="artifact.aspx">
											Artifacts</A>, and relate to other <b>Devices</b>.</h6>
								</td>
								<td width="5%"></td>
								<td align="right" width="35%">
									<h6><A href="default.aspx">SMARTS Administration Home</A><br>
										<A href="../SMARTSBROWSER/default.aspx">SMARTS Browser Home</A><br>
										<asp:HyperLink id="urlBrowseThis" Runat="server">Browse to this Device</asp:HyperLink><br>
										<asp:HyperLink id="urlHistory" Runat="server">View History</asp:HyperLink><br>
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
								<td width="33%"><font style="FONT-WEIGHT: bold; FONT-FAMILY: Arial" size="2">TYPE 
										&nbsp;&nbsp;</font></td>
								<td width="67%"><font style="FONT-WEIGHT: bold; FONT-FAMILY: Arial" size="2">NAME 
										&nbsp;&nbsp;<A title="View list of existing objects" style="FONT-SIZE: 8pt; FONT-FAMILY: Arial" href="List.aspx?list=<%=LIST_DEVICES%>" target=_blank >
											View All Devices</A></font></td>
							</tr>
							<tr>
								<td><asp:dropdownlist id="ddlIP" runat="server" Visible="False" DataTextField="Shape_Name" DataValueField="Shape_ID"
										AutoPostBack="True"></asp:dropdownlist>
										<asp:dropdownlist id="ddlTypeList" DataTextField="ShapeType_Name" DataValueField="ShapeType_ID" AutoPostBack="True"
										Runat="server" Width="100%"></asp:dropdownlist></td>
								<td><asp:dropdownlist id="ddlList" DataTextField="Shape_Name" DataValueField="Shape_ID" AutoPostBack="True"
										Runat="server" Width="100%"></asp:dropdownlist></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<asp:label id="lblMessage" Visible="False" Runat="server" ForeColor="#ff3366" Font-Bold="True"></asp:label><br>
						<asp:datagrid id="grdName" Width="100%" Runat="server" AutoGenerateColumns="False" BorderWidth="1px"
							OnCancelCommand="ControlCancel" OnEditCommand="ControlEdit" OnUpdateCommand="ControlUpdate"
							OnItemDataBound="ControlItemDataBound" 
							HeaderStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center"							
							HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" 
							ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"	>
							<Columns>
								<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Submit" CancelText="Cancel" EditText="Edit" HeaderStyle-Width="15%" ItemStyle-Width="15%">
								</asp:EditCommandColumn>
								<asp:TemplateColumn HeaderText="Name" HeaderStyle-Width="60%" ItemStyle-Width="60%">
									<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "Shape_Name") %></ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="txtName" Runat="server" Font-Name="Arial" Width="100%" Text='<%# DataBinder.Eval(Container.DataItem, "Shape_Name") %>'></asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="ShapeType" HeaderStyle-Width="25%" ItemStyle-Width="25%">
									<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "ShapeType_Name") %></ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid>
						<asp:datagrid id="grdDescription" Width="100%" Runat="server" AutoGenerateColumns="False" BorderWidth="1"
							OnEditCommand="ControlEdit" OnUpdateCommand="ControlUpdate" OnItemDataBound="ControlItemDataBound"
							oncancelcommand="ControlCancel" Font-Name="Arial">
							<Columns>
								<asp:EditCommandColumn HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Width="15%"
									HeaderStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
									HeaderStyle-HorizontalAlign="Center" ButtonType="LinkButton" EditText="Edit" UpdateText="Submit" CancelText="Cancel"></asp:EditCommandColumn>
								<asp:TemplateColumn HeaderText="Description" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
									HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "Shape_Desc") %></ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="txtDescription" Runat="server" Font-Name="Arial" Width="100%" Height="100%"
											TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "Shape_Desc") %>'></asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid>
						<asp:datagrid id="grdLifecycle" Width="100%" Runat="server" AutoGenerateColumns="False" BorderWidth="1"
							OnCancelCommand="ControlCancel" OnEditCommand="ControlEdit" OnUpdateCommand="ControlUpdate"
							OnItemDataBound="ControlItemDataBound">
							<Columns>
								<asp:EditCommandColumn HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
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
						</asp:datagrid><br>						
						<h5><label>ATTRIBUTES</label></h5>
						<asp:datagrid id="grdAttribute" Runat="server" Width="100%" AutoGenerateColumns="False" OnCancelCommand="ControlCancel"
							OnEditCommand="ControlEdit" OnUpdateCommand="ControlUpdate" OnItemDataBound="ControlItemDataBound"
							BorderWidth="1">
							<Columns>
								<asp:EditCommandColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
									HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
									HeaderStyle-HorizontalAlign="Center" ButtonType="LinkButton" EditText="Edit" UpdateText="Submit" CancelText="Cancel"></asp:EditCommandColumn>
								<asp:TemplateColumn HeaderStyle-Font-Size="10pt" ItemStyle-Width="42%" HeaderStyle-Width="42%" HeaderStyle-BackColor="#000099"
									HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center"
									HeaderText="Attribute">
									<ItemTemplate>
										<asp:Label id="lblSTA_ID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ShapeTypeAttribute_ID") %>' Visible=False>
										</asp:Label>
										<INPUT type="text" value="<%# DataBinder.Eval(Container.DataItem, "Attribute_Name") %>" title="<%# DataBinder.Eval(Container.DataItem, "ShapeTypeAttribute_Desc") %>" onclick="alert('<%# DataBinder.Eval(Container.DataItem, "ShapeTypeAttribute_Desc") %>')" style="Height:17px; width:350px; background-color:transparent; color:#000000; border-style:none; text-align:left" >										
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderStyle-Font-Size="10pt" ItemStyle-Width="43%" HeaderStyle-Width="43%" HeaderStyle-BackColor="#000099"
									HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center"
									HeaderText="Value">
									<ItemTemplate>
										<asp:HyperLink ID="urlAttributeValue" Runat="server" Target=_blank NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value") %>'>
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
						</asp:datagrid><br>
						<h5><label>EXTERNAL INFORMATION </label><A href="artifact.aspx"><b>Artifacts</b></A></h5>
						<asp:datagrid id="grdArtifacts" Runat="server" Width="100%" OnItemDataBound="ControlItemDataBound"
							BorderWidth="1" OnDeleteCommand="ControlDeleteCommand" OnItemCommand="ControlItemCommand"
							ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center"
							HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff"
							HeaderStyle-BackColor="#000099" ShowFooter="True" FooterStyle-HorizontalAlign="Left" FooterStyle-Font-Size="10pt"
							ItemStyle-Width="15%">
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
								<asp:TemplateColumn ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%" HeaderStyle-Width="20%"
									FooterStyle-Width="20%">
									<ItemTemplate>
										<asp:HyperLink runat="server" Target="_blank" ID="urlArtifact_Location" NavigateUrl='<%# Container.DataItem("Related_Desc") %>'>
											View
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Artifact" ItemStyle-Width="65%" HeaderStyle-Width="65%" FooterStyle-Width="65%">
									<ItemTemplate>
 										<asp:Label ID="lblArtifactID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Related_ID") %>' Visible=False>
										</asp:Label>
										<asp:HyperLink runat=server NavigateUrl='<%# "artifact.aspx?id=" & ddlList.SelectedItem.Value & "&type=" & SHAPETYPE_Server & "&artifact=" &  Container.DataItem("Related_ID")%>' ID="urlArtifact">
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
									<FooterTemplate>
										<asp:DropDownList ID="ddlArtifacts" runat="server" DataTextField="Artifact_Name" DataValueField="Artifact_ID"
											Width="100%" Visible="true"></asp:DropDownList>
									</FooterTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br>
						<h5><label>CONTAINED BY </label><b>Devices</b></h5>
						<asp:datagrid id="grdContainedByDevice" Runat="server" Width="100%" OnItemDataBound="ControlItemDataBound"
							BorderWidth="1px" OnDeleteCommand="ControlDeleteCommand" OnItemCommand="ControlItemCommand"
							ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center"
							HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff"
							HeaderStyle-BackColor="#000099" ShowFooter="True" FooterStyle-HorizontalAlign="Left" FooterStyle-Font-Size="10pt">
							<Columns>
								<asp:TemplateColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Size="10pt"
									HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Center"
									FooterStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<asp:LinkButton ID="btnContainedByDeviceDelete" CommandName="Delete" Text="Delete" Runat="Server"></asp:LinkButton>
									</ItemTemplate>
									<FooterTemplate>
										<asp:LinkButton ID="btnContainedByDeviceAdd" CommandName="Insert" Text="Add" Runat="server"></asp:LinkButton>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Type" ItemStyle-Width="20%" HeaderStyle-Width="20%">
									<ItemTemplate>
										<asp:Label ID="lblContainedByDeviceShapeTypeName" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Related_TypeName")%>'>
										</asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<asp:DropDownList id="ddlContainedByDeviceShapeType" Runat="server" AutoPostBack="True" Width="100%" DataTextField="ShapeType_Name"
											DataValueField="ShapeType_ID" OnSelectedIndexChanged="DataBindDependentList"></asp:DropDownList>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Device" ItemStyle-Width="65%" HeaderStyle-Width="65%">
									<ItemTemplate>
										<asp:HyperLink ID="urlContainedByDevice" Runat=server NavigateUrl='<%# "device.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID")%>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
									<FooterTemplate>
										<asp:DropDownList id="ddlContainedByDeviceShape" Runat="server" Width="100%" DataTextField="Shape_Name"
											DataValueField="Shape_ID"></asp:DropDownList>
									</FooterTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br>
						<h5><label>CONTAINS</label><b> Devices</b></h5>
						<asp:datagrid id="grdContainDevice" Runat="server" Width="100%" OnItemDataBound="ControlItemDataBound"
							BorderWidth="1px" OnDeleteCommand="ControlDeleteCommand" OnItemCommand="ControlItemCommand"
							ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center"
							HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff"
							HeaderStyle-BackColor="#000099" ShowFooter="True" FooterStyle-HorizontalAlign="Left" FooterStyle-Font-Size="10pt">
							<Columns>
								<asp:TemplateColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Size="10pt"
									HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Center"
									FooterStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<asp:LinkButton ID="btnContainDeviceDelete" CommandName="Delete" Text="Delete" Runat="Server"></asp:LinkButton>
									</ItemTemplate>
									<FooterTemplate>
										<asp:LinkButton ID="btnContainDeviceAdd" CommandName="Insert" Text="Add" Runat="server"></asp:LinkButton>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Type" ItemStyle-Width="20%" HeaderStyle-Width="20%">
									<ItemTemplate>
										<asp:Label ID="lblContainDeviceShapeTypeName" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Related_TypeName")%>'>
										</asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<asp:DropDownList id="ddlContainDeviceShapeType" Runat="server" AutoPostBack="True" Width="100%" DataTextField="ShapeType_Name"
											DataValueField="ShapeType_ID" OnSelectedIndexChanged="DataBindDependentList"></asp:DropDownList>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Device" ItemStyle-Width="65%" HeaderStyle-Width="65%">
									<ItemTemplate>
										<asp:Label ID="lblContainDeviceID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Assoc_ID") %>' Visible=False>
										</asp:Label>
										<asp:HyperLink ID="urlContainDevice" Runat=server NavigateUrl='<%# "device.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID")%>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
									<FooterTemplate>
										<asp:DropDownList id="ddlContainDeviceShape" Runat="server" Width="100%" DataTextField="Shape_Name"
											DataValueField="Shape_ID"></asp:DropDownList>
									</FooterTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br>
						<asp:datagrid id="grdAddress" Runat="server" Width="100%" OnItemDataBound="ControlItemDataBound"
							BorderWidth="1" OnDeleteCommand="ControlDeleteCommand" OnItemCommand="ControlItemCommand"
							ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center"
							HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff"
							HeaderStyle-BackColor="#000099" ShowFooter="True" FooterStyle-HorizontalAlign="Left" FooterStyle-Font-Size="10pt"
							ItemStyle-Width="15%">
							<Columns>
								<asp:TemplateColumn ItemStyle-Width="15%" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
									HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center"
									HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<asp:LinkButton ID="btnAddressDelete" CommandName="Delete" Text="Delete" Runat="Server"></asp:LinkButton>
									</ItemTemplate>
									<FooterTemplate>
										<asp:LinkButton ID="btnAddressAdd" Commandname="Insert" Text="Add" Runat="server" Visible="True"></asp:LinkButton>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="IP Address" ItemStyle-Width="85%" FooterStyle-Width="85%">
									<ItemTemplate>
										<asp:Label ID="lblAddressID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Assoc_ID") %>' Visible=False>
										</asp:Label>
										<asp:Label ID="lblIPID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Related_ID") %>' Visible=False>
										</asp:Label>
										<asp:Label ID="lblIPName" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>'>
										</asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<asp:TextBox ID="txtIPName" Runat="server" Font-Name="Arial" Width="100%" Height="100%"></asp:TextBox>
									</FooterTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br>
						<h5><label>HOSTS </label><A href="object.aspx"><b>Objects</b></a> of <A href="sys.aspx"> <b>Systems</b> </A></h5>
						<asp:datagrid id="grdDeviceObject" Width="100%" Runat="server" BorderWidth="1px" OnItemDataBound="ControlItemDataBound"
							OnDeleteCommand="ControlDeleteCommand" OnItemCommand="ControlItemCommand" ShowFooter="True"
							FooterStyle-HorizontalAlign="Left" FooterStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left"
							ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True"
							HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
							<Columns>
								<asp:TemplateColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Size="10pt"
									HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Center"
									FooterStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<asp:LinkButton ID="btnDeviceObjectDelete" CommandName="Delete" Text="Delete" Runat="Server"></asp:LinkButton>
									</ItemTemplate>
									<FooterTemplate>
										<asp:LinkButton ID="btnDeviceObjectAdd" CommandName="Insert" Text="Add" Runat="server"></asp:LinkButton>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="System" ItemStyle-Width="29%" HeaderStyle-Width="29%">
									<ItemTemplate>
										<asp:HyperLink ID="urlDeviceObjectSystem" Runat=server NavigateUrl='<%# "sys.aspx?id=" & Container.DataItem("RelatedContainer_ID")%>'>
											<%# Container.DataItem("RelatedContainer_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
									<FooterTemplate>
										<asp:DropDownList id="ddlDeviceObjectSystem" Runat="server" AutoPostBack="True" Width="100%" DataTextField="Shape_Name"
											DataValueField="Shape_ID" OnSelectedIndexChanged="DataBindDependentList"></asp:DropDownList>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Type" ItemStyle-Width="21%" HeaderStyle-Width="21%">
									<ItemTemplate>
										<asp:Label ID="lblDeviceObjectShapeTypeName" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Related_TypeName")%>'>
										</asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<asp:DropDownList id="ddlDeviceObjectShapeType" Runat="server" AutoPostBack="True" Width="100%" DataTextField="ShapeType_Name"
											DataValueField="ShapeType_ID" OnSelectedIndexChanged="DataBindDependentList"></asp:DropDownList>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Object" ItemStyle-Width="35%" HeaderStyle-Width="35%">
									<ItemTemplate>
										<asp:Label ID="lblDeviceObjectID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Assoc_ID") %>' Visible=False>
										</asp:Label>
										<asp:HyperLink ID="urlDeviceObjectObject" Runat=server NavigateUrl='<%# "object.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID")%>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
									<FooterTemplate>
										<asp:DropDownList id="ddlDeviceObjectShape" Runat="server" Width="100%" DataTextField="Related_Name"
											DataValueField="Related_ID"></asp:DropDownList>
									</FooterTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br>
						<h5><label>RELATIONS</label> with <b>Devices</b></h5>
						<asp:datagrid id="grdRelations" Width="100%" Runat="server" BorderWidth="1" OnItemDataBound="ControlItemDataBound"
							ItemStyle-Width="15%" OnDeleteCommand="ControlDeleteCommand" OnItemCommand="ControlItemCommand"
							ShowFooter="True" FooterStyle-HorizontalAlign="Left" FooterStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left"
							ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True"
							HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
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
										<asp:Label ID="lblRelationDirection" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Assoc_Direction") %>' >
										</asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<asp:DropDownList ID="ddlRelationDirection" runat="server" Width="100%" Visible="true">
											<asp:ListItem Value="0">From</asp:ListItem>
											<asp:ListItem Value="1">To</asp:ListItem>
										</asp:DropDownList>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Type" ItemStyle-Width="20%" HeaderStyle-Width="20%">
									<ItemTemplate>
										<asp:Label ID="lblRelatedType" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Related_TypeName") %>' >
										</asp:Label>
									</ItemTemplate>
									<FooterTemplate>
										<asp:DropDownList ID="ddlRelationType" OnSelectedIndexChanged="DataBindDependentList" runat="server"
											AutoPostBack="True" DataTextField="ShapeType_Name" DataValueField="ShapeType_ID" Width="100%"
											Visible="true"></asp:DropDownList>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Device" ItemStyle-Width="30%" HeaderStyle-Width="30%">
									<ItemTemplate>
										<asp:HyperLink ID="urlRelationDeviceName" Runat=server NavigateUrl='<%# "Device.aspx?id=" & Container.DataItem("Related_ID") & "&type=" & Container.DataItem("Related_TypeID")%>'>
											<%# Container.DataItem("Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
									<FooterTemplate>
										<asp:DropDownList ID="ddlRelationDevice" runat="server" DataTextField="Shape_Name" DataValueField="Shape_ID"
											Width="100%" Visible="true"></asp:DropDownList>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Relation" ItemStyle-Wrap="True" ItemStyle-Width="25%" HeaderStyle-Width="25%">
									<ItemTemplate>
										<asp:Label ID="lblRelationID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Assoc_ID") %>' Visible=False>
										</asp:Label>
										<asp:HyperLink runat=server NavigateUrl='<%# "Relation.aspx?id=" & Container.DataItem("Principal_ID") & "&type=" & Container.DataItem("Principal_TypeID") & "&relation=" &  Container.DataItem("Assoc_ID")%>' ID="urlRelationName">
											<%# DummyLink(Container.DataItem("Assoc_Name"))%>
										</asp:HyperLink>
									</ItemTemplate>
									<FooterTemplate>
										<asp:TextBox ID="txtRelation_Name" Runat="server" Font-Name="Arial" Width="100%" Height="100%"></asp:TextBox>
									</FooterTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
