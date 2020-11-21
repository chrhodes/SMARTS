<%@ Page Language="vb" AutoEventWireup="false" Inherits="SmartsAdmin.ChangeContainer" Codebehind="ChangeContainer.aspx.vb" %>

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
			<table id="tblPage" cellspacing="3" cellpadding="3" width="95%" align="center">
				<tr>
					<td>
						<h4><label>Change Container</label></h4>
						<hr/>
						<asp:label id="lblRelationID" Text='<%# Request.QueryString("relation") %>' Visible="False" Runat="server">
						</asp:label><asp:label id="lblRelationAbstraction" Visible="False" Runat="server"></asp:label></td>
				</tr>
				<tr>
					<td align="right">
						<h6><a href="default.aspx">SMARTS Administration Home</a><br/>
							<a href="../SMARTSBROWSER/default.aspx">SMARTS Browser Home</a><br/>
						</h6>
					</td>
				</tr>
				<tr>
					<td><asp:datagrid id="grdName" Runat="server" AutoGenerateColumns="False" HeaderStyle-HorizontalAlign="Center"
							HeaderStyle-Font-Bold="True" ItemStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Center"
							HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099" HeaderStyle-Font-Size="10pt"
							Width="100%" BorderWidth="1px">
							<Columns>
								<asp:TemplateColumn HeaderText="Name" HeaderStyle-Width="40%" ItemStyle-Width="40%">
									<ItemTemplate>
										<asp:HyperLink runat="server" ID="urlName">
											<%# Container.DataItem("Principal_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn HeaderText="ShapeType" HeaderStyle-Width="30%" ItemStyle-Width="30%" DataField="Principal_TypeName"></asp:BoundColumn>
								<asp:TemplateColumn HeaderStyle-Width="40%" HeaderText="Current Container" ItemStyle-Width="40%">
									<ItemTemplate>
										<asp:Label ID="lblRelatedID" Runat="server" text='<%# DataBinder.Eval(Container.DataItem, "Related_ID")%>' Visible="False">
										</asp:Label>
										<asp:Label ID="lblRelatedName" Runat="server" text='<%# DataBinder.Eval(Container.DataItem, "Related_Name") %>'>
										</asp:Label>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn Visible="False">
									<ItemTemplate>
										<asp:Label ID="lblAbstractionID" Runat="server" text='<%# DataBinder.Eval(Container.DataItem, "Principal_AbstractionID") %>'>
										</asp:Label>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid></td>
				</tr>
				<tr>
					<td><br/>
						<br/>
						<h5><label>Change To:</label></h5>
						<asp:dropdownlist id="ddlContainerList" Runat="server" Width="100%" DataTextField="Shape_Name" DataValueField="Shape_ID"
							AutoPostBack="True"></asp:dropdownlist></td>
				</tr>
				<tr>
					<td align="center" colspan="3"><asp:button id="btnSubmit" runat="server" Text="Submit"></asp:button></td>
				</tr>
			</table>
		</form>
	</body>
</html>
