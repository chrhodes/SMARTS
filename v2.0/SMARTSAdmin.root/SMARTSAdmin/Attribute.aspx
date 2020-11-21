<%@ Page Language="vb" AutoEventWireup="false" CodeFile="Attribute.aspx.vb" Inherits="Attribute" %>
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
			<table id="tblSystems" cellspacing="3" cellpadding="3" width="95%" align="center">
				<tr>
					<td>
						<h4><asp:label id="lblPage" Runat="server"></asp:label></h4>
						<hr/>
					</td>
				</tr>
				<tr>
					<td align="right">
						<h6><a href="default.aspx">SMARTS Administration Home</a><br/>
							<a href="../SMARTSBROWSER/default.aspx">SMARTS Browser Home</a></h6>
					</td>
				</tr>
				<tr>
					<td>
						<h5>NAME&nbsp;&nbsp;<a title="View list of existing attributes" style="FONT-SIZE: 8pt; FONT-FAMILY: Arial" href="List.aspx?list=<%=LIST_ATTRIBUTES%>" target="_blank" >
								View All Attributes</a></h5>
						<asp:dropdownlist id="ddlList" runat="server" DataTextField="Attribute_Name" DataValueField="Attribute_ID"
							AutoPostBack="True"></asp:dropdownlist></td>
				</tr>
				<tr>
					<td><asp:label id="lblMessage" Runat="server" Visible="False" ForeColor="red" Font-Bold="True">This name already exists. Please select another.</asp:label></td>
				</tr>
				<tr>
					<td><asp:datagrid id="grdName" Runat="server" AutoGenerateColumns="False" OnCancelCommand="ControlCancel"
							OnEditCommand="ControlEdit" OnUpdateCommand="ControlUpdate" BorderWidth="1px" Width="100%">
							<Columns>
								<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Submit" CancelText="Cancel" EditText="Edit">
									<HeaderStyle Font-Size="10pt" Font-Bold="True" HorizontalAlign="Center" ForeColor="White" BackColor="#000099"></HeaderStyle>
									<ItemStyle Font-Size="10pt" HorizontalAlign="Center" Width="15%"></ItemStyle>
								</asp:EditCommandColumn>
								<asp:TemplateColumn HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
									ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center" HeaderText="Name">
									<ItemTemplate>
										<%# DataBinder.Eval(Container.DataItem, "Attribute_Name") %>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="txtName" Runat="server" Font-Names="Arial" Width="100%" Text='<%# DataBinder.Eval(Container.DataItem, "Attribute_Name") %>'>
										</asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br/>
						<asp:datagrid id="grdDependents" Runat="server" AutoGenerateColumns="False" BorderWidth="1px"
							Width="100%">
							<Columns>
								<asp:BoundColumn HeaderText="ShapeType" HeaderStyle-HorizontalAlign="LEFT" ItemStyle-HorizontalAlign="LEFT"
									DataField="ShapeType_Name">
									<HeaderStyle Font-Size="10pt" Font-Bold="True" HorizontalAlign="left" ForeColor="White" BackColor="#000099"></HeaderStyle>
									<ItemStyle Font-Size="10pt" HorizontalAlign="left" Width="15%"></ItemStyle>
								</asp:BoundColumn>
							</Columns>
						</asp:datagrid><br/>
					</td>
				</tr>
				<tr>
					<td><asp:label id="lblLog" Runat="server" Visible="False" Font-Bold="True" Font-Size="10pt" Font-Names="arial">Comment:</asp:label><asp:textbox id="txtLog" Runat="server" Width="100%" Font-Size="10pt" Font-Names="arial" TextMode="MultiLine"
							visible="False"></asp:textbox></td>
				</tr>
				<tr>
					<td align="center" width="90%"><br/>
						<asp:button id="btnSubmit" onclick="DeleteItem" Runat="server" text="Delete"></asp:button></td>
				</tr>
			</table>
		</form>
	</body>
</html>
