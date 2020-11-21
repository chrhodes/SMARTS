﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sys.aspx.cs" Inherits="Smarts3Admin.Sys" %>

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
                        System</label></h4>
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td align="left" valign="top" width="60%">
                            <h6>
                                Shapes in the <b>System</b> level contain <a href="object.aspx">Objects</a>, have
                                <b>Attributes</b> and <a href="artifact.aspx">Artifacts</a>, and relate to other
                                <b>Systems</b>.</h6>
                        </td>
                        <td width="5%">
                        </td>
                        <td align="right" width="35%">
                            <h6>
                                <a href="default.aspx">SMARTS3 Administration Home</a><br />
                                <a href="../Smarts3Browser/default.aspx">SMARTS3 Browser Home</a><br />
                                <asp:HyperLink ID="urlBrowseThis" runat="server">Browse to this System</asp:HyperLink><br />
                                <asp:HyperLink ID="urlHistory" runat="server">View History</asp:HyperLink><br />
                            </h6>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <h5>
                    NAME&nbsp;&nbsp;<a title="View list of existing systems" style="font-size: 8pt; font-family: Arial"
                        href="List.aspx?list=<%=LIST_SYSTEMS%>" target="_blank"> View All Systems</a></h5>
                <asp:DropDownList ID="ddlList" runat="server" DataTextField="Shape_Name" DataValueField="Shape_ID"
                    AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMessage" Visible="False" Font-Bold="True" runat="server" ForeColor="red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataGrid ID="grdName" runat="server" AutoGenerateColumns="False" OnCancelCommand="ControlCancel"
                    OnEditCommand="ControlEdit" OnUpdateCommand="ControlUpdate" OnItemDataBound="ControlItemDataBound"
                    BorderWidth="1px" Width="100%">
                    <Columns>
                        <asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Submit" CancelText="Cancel"
                            EditText="Edit">
                            <HeaderStyle Font-Size="10pt" Font-Bold="True" HorizontalAlign="Left" ForeColor="White"
                                BackColor="#000099"></HeaderStyle>
                            <ItemStyle Font-Size="10pt" HorizontalAlign="Left" Width="15%"></ItemStyle>
                        </asp:EditCommandColumn>
                        <asp:TemplateColumn HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099"
                            HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
                            HeaderStyle-HorizontalAlign="Left" HeaderText="Name">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "Shape_Name") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Font-Names="Arial" Width="100%" Text='<%# DataBinder.Eval(Container.DataItem, "Shape_Name") %>'></asp:TextBox>
                            </EditItemTemplate>
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
                <asp:DataGrid ID="grdAttribute" runat="server" AutoGenerateColumns="False" OnCancelCommand="ControlCancel"
                    OnEditCommand="ControlEdit" OnUpdateCommand="ControlUpdate" OnItemDataBound="ControlItemDataBound"
                    BorderWidth="1" Width="100%">
                    <Columns>
                        <asp:EditCommandColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderStyle-Font-Size="10pt"
                            HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff" ItemStyle-HorizontalAlign="Left"
                            ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Left"
                            ButtonType="LinkButton" EditText="Edit" UpdateText="Submit" CancelText="Cancel">
                        </asp:EditCommandColumn>
                        <asp:TemplateColumn HeaderStyle-Font-Size="10pt" HeaderStyle-Width="42%" HeaderStyle-BackColor="#000099"
                            HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
                            HeaderStyle-HorizontalAlign="Left" HeaderText="Attribute">
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
                        <asp:TemplateColumn HeaderStyle-Font-Size="10pt" HeaderStyle-Width="43%" HeaderStyle-BackColor="#000099"
                            HeaderStyle-ForeColor="#ffffff" ItemStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
                            HeaderStyle-HorizontalAlign="Left" HeaderText="Value">
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
                <%--<h5>
                    <label>
                        EXTERNAL INFORMATION
                    </label>
                    <a href="artifact.aspx"><b>Artifacts</b></a></h5>
                <asp:DataGrid ID="grdArtifacts" runat="server" OnItemDataBound="ControlItemDataBound"
                    BorderWidth="1" Width="100%" HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
                    AutoGenerateColumns="False" HeaderStyle-Font-Size="10pt" HeaderStyle-Font-Bold="True"
                    HeaderStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt" ItemStyle-HorizontalAlign="Left"
                    ItemStyle-Width="15%" OnDeleteCommand="ControlDeleteCommand" OnItemCommand="ControlItemCommand"
                    ShowFooter="True" FooterStyle-HorizontalAlign="Left" FooterStyle-Font-Size="10pt">
                    <Columns>
                        <asp:TemplateColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-Font-Size="10pt"
                            HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="#000099" HeaderStyle-ForeColor="#ffffff"
                            ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="True"
                            HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnArtifactDelete" CommandName="Delete" Text="Delete" runat="Server"></asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="btnArtifactAdd" CommandName="Insert" Text="Add" runat="server"
                                    Visible="True"></asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="20%" FooterStyle-Width="20%">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" Target="_blank" ID="urlArtifacT_Location" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Related_Desc") %>'>
											View
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Artifact" ItemStyle-Width="65%" HeaderStyle-Width="65%"
                            FooterStyle-Width="65%">
                            <ItemTemplate>
                                <asp:Label ID="lblArtifactID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Related_ID") %>'
                                    Visible="False">
                                </asp:Label>
                                <asp:HyperLink runat="server" NavigateUrl='<%# "artifact.aspx?id=" + ddlList.SelectedItem.Value + "&type=" +  Common.SHAPETYPE_SYSTEM + "&artifact=" +  DataBinder.Eval(Container.DataItem, "Related_ID")%>'
                                    ID="urlArtifact">
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlArtifacts" runat="server" DataTextField="Artifact_Name"
                                    DataValueField="Artifact_ID" Width="100%" Visible="true">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid><br />--%>
                <h5>
                    <label>
                        CONTAINS
                    </label>
                    <a href="object.aspx"><b>Objects</b></a><label>
                        of Systems</label></h5>
                <asp:DataGrid ID="grdObjects" runat="server" BorderWidth="1" Width="100%" HeaderStyle-BackColor="#000099"
                    HeaderStyle-ForeColor="#ffffff" AutoGenerateColumns="False" HeaderStyle-Font-Size="10pt"
                    HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt"
                    ItemStyle-HorizontalAlign="Left">
                    <Columns>
                        <asp:BoundColumn ItemStyle-Width="15%" HeaderStyle-Width="15%" HeaderText="Type"
                            DataField="Related_TypeName"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="Object" ItemStyle-Width="35%" HeaderStyle-Width="35%">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlObject" runat="server" NavigateUrl='<%# "object.aspx?id=" + DataBinder.Eval(Container.DataItem, "Related_ID") + "&type=" + DataBinder.Eval(Container.DataItem, "Related_TypeID")%>'>
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn HeaderText="Description" ItemStyle-Width="50%" HeaderStyle-Width="50%"
                            DataField="Related_Desc"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid><br />
                <h5>
                    <label>
                        RELATIONS with Systems</label></h5>
                <asp:DataGrid ID="grdRelations" runat="server" BorderWidth="1" Width="100%" HeaderStyle-BackColor="#000099"
                    HeaderStyle-ForeColor="#ffffff" AutoGenerateColumns="False" HeaderStyle-Font-Size="10pt"
                    HeaderStyle-Font-Bold="True" HeaderStyle-HorizontalAlign="Left" ItemStyle-Font-Size="10pt"
                    ItemStyle-HorizontalAlign="Left">
                    <Columns>
                        <asp:TemplateColumn HeaderText="System" ItemStyle-Width="15%" HeaderStyle-Width="15%">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlRelationPrincipal" runat="server" NavigateUrl='<%# "sys.aspx?id=" + DataBinder.Eval(Container.DataItem, "Principal_ID") + "&type=" + DataBinder.Eval(Container.DataItem, "Principal_TypeID") %>'>
											<%# DataBinder.Eval(Container.DataItem, "Principal_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn ItemStyle-Width="35%" HeaderText="Description" DataField="Principal_Desc">
                        </asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="System" ItemStyle-Width="15%" HeaderStyle-Width="15%">
                            <ItemTemplate>
                                <asp:HyperLink ID="urlRelationRelated" runat="server" NavigateUrl='<%# "sys.aspx?id=" + DataBinder.Eval(Container.DataItem, "Related_ID")& "&type=" + DataBinder.Eval(Container.DataItem, "Related_TypeID") %>'>
											<%# DataBinder.Eval(Container.DataItem, "Related_Name")%>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn ItemStyle-Width="35%" HeaderText="Description" DataField="Related_Desc">
                        </asp:BoundColumn>
                    </Columns>
                </asp:DataGrid><br />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
