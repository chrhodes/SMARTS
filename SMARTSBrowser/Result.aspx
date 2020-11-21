<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Result.aspx.vb" Inherits="SMARTSBROWSER.Result" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SMARTS Browser</title>
		<LINK href="MyStyles.css" type="text/css" rel="stylesheet">
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body ID="theBody" MS_POSITIONING="GridLayout">
		<form id="theForm" method="post" runat="server">
			<table width="95%" align="center">
				<tr> 
					<td>
						<table id="tblSystem" cellSpacing="3" cellPadding="3" width="100%" align="center">
							<TBODY>
								<tr>
									<td>
										<h4><label>Search Results</label></h4>
										<hr>
									</td>
								</tr>
								<tr>
									<td align="right">
										<h6>
											<A href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</A><br>
											<A href="default.aspx">SMARTS Browser Home</A><br>
										</h6>
									</td>
								</tr>
								<tr>
									<td><asp:datagrid id="grdItem" autogeneratecolumns="False" Runat="server" ItemStyle-Font-Size="10pt"
											ItemStyle-HorizontalAlign="Left" BorderWidth="1" Width="100%" HeaderStyle-Font-Size="10pt"
											HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="#ffffff"
											HeaderStyle-BackColor="#000099">
											<ItemStyle Font-Size="10pt" HorizontalAlign="Left"></ItemStyle>
											<HeaderStyle Font-Size="10pt" Font-Bold="True" HorizontalAlign="Center" ForeColor="White" BackColor="#000099"></HeaderStyle>
											<Columns>
												<asp:BoundColumn Visible="False" DataField="Item_ID"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="Item_Abstraction"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="Item_TypeID"></asp:BoundColumn>
												<asp:BoundColumn DataField="Item_Type" HeaderText="Type" SortExpression="Item_Type">
													<HeaderStyle Width="15%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="Name">
													<HeaderStyle Width="30%"></HeaderStyle>
													<ItemStyle Width="30%"></ItemStyle>
													<ItemTemplate>
														<asp:HyperLink ID="urlItem" Runat="server">
															<%# Container.DataItem("Item_Name")%>
														</asp:HyperLink>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="Item_Field" HeaderText="Field" SortExpression="Item_Field">
													<HeaderStyle Width="25%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="Value">
													<HeaderStyle Font-Size="10pt" Font-Bold="True" HorizontalAlign="Center" ForeColor="White" Width="25%"
														BackColor="#000099"></HeaderStyle>
													<ItemStyle Font-Size="10pt"></ItemStyle>
													<ItemTemplate>
														<asp:HyperLink ID="urlAttributeValue" Runat="server" Target=_blank NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Item_Value") %>'>
															<%# Container.DataItem("Item_Value")%>
														</asp:HyperLink>
														<asp:Label id="lblAttributeValue" Runat="server" text='<%# DataBinder.Eval(Container.DataItem, "Item_Value") %>'>
														</asp:Label>
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
										</asp:datagrid></td>
								</tr>
							</TBODY>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
