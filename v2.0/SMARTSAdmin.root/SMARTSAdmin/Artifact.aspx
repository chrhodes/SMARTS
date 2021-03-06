<%@ Page Language="vb" AutoEventWireup="false" CodeFile="Artifact.aspx.vb" Inherits="Artifact" %>
<%@ Import Namespace="SMARTSCommon.CommonClass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head  runat="server">
		<title>SMARTS Administration</title>
		<link href="MyStyles.css" type="text/css" rel="stylesheet"/>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
</head>
	
	<body id="theBody" onunload="refreshParent()" >
		<form id="theForm" method="post" runat="server">
			<table id="tblPage" cellspacing="3" cellpadding="3" width="95%" align="center">
				<tr>
					<td>
						<h4><asp:label id="lblPage" Runat="server"></asp:label></h4>
						<hr/>
						<asp:label id="lblArtifactID" Runat="server" Text='<%# Request.QueryString("artifact") %>' Visible="False">
						</asp:label><asp:label id="lblArtifactAbstraction" Runat="server" Visible="False"></asp:label></td>
				</tr>
				<tr>
					<td>
						<table width="100%">
							<tr>
								<td valign="top" align="left" width="60%">
									<h6><b>Artifacts</b> provide additional information regarding <a href="businessprocess.aspx">
											Business Processes</a>, <a href="step.aspx">Process Steps</a>, <a href="sys.aspx">
											Systems</a>, <a href="object.aspx">Objects</a>, and <a href="device.aspx">Devices</a></h6>
								</td>
								<td width="5%"></td>
								<td align="right" width="35%">
									<h6><a href="default.aspx">SMARTS Administration Home</a><br/>
										<a href="../SMARTSBROWSER/default.aspx">SMARTS Browser Home</a><br/>
										<asp:hyperlink id="urlPrevious" Runat="server"></asp:hyperlink></h6>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%">
							<tr>
								<td>
									<h5>NAME&nbsp;&nbsp;<a title="View list of existing artifacts" style="FONT-SIZE: 8pt; FONT-FAMILY: Arial" href="List.aspx?list=<%=LIST_ARTIFACTS%>" target="_blank" >
											View All Artifacts</a></h5>
									<asp:dropdownlist id="ddlList" runat="server" DataTextField="Artifact_Name" DataValueField="Artifact_ID"
										AutoPostBack="True"></asp:dropdownlist></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><asp:datagrid id="grdName" Runat="server" OnUpdateCommand="ControlUpdate" OnEditCommand="ControlEdit"
							OnCancelCommand="ControlCancel" AutoGenerateColumns="False" Width="100%" BorderWidth="1px">
							<Columns>
								<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Submit" CancelText="Cancel" EditText="Edit">
									<HeaderStyle Font-Size="10pt" Font-Bold="True" HorizontalAlign="Center" ForeColor="White" BackColor="#000099"></HeaderStyle>
									<ItemStyle Font-Size="10pt" HorizontalAlign="Center" Width="15%"></ItemStyle>
								</asp:EditCommandColumn>
								<asp:TemplateColumn HeaderText="Name" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
									ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate>
									    <asp:Label runat="server">
										<%# DataBinder.Eval(Container.DataItem, "Artifact_Name") %>
										</asp:Label>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="txtName" Runat="server" Font-Names="Arial" Width="100%" text='<%# DataBinder.Eval(Container.DataItem, "Artifact_Name") %>'>
										</asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br/>
						<asp:datagrid id="grdDescription" Runat="server" OnUpdateCommand="ControlUpdate" OnEditCommand="ControlEdit"
							AutoGenerateColumns="False" Width="100%" BorderWidth="1" Font-Names="Arial" oncancelcommand="ControlCancel">
							<Columns>
								<asp:EditCommandColumn HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Width="15%"
									HeaderStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
									HeaderStyle-HorizontalAlign="Center" ButtonType="LinkButton" EditText="Edit" UpdateText="Submit" CancelText="Cancel"></asp:EditCommandColumn>
								<asp:TemplateColumn HeaderText="Description" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
									HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<%# DataBinder.Eval(Container.DataItem, "Artifact_Desc") %>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="txtDescription" Runat="server" Font-Names="Arial" Width="100%" Height="100%" text='<%# DataBinder.Eval(Container.DataItem, "Artifact_Desc") %>' 
 TextMode="MultiLine">
										</asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br/>
						<asp:datagrid id="grdLocation" Runat="server" OnUpdateCommand="ControlUpdate" OnEditCommand="ControlEdit"
							AutoGenerateColumns="False" Width="100%" BorderWidth="1" Font-Names="Arial" oncancelcommand="ControlCancel">
							<Columns>
								<asp:EditCommandColumn HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Width="15%"
									HeaderStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
									HeaderStyle-HorizontalAlign="Center" ButtonType="LinkButton" EditText="Edit" UpdateText="Submit" CancelText="Cancel"></asp:EditCommandColumn>
								<asp:TemplateColumn HeaderText="Location" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
									HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<%# DataBinder.Eval(Container.DataItem, "Artifact_Loc") %>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="txtLocation" Runat="server" Font-Names="Arial" Width="100%" Height="100%" TextMode="MultiLine" text='<%# DataBinder.Eval(Container.DataItem, "Artifact_Loc") %>'>
										</asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br/>
						<asp:datagrid id="grdContact" Runat="server" OnUpdateCommand="ControlUpdate" OnEditCommand="ControlEdit"
							AutoGenerateColumns="False" Width="100%" BorderWidth="1" Font-Names="Arial" oncancelcommand="ControlCancel">
							<Columns>
								<asp:EditCommandColumn HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Width="15%"
									HeaderStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
									HeaderStyle-HorizontalAlign="Center" ButtonType="LinkButton" EditText="Edit" UpdateText="Submit" CancelText="Cancel"></asp:EditCommandColumn>
								<asp:TemplateColumn HeaderText="Contact" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
									HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<%# DataBinder.Eval(Container.DataItem, "Artifact_Contact") %>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="txtContact" Runat="server" Font-Names="Arial" Width="100%" Height="100%" TextMode="MultiLine" text='<%# DataBinder.Eval(Container.DataItem, "Artifact_Contact") %>'>
										</asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br/>
						<asp:datagrid id="grdNote" Runat="server" OnUpdateCommand="ControlUpdate" OnEditCommand="ControlEdit"
							AutoGenerateColumns="False" Width="100%" BorderWidth="1" Font-Names="Arial" oncancelcommand="ControlCancel">
							<Columns>
								<asp:EditCommandColumn HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Width="15%"
									HeaderStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
									HeaderStyle-HorizontalAlign="Center" ButtonType="LinkButton" EditText="Edit" UpdateText="Submit" CancelText="Cancel"></asp:EditCommandColumn>
								<asp:TemplateColumn HeaderText="Note" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
									ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<%# DataBinder.Eval(Container.DataItem, "Artifact_Note") %>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="txtNote" Runat="server" Font-Names="Arial" Width="100%" Height="100%" TextMode="MultiLine" text='<%# DataBinder.Eval(Container.DataItem, "Artifact_Note") %>'>
										</asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br/>
					</td>
				</tr>
				<tr>
					<td align="center" width="90%"><asp:button id="btnSubmit" onclick="DeleteArtifact" Runat="server" text="Delete"></asp:button></td>
				</tr>
			</table>
		</form>
	</body>
</html>
