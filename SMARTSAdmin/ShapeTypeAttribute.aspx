<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ShapeTypeAttribute.aspx.vb" Inherits="SMARTSAdmin.ShapeTypeAttribute" %>
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
	<body id="theBody" MS_POSITIONING="GridLayout">
		<form id="theForm" method="post" runat="server">
			<table id="tblObjects" cellSpacing="3" cellPadding="3" width="95%" align="center">
				<tr>
					<td colSpan="3">
						<h4><asp:label id="lblTitle" Runat="server"></asp:label></h4>
						<hr>
					</td>
				</tr>
				<tr>
					<td align="right" colSpan="3">
						<h6><A href="default.aspx">SMARTS Administration Home</A><br>
							<A href="../SMARTSBROWSER/default.aspx">SMARTS Browser Home</A></h6>
					</td>
				</tr>
				<tr>
					<td>
						<h5>Name</h5>
						<asp:dropdownlist id="ddlList" runat="server" AutoPostBack="True"></asp:dropdownlist>
						<br><br>
						<asp:button ID="btnSubmit" OnClick="DBValidate" Runat="server"></asp:button>

					</td>
				</tr>
				<tr>
					<td>
						<asp:CheckBoxList id="cblTypes" runat="server" RepeatColumns="3" Width="100%" BorderWidth="1" Font-Name="Arial" Font-Size="9pt" DataValueField="ShapeType_ID" DataTextField="ShapeType_Name" AutoPostBack="True">
						</asp:CheckBoxList>
						<br>
					</td>
				</tr>
				<tr>
					<td align=left>
						<asp:datalist WIDTH="100%" id="dlShapeTypeExist" Runat="server" RepeatColumns="3" RepeatDirection="Vertical"
							RepeatLayout="Table" ShowHeader="True" HeaderStyle-Font-Bold="True" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Size="10pt"
							ItemStyle-Height="20px" ItemStyle-HorizontalAlign="Left" 
							HeaderStyle-Font-Underline="True">
							<HeaderTemplate>
								ShapeTypes already included:
							</HeaderTemplate>
							<ItemTemplate>
								<%#Container.DataItem("ShapeType_Name")%>
							</ItemTemplate>
						</asp:datalist></td>
				</tr>
				<tr>
					<td>
						<asp:datagrid id="grdDescription" Runat="server" Width="100%" BorderWidth="1" OnItemDataBound="ControlItemDataBound"
							OnUpdateCommand="ControlUpdate" OnEditCommand="ControlEdit" AutoGenerateColumns="False" Font-Name="Arial"
							oncancelcommand="ControlCancel">
							<Columns>
								<asp:EditCommandColumn HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Width="15%"
									HeaderStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
									HeaderStyle-HorizontalAlign="Center" ButtonType="LinkButton" EditText="Edit" UpdateText="Submit" CancelText="Cancel"></asp:EditCommandColumn>
								<asp:TemplateColumn HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
									ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center" HeaderText="Description">
									<ItemTemplate>
										<asp:Label id="lblDescription" Runat="server" text='<%# DataBinder.Eval(Container.DataItem, "ShapeTypeAttribute_Desc") %>'>
										</asp:Label>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="txtDescription" Runat="server" Font-Name="Arial" Width="100%" Height="100%"
											TextMode="MultiLine"></asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid>
						<br>
						<asp:datagrid id="grdConstrainedValues" Runat="server" Width="100%" AutoGenerateColumns="False"
							OnCancelCommand="ControlCancel" OnEditCommand="ControlEdit" OnUpdateCommand="ControlUpdate"
							OnItemDataBound="ControlItemDataBound" BorderWidth="1px">
							<Columns>
								<asp:EditCommandColumn HeaderStyle-Width="10%" ButtonType="LinkButton" UpdateText="Submit" CancelText="Cancel"
									EditText="Edit">
									<HeaderStyle Font-Size="10pt" Font-Bold="True" ForeColor="White" BackColor="#000099"></HeaderStyle>
									<ItemStyle Font-Size="10pt" HorizontalAlign="Center" Width="15%"></ItemStyle>
								</asp:EditCommandColumn>
								<asp:TemplateColumn HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
									ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Center" HeaderText="Constrained Values">
									<ItemTemplate>
										<asp:Label id="lblConstrainedValues" Runat="server" text='<%# DataBinder.Eval(Container.DataItem, "ConstrainedValue_Values") %>'>
										</asp:Label>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="txtConstrainedValues" Runat="server" Font-Name="Arial" Width="100%" ></asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid>
						<br>
						<asp:datagrid id="grdDependents" Runat="server" width="100%" HeaderStyle-Font-Bold="True" ItemStyle-Font-Size="10pt"
							HeaderStyle-Font-Size="10pt" HorizontalAlign="Center" AutoGenerateColumns="False" HeaderStyle-ForeColor="#ffffff"
							HeaderStyle-BackColor="#000099" ItemStyle-Width="15%">
							<Columns>
								<asp:BoundColumn HeaderText="Dependents" HeaderStyle-Width="20%" DataField="Shape_Name"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="Type" HeaderStyle-Width="10%" DataField="ShapeType_Name"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="Description" HeaderStyle-Width="50%" DataField="Shape_Desc"></asp:BoundColumn>
								<asp:BoundColumn HeaderText="Value" HeaderStyle-Width="20%" DataField="AttributeValue_Value"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></td>
				</tr>
				<tr>
					<td>
						<asp:Label ID="lblLog" Runat="server" Visible="False" Font-Name="arial" Font-Size="10pt" Font-Bold="True">Comment:</asp:Label>
						<asp:RequiredFieldValidator ID="rfvLog" ControlToValidate="txtLog" ErrorMessage="A comment must be entered"
							Runat="server"></asp:RequiredFieldValidator>
						<br>
						<asp:TextBox ID="txtLog" Runat="server" Width="100%" visible="False" TextMode="MultiLine" Font-Name="arial"
							Font-Size="10pt"></asp:TextBox>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
