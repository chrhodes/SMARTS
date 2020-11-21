<%@ Page Language="vb" AutoEventWireup="false" Inherits="SmartsAdmin.Relation" Codebehind="Relation.aspx.vb" %>
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
						<h4><label>Relation</label></h4>
						<hr/>
						<asp:label id="lblRelationID" Runat="server" Visible="False" Text='<%# Request.QueryString("relation") %>'>
						</asp:label><asp:label id="lblRelationAbstraction" Runat="server" Visible="False"></asp:label></td>
				</tr>
				<tr>
					<td align="right">
						<h6><a href="default.aspx">SMARTS Administration Home</a><br/>
							<a href="../SMARTSBROWSER/default.aspx">SMARTS Browser Home</a><br/>
							<a href="../SMARTSBROWSER/relation.aspx?id=<%=Request.QueryString("id")%>&type=<%=Request.QueryString("type")%>&relation=<%=Request.QueryString("relation")%>">Browse To This Relation</a><br/>																											
						</h6>
					</td>
				</tr>
				<tr>
					<td>
						<asp:datagrid id="grdName" Runat="server" OnEditCommand="ControlEdit" BorderWidth="1px" Width="100%"
							AutoGenerateColumns="False" OnCancelCommand="ControlCancel" OnUpdateCommand="ControlUpdate">
							<Columns>
								<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Submit" CancelText="Cancel" EditText="Edit">
									<HeaderStyle Font-Size="10pt" Font-Bold="True" HorizontalAlign="Center" ForeColor="White" BackColor="#000099"></HeaderStyle>
									<ItemStyle Font-Size="10pt" HorizontalAlign="Center" Width="15%"></ItemStyle>
								</asp:EditCommandColumn>
								<asp:TemplateColumn HeaderText="Name" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
									ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "Assoc_Name") %>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="txtName" Runat="server" Font-Names="Arial" Width="100%" text='<%# DataBinder.Eval(Container.DataItem, "Assoc_Name") %>'></asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid>
						<asp:datagrid id="grdDescription" Runat="server" OnEditCommand="ControlEdit" BorderWidth="1" Width="100%"
							AutoGenerateColumns="False" OnUpdateCommand="ControlUpdate"	oncancelcommand="ControlCancel" Font-Names="Arial">
							<Columns>
								<asp:EditCommandColumn HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Width="15%"
									HeaderStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
									HeaderStyle-HorizontalAlign="Center" ButtonType="LinkButton" EditText="Edit" UpdateText="Submit" CancelText="Cancel"></asp:EditCommandColumn>
								<asp:TemplateColumn HeaderText="Description" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
									HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<asp:Label id="lblDescription" Runat="server" text='<%# DataBinder.Eval(Container.DataItem, "Assoc_Desc") %>'>
										</asp:Label>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="txtDescription" Runat="server" Font-Names="Arial" Width="100%" Height="100%"
											TextMode="MultiLine" text='<%# DataBinder.Eval(Container.DataItem, "Assoc_Desc") %>'></asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br/>
						<h5><label>DIRECTION</label></h5>
							<asp:datagrid id="grdRelations" Runat="server" OnEditCommand="ControlUpdate" ItemStyle-HorizontalAlign="Left"
							ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True"
							HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099"
							BorderWidth="1" Width="100%">
							<Columns>
								<asp:EditCommandColumn ButtonType="LinkButton" EditText="Switch Direction">
									<HeaderStyle Font-Size="10pt" Font-Bold="True" HorizontalAlign="Center" ForeColor="White" BackColor="#000099"></HeaderStyle>
									<ItemStyle Font-Size="10pt" HorizontalAlign="Center" Width="15%"></ItemStyle>
								</asp:EditCommandColumn>
								<asp:TemplateColumn>
									<ItemTemplate>
										<asp:label id="lblRelationPrincipalID" Runat="server" Visible="False" Text='<%# Container.DataItem("Principal_ID")%>'></asp:label>
										<asp:HyperLink Runat="server" ID="urlRelationPrincipal" >
											<%# Container.DataItem("Principal_Name")%> 								
										</asp:HyperLink>
										(<%# Container.DataItem("Principal_TypeName")%>) 
										<asp:HyperLink Runat="server" ID="urlRelationPrincipalContainer">
										<%# Container.DataItem("PrincipalContainer_Name")%>
										</asp:HyperLink>
										<b> <%# Container.DataItem("Assoc_Direction")%> </b>
										<asp:HyperLink Runat="server" ID="urlRelationRelated">
											<%# Container.DataItem("Related_Name")%> 								
										</asp:HyperLink>
										(<%# Container.DataItem("Related_TypeName")%>) 
										<asp:HyperLink Runat="server" ID="urlRelationRelatedContainer">
										<%# Container.DataItem("RelatedContainer_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br/>
						<h5><label>ATTRIBUTES</label></h5>
						<asp:datagrid id="grdAttribute" Runat="server" OnEditCommand="ControlEdit" BorderWidth="1" Width="100%"
							OnItemDataBound="ControlItemDataBound" AutoGenerateColumns="False" OnCancelCommand="ControlCancel"
							OnUpdateCommand="ControlUpdate">
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
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
