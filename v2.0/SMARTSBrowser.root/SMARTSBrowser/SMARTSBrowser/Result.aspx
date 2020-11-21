<%@ Page Language="vb" AutoEventWireup="false" CodeFile="Result.aspx.vb" Inherits="Result" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD Xhtml 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
		<title>SMARTS Browser</title>
		<link href="MyStyles.css" type="text/css" rel="stylesheet"/>
</head>
	<body id="thebody" >
		<form id="theForm" method="post" runat="server">
			<table style="width:95%; text-align:center">
				<tr> 
					<td>
						<table id="tblSystem" cellspacing="3" cellpadding="3" style="width:100%; text-align:center">
							<tbody>
								<tr>
									<td>
										<h4><label>Search Results</label></h4>
										<hr/>
									</td>
								</tr>
								<tr>
									<td align="right">
										<h6>
											<a href="../SMARTSADMIN/default.aspx">SMARTS Administration Home</a><br/>
											<a href="default.aspx">SMARTS Browser Home</a><br/>
										</h6>
									</td>
								</tr>
								<tr>
									<td><asp:datagrid id="grdItem" autogeneratecolumns="False" Runat="server" ItemStyle-Font-Size="10pt"
											ItemStyle-HorizontalAlign="Left" BorderWidth="1" style="width:100%" HeaderStyle-Font-Size="10pt"
											HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="center"  HeaderStyle-ForeColor="#ffffff"
											HeaderStyle-BackColor="#000099">
											<ItemStyle Font-Size="10pt" HorizontalAlign="Left"></ItemStyle>
											<HeaderStyle Font-Size="10pt" Font-Bold="True" HorizontalAlign="center" ForeColor="White" BackColor="#000099"></HeaderStyle>
											<Columns>
												<asp:BoundColumn Visible="False" DataField="Item_ID"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="Item_Abstraction"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="Item_TypeID"></asp:BoundColumn>
												<asp:BoundColumn DataField="Item_Type" HeaderText="Type" SortExpression="Item_Type">
													<HeaderStyle width="15%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="Name">
													<HeaderStyle width="30%"></HeaderStyle>
													<ItemStyle width="30%"></ItemStyle>
													<ItemTemplate>
														<asp:Hyperlink id="urlItem" Runat="server">
															<%# Container.DataItem("Item_Name")%>
														</asp:Hyperlink>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="Item_Field" HeaderText="Field" SortExpression="Item_Field">
													<HeaderStyle width="25%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="Value">
													<HeaderStyle Font-Size="10pt" Font-Bold="True" HorizontalAlign="center" ForeColor="White" width="25%"
														BackColor="#000099"></HeaderStyle>
													<ItemStyle Font-Size="10pt"></ItemStyle>
													<ItemTemplate>
														<asp:Hyperlink id="urlAttributeValue" Runat="server" Target="_blank" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Item_Value") %>'>
															<%# Container.DataItem("Item_Value")%>
														</asp:Hyperlink>
														<asp:label id="lblAttributeValue" Runat="server" text='<%# DataBinder.Eval(Container.DataItem, "Item_Value") %>'>
														</asp:label>
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
										</asp:datagrid></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
