<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Device.aspx.cs" Inherits="Smarts3Admin.Device" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMARTS3 Administration</title>
    <link href="Styles/Site.css" type="text/css" rel="stylesheet" />
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
</head>
<body id="theBody">
    <form id="theForm" method="post" runat="server">
    <table id="tblSystems" cellspacing="3" cellpadding="3" width="95%" align="center">
        <tr>
            <td>
                <h4>
                    <label>
                        Device</label></h4>
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td align="left" valign="top" width="60%">
                            <h6>
                                Shapes in the <b>Device</b> level contain other <b>Devices</b> and <b>IPs</b>, host
                                <a href="object.aspx">Objects</a>, have <b>Attributes</b> and <a href="artifact.aspx">
                                    Artifacts</a>, and relate to other <b>Devices</b>.</h6>
                        </td>
                        <td width="5%">
                        </td>
                        <td align="right" width="35%">
                            <h6>
                                <a href="default.aspx">SMARTS3 Administration Home</a><br />
                                <a href="../Smarts3Browser/default.aspx">SMARTS3 Browser Home</a><br />
                                <asp:HyperLink ID="urlBrowseThis" runat="server">Browse to this Device</asp:HyperLink><br />
                                <asp:HyperLink ID="urlHistory" runat="server">View History</asp:HyperLink><br />
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
                        <td width="33%">
                            <font style="font-weight: bold; font-family: Arial" size="2">TYPE &nbsp;&nbsp;</font>
                        </td>
                        <td width="67%">
                            <font style="font-weight: bold; font-family: Arial" size="2">NAME &nbsp;&nbsp;<a
                                title="View list of existing objects" style="font-size: 8pt; font-family: Arial"
                                href="List.aspx?list=<%=LIST_DEVICES%>" target="_blank"> View All Devices</a></font>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="ddlIP" runat="server" Visible="False" DataTextField="Shape_Name"
                                DataValueField="Shape_ID" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlTypeList" DataTextField="ShapeType_Name" DataValueField="ShapeType_ID"
                                AutoPostBack="True" runat="server" Width="100%">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlList" DataTextField="Shape_Name" DataValueField="Shape_ID"
                                AutoPostBack="True" runat="server" Width="100%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMessage" Visible="False" runat="server" ForeColor="#ff3366" Font-Bold="True"></asp:Label><br />
                <asp:DataGrid ID="grdName" Width="100%" runat="server" AutoGenerateColumns="False"
                    BorderWidth="1px" OnCancelCommand="ControlCancel" OnEditCommand="ControlEdit"
                    OnUpdateCommand="ControlUpdate" OnItemDataBound="ControlItemDataBound" HeaderStyle-Font-Size="10pt"
                    HeaderStyle-HorizontalAlign="Left" HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
                    ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True">
                    <Columns>
                        <asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Submit" CancelText="Cancel"
                            EditText="Edit" HeaderStyle-Width="15%" ItemStyle-Width="15%"></asp:EditCommandColumn>
                        <asp:TemplateColumn HeaderText="Name" HeaderStyle-Width="60%" ItemStyle-Width="60%">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "Shape_Name") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Font-Names="Arial" Width="100%" Text='<%# DataBinder.Eval(Container.DataItem, "Shape_Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="ShapeType" HeaderStyle-Width="25%" ItemStyle-Width="25%">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "ShapeType_Name") %></ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
                <asp:DataGrid ID="grdDescription" Width="100%" runat="server" AutoGenerateColumns="False"
                    BorderWidth="1" OnEditCommand="ControlEdit" OnUpdateCommand="ControlUpdate" OnItemDataBound="ControlItemDataBound"
                    OnCancelCommand="ControlCancel" Font-Names="Arial">
                    <Columns>
                        <asp:EditCommandColumn HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
                            ItemStyle-Width="15%" HeaderStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left"
                            ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Left"
                            ButtonType="LinkButton" EditText="Edit" UpdateText="Submit" CancelText="Cancel">
                        </asp:EditCommandColumn>
                        <asp:TemplateColumn HeaderText="Description" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
                            HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
                            HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "Shape_Desc") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDescription" runat="server" Font-Names="Arial" Width="100%" Height="100%"
                                    TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "Shape_Desc") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
                <asp:DataGrid ID="grdLifecycle" Width="100%" runat="server" AutoGenerateColumns="False"
                    BorderWidth="1" OnCancelCommand="ControlCancel" OnEditCommand="ControlEdit" OnUpdateCommand="ControlUpdate"
                    OnItemDataBound="ControlItemDataBound">
                    <Columns>
                        <asp:EditCommandColumn HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
                            HeaderStyle-ForeColor="#ffffff" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Left"
                            ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Left"
                            ButtonType="LinkButton" EditText="Edit" UpdateText="Submit" CancelText="Cancel">
                        </asp:EditCommandColumn>
                        <asp:TemplateColumn Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="lblLifecycle_ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lifecycle_ID") %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Lifecycle" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
                            HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
                            HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "Lifecycle_Name") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlLifecycle" runat="server" Width="100%" DataTextField="Lifecycle_Name"
                                    DataValueField="Lifecycle_ID">
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid><br />
                <h5>
                    <label>
                        ATTRIBUTES</label></h5>
                <asp:DataGrid ID="grdAttribute" runat="server" Width="100%" AutoGenerateColumns="False"
                    OnCancelCommand="ControlCancel" OnEditCommand="ControlEdit" OnUpdateCommand="ControlUpdate"
                    OnItemDataBound="ControlItemDataBound" BorderWidth="1">
                    <Columns>
                        <asp:EditCommandColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderStyle-Font-Size="10pt"
                            HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Left"
                            ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Left"
                            ButtonType="LinkButton" EditText="Edit" UpdateText="Submit" CancelText="Cancel">
                        </asp:EditCommandColumn>
                        <asp:TemplateColumn HeaderStyle-Font-Size="10pt" ItemStyle-Width="42%" HeaderStyle-Width="42%"
                            HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
                            HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Left" HeaderText="Attribute">
                            <ItemTemplate>
                                <asp:Label ID="lblSTA_ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ShapeTypeAttribute_ID") %>'
                                    Visible="False">
                                </asp:Label>
                                <input type="text" value="<%# DataBinder.Eval(Container.DataItem, "Attribute_Name") %>"
                                    title="<%# DataBinder.Eval(Container.DataItem, "ShapeTypeAttribute_Desc") %>"
                                    onclick="alert('<%# DataBinder.Eval(Container.DataItem, "ShapeTypeAttribute_Desc") %>')"
                                    style="height: 17px; width: 350px; background-color: transparent; color: #000000;
                                    border-style: none; text-align: left">
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderStyle-Font-Size="10pt" ItemStyle-Width="43%" HeaderStyle-Width="43%"
                            HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt"
                            HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Left" HeaderText="Value">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlAttributeValue" runat="server" Target="_blank" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value") %>'>
											<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value")%>
                                </asp:HyperLink>
                                <asp:Label ID="lblAttributeValue" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlAttributeValue" runat="server" Width="100%">
                                </asp:DropDownList>
                                <asp:TextBox ID="txtAttributeValue" runat="server" Width="100%" Text='<%# DataBinder.Eval(Container.DataItem, "AttributeValue_Value") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid><br />
                <%--
						<h5><label>EXTERNAL INFORMATION </label><a href="artifact.aspx"><b>Artifacts</b></a></h5>
						<asp:datagrid id="grdArtifacts" Runat="server" Width="100%" OnItemDataBound="ControlItemDataBound"
							BorderWidth="1" OnDeleteCommand="ControlDeleteCommand" OnItemCommand="ControlItemCommand"
							ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Left"
							HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt" autogeneratecolumns="False" HeaderStyle-ForeColor="#ffffff"
							HeaderStyle-BackColor="#000099" ShowFooter="True" FooterStyle-HorizontalAlign="Left" FooterStyle-Font-Size="10pt"
							ItemStyle-Width="15%">
							<Columns>
								<asp:TemplateColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Size="10pt"
									HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Left"
									FooterStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Left">
									<ItemTemplate>
										<asp:LinkButton ID="btnArtifactDelete" CommandName="Delete" Text="Delete" Runat="Server"></asp:LinkButton>
									</ItemTemplate>
									<FooterTemplate>
										<asp:LinkButton ID="btnArtifactAdd" Commandname="Insert" Text="Add" Runat="server" Visible="True"></asp:LinkButton>
									</FooterTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="20%" HeaderStyle-Width="20%"
									FooterStyle-Width="20%">
									<ItemTemplate>
										<asp:HyperLink runat="server" Target="_blank" ID="urlArtifact_Location" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Related_Desc") %>'>
											View
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="Artifact" ItemStyle-Width="65%" HeaderStyle-Width="65%" FooterStyle-Width="65%">
									<ItemTemplate>
 										<asp:Label ID="lblArtifactID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Related_ID") %>' Visible="False">
										</asp:Label>
										<asp:HyperLink Runat="server" NavigateUrl='<%# "artifact.aspx?id=" + ddlList.SelectedItem.Value + "&type=" + SHAPETYPE_SERVER + "&artifact=" +  DataBinder.Eval(Container.DataItem, "Related_ID")%>' ID="urlArtifact">
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
										</asp:HyperLink>
									</ItemTemplate>
									<FooterTemplate>
										<asp:DropDownList ID="ddlArtifacts" runat="server" DataTextField="Artifact_Name" DataValueField="Artifact_ID"
											Width="100%" Visible="true"></asp:DropDownList>
									</FooterTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid><br/>
                --%>
                <h5>
                    <label>
                        CONTAINED BY
                    </label>
                    <b>Devices</b></h5>
                <asp:DataGrid ID="grdContainedByDevice" runat="server" Width="100%" OnItemDataBound="ControlItemDataBound"
                    BorderWidth="1px" OnDeleteCommand="ControlDeleteCommand" OnItemCommand="ControlItemCommand"
                    ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Left"
                    HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt" AutoGenerateColumns="False"
                    HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099" ShowFooter="True"
                    FooterStyle-HorizontalAlign="Left" FooterStyle-Font-Size="10pt">
                    <Columns>
                        <asp:TemplateColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-Font-Size="10pt"
                            HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
                            ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="True"
                            HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnContainedByDeviceDelete" CommandName="Delete" Text="Delete"
                                    runat="Server"></asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="btnContainedByDeviceAdd" CommandName="Insert" Text="Add" runat="server"></asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Type" ItemStyle-Width="20%" HeaderStyle-Width="20%">
                            <ItemTemplate>
                                <asp:Label ID="lblContainedByDeviceShapeTypeName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Related_TypeName")%>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlContainedByDeviceShapeType" runat="server" AutoPostBack="True"
                                    Width="100%" DataTextField="ShapeType_Name" DataValueField="ShapeType_ID" OnSelectedIndexChanged="DataBindDependentList">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Device" ItemStyle-Width="65%" HeaderStyle-Width="65%">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlContainedByDevice" runat="server" NavigateUrl='<%# "device.aspx?id=" + DataBinder.Eval(Container.DataItem, "Related_ID") + "&type=" + DataBinder.Eval(Container.DataItem, "Related_TypeID")%>'>
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlContainedByDeviceShape" runat="server" Width="100%" DataTextField="Shape_Name"
                                    DataValueField="Shape_ID">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid><br />
                <h5>
                    <label>
                        CONTAINS</label><b> Devices</b></h5>
                <asp:DataGrid ID="grdContainDevice" runat="server" Width="100%" OnItemDataBound="ControlItemDataBound"
                    BorderWidth="1px" OnDeleteCommand="ControlDeleteCommand" OnItemCommand="ControlItemCommand"
                    ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Left"
                    HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt" AutoGenerateColumns="False"
                    HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099" ShowFooter="True"
                    FooterStyle-HorizontalAlign="Left" FooterStyle-Font-Size="10pt">
                    <Columns>
                        <asp:TemplateColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-Font-Size="10pt"
                            HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
                            ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="True"
                            HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnContainDeviceDelete" CommandName="Delete" Text="Delete" runat="Server"></asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="btnContainDeviceAdd" CommandName="Insert" Text="Add" runat="server"></asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Type" ItemStyle-Width="20%" HeaderStyle-Width="20%">
                            <ItemTemplate>
                                <asp:Label ID="lblContainDeviceShapeTypeName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Related_TypeName")%>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlContainDeviceShapeType" runat="server" AutoPostBack="True"
                                    Width="100%" DataTextField="ShapeType_Name" DataValueField="ShapeType_ID" OnSelectedIndexChanged="DataBindDependentList">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Device" ItemStyle-Width="65%" HeaderStyle-Width="65%">
                            <ItemTemplate>
                                <asp:Label ID="lblContainDeviceID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Assoc_ID") %>'
                                    Visible="False">
                                </asp:Label>
                                <asp:HyperLink ID="urlContainDevice" runat="server" NavigateUrl='<%# "device.aspx?id=" + DataBinder.Eval(Container.DataItem, "Related_ID") + "&type=" + DataBinder.Eval(Container.DataItem, "Related_TypeID")%>'>
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlContainDeviceShape" runat="server" Width="100%" DataTextField="Shape_Name"
                                    DataValueField="Shape_ID">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid><br />
                <asp:DataGrid ID="grdAddress" runat="server" Width="100%" OnItemDataBound="ControlItemDataBound"
                    BorderWidth="1" OnDeleteCommand="ControlDeleteCommand" OnItemCommand="ControlItemCommand"
                    ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Left"
                    HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt" AutoGenerateColumns="False"
                    HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099" ShowFooter="True"
                    FooterStyle-HorizontalAlign="Left" FooterStyle-Font-Size="10pt" ItemStyle-Width="15%">
                    <Columns>
                        <asp:TemplateColumn ItemStyle-Width="15%" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Size="10pt"
                            HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Left"
                            FooterStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnAddressDelete" CommandName="Delete" Text="Delete" runat="Server"></asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="btnAddressAdd" CommandName="Insert" Text="Add" runat="server"
                                    Visible="True"></asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="IP Address" ItemStyle-Width="85%" FooterStyle-Width="85%">
                            <ItemTemplate>
                                <asp:Label ID="lblAddressID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Assoc_ID") %>'
                                    Visible="False">
                                </asp:Label>
                                <asp:Label ID="lblIPID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Related_ID") %>'
                                    Visible="False">
                                </asp:Label>
                                <asp:Label ID="lblIPName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtIPName" runat="server" Font-Names="Arial" Width="100%" Height="100%"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid><br />
                <h5>
                    <label>
                        HOSTS
                    </label>
                    <a href="object.aspx"><b>Objects</b></a> of <a href="sys.aspx"><b>Systems</b> </a>
                </h5>
                <asp:DataGrid ID="grdDeviceObject" Width="100%" runat="server" BorderWidth="1px"
                    OnItemDataBound="ControlItemDataBound" OnDeleteCommand="ControlDeleteCommand"
                    OnItemCommand="ControlItemCommand" ShowFooter="True" FooterStyle-HorizontalAlign="Left"
                    FooterStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt"
                    HeaderStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt"
                    AutoGenerateColumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
                    <Columns>
                        <asp:TemplateColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-Font-Size="10pt"
                            HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
                            ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="True"
                            HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDeviceObjectDelete" CommandName="Delete" Text="Delete" runat="Server"></asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="btnDeviceObjectAdd" CommandName="Insert" Text="Add" runat="server"></asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="System" ItemStyle-Width="29%" HeaderStyle-Width="29%">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlDeviceObjectSystem" runat="server" NavigateUrl='<%# "sys.aspx?id=" + DataBinder.Eval(Container.DataItem, "RelatedContainer_ID")%>'>
											<%# DataBinder.Eval(Container.DataItem, "RelatedContainer_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlDeviceObjectSystem" runat="server" AutoPostBack="True" Width="100%"
                                    DataTextField="Shape_Name" DataValueField="Shape_ID" OnSelectedIndexChanged="DataBindDependentList">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Type" ItemStyle-Width="21%" HeaderStyle-Width="21%">
                            <ItemTemplate>
                                <asp:Label ID="lblDeviceObjectShapeTypeName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Related_TypeName")%>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlDeviceObjectShapeType" runat="server" AutoPostBack="True"
                                    Width="100%" DataTextField="ShapeType_Name" DataValueField="ShapeType_ID" OnSelectedIndexChanged="DataBindDependentList">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Object" ItemStyle-Width="35%" HeaderStyle-Width="35%">
                            <ItemTemplate>
                                <asp:Label ID="lblDeviceObjectID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Assoc_ID") %>'
                                    Visible="False">
                                </asp:Label>
                                <asp:HyperLink ID="urlDeviceObjectObject" runat="server" NavigateUrl='<%# "object.aspx?id=" + DataBinder.Eval(Container.DataItem, "Related_ID") + "&type=" + DataBinder.Eval(Container.DataItem, "Related_TypeID")%>'>
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlDeviceObjectShape" runat="server" Width="100%" DataTextField="Related_Name"
                                    DataValueField="Related_ID">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid><br />
                <h5>
                    <label>
                        RELATIONS</label>
                    with <b>Devices</b></h5>
                <asp:DataGrid ID="grdRelations" Width="100%" runat="server" BorderWidth="1" OnItemDataBound="ControlItemDataBound"
                    ItemStyle-Width="15%" OnDeleteCommand="ControlDeleteCommand" OnItemCommand="ControlItemCommand"
                    ShowFooter="True" FooterStyle-HorizontalAlign="Left" FooterStyle-Font-Size="10pt"
                    ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" HeaderStyle-HorizontalAlign="Left"
                    HeaderStyle-Font-Bold="True" HeaderStyle-Font-Size="10pt" AutoGenerateColumns="False"
                    HeaderStyle-ForeColor="#ffffff" HeaderStyle-BackColor="#000099">
                    <Columns>
                        <asp:TemplateColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-Font-Size="10pt"
                            HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
                            ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="True"
                            HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnRelationDelete" CommandName="Delete" Text="Delete" runat="Server"></asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="btnRelationAdd" CommandName="Insert" Text="Add" runat="server"></asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Direction" ItemStyle-Width="10%" HeaderStyle-Width="10%">
                            <ItemTemplate>
                                <asp:Label ID="lblRelationDirection" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Assoc_Direction") %>'>
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
                                <asp:Label ID="lblRelatedType" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Related_TypeName") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlRelationType" OnSelectedIndexChanged="DataBindDependentList"
                                    runat="server" AutoPostBack="True" DataTextField="ShapeType_Name" DataValueField="ShapeType_ID"
                                    Width="100%" Visible="true">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Device" ItemStyle-Width="30%" HeaderStyle-Width="30%">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlRelationDeviceName" runat="server" NavigateUrl='<%# "Device.aspx?id=" + DataBinder.Eval(Container.DataItem, "Related_ID") + "&type=" + DataBinder.Eval(Container.DataItem, "Related_TypeID")%>'>
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlRelationDevice" runat="server" DataTextField="Shape_Name"
                                    DataValueField="Shape_ID" Width="100%" Visible="true">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Relation" ItemStyle-Wrap="True" ItemStyle-Width="25%"
                            HeaderStyle-Width="25%">
                            <ItemTemplate>
                                <asp:Label ID="lblRelationID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Assoc_ID") %>'
                                    Visible="False">
                                </asp:Label>
                                <asp:HyperLink runat="server" NavigateUrl='<%# "Relation.aspx?id=" + DataBinder.Eval(Container.DataItem, "Principal_ID") + "&type=" + DataBinder.Eval(Container.DataItem, "Principal_TypeID") + "&relation=" +  DataBinder.Eval(Container.DataItem, "Assoc_ID")%>'
                                    ID="urlRelationName">
											<%# DummyLink(DataBinder.Eval(Container.DataItem, "Assoc_Name"))%>
                                </asp:HyperLink>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtRelation_Name" runat="server" Font-Names="Arial" Width="100%"
                                    Height="100%"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid><br />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
