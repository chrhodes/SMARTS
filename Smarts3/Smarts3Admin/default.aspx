<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Smarts3Admin._default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"  runat="server">
		<title>SMARTS Administration</title>
		<link href="Styles/Site.css" type="text/css" rel="stylesheet"/>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
</head>

	<body id="theBody">
		<form id="theForm" method="post" runat="server">
			<table width="100%" align="center">
				<tr>
					<td>
						<h4><label id="lblTitle">SMARTS&nbsp;Administration</label></h4>
						<hr/>
					</td>
				</tr>
				<tr>
					<td align="right">
						<h6><a href="../Smarts3Browser/default.aspx">SMARTS Browser Home</a></h6>
							<table id="Table3" cellspacing="1" cellpadding="10" width="90%" align="center" border="1">
								<tr>
									<td valign="top" width="50%">
										<table width="100%">
											<tr>
												<td style="HEIGHT: 57px" colspan="2">
													<p align="center"><b><font size="4">CONTENT&nbsp;MANAGEMENT</font> </b><font color="dimgray">
															<font size="2"><em>
																		<br/>
																		Manages data information&nbsp;of an
																		<br/>
																		artifact or a&nbsp;shape and its&nbsp;associations.</em></font></font></p>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<hr/>
													<b>Business Process Level</b>
												</td>
											</tr>
											<tr>
												<td width="10%">&nbsp;</td>
												<td width="90%"><a title="Shapes in the Business Process level contain Process Steps, have Attributes and Artifacts, and relate to other Business Processes." href="businessprocess.aspx"><b><font size="3">Business 
																Process</font></b></a><br/>
													<a title="Shapes in the Process Steps level are contained by a Business Process, use Objects, have Attributes and Artifacts, and contain/relate to other Process Steps." href="step.aspx"><b><font size="3">Process Step</font></b></a><br/>
													<b><font color="gray">SubStep</font></b><br/>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<hr/>
													<b>System Level</b></td>
											</tr>
											<tr>
												<td width="10%">&nbsp;</td>
												<td width="90%"><a title="Shapes in the System level contain Objects, have Attributes and Artifacts, and relate to other Systems." href="sys.aspx"><b><font size="3">System</font></b></a><br/>
													<a title="Shapes in the Object level are contained by a System, hosted by Devices, used by Process Steps, contain Functional Pieces, have Attributes and Artifacts, and relate to other Objects." href="object.aspx"><b><font size="3">Object</font></b></a><br/>
													<a><b><font color="gray">Functional Piece</font></b></a><br/>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<hr/>
													<b>Infrastructure Level</b></td>
											</tr>
											<tr>
												<td width="10%">&nbsp;</td>
												<td width="90%"><a title="Shapes in the Device level contain other Devices and IPs, host Objects, have Attributes and Artifacts, and relate to other Devices." href="device.aspx"><b><font size="3">Device</font></b></a><br/>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<hr/>
													<b>Artifact</b></td>
											</tr>
											<tr>
												<td width="10%">&nbsp;</td>
												<td width="90%"><a title="Creates a new Artifact." href="artifact.aspx?func=1"><b><font size="3">Create</font></b></a><br/>
													<a title="Updates Artifact." href="artifact.aspx?func=2"><b><font size="3">Update</font></b></a><br/>
													<a title="Deletes a Artifact." href="artifact.aspx?func=3"><b><font size="3">Delete</font></b></a><br/>
												</td>
											</tr>
										</table>
									</td>
									<td valign="top" width="50%">
										<table width="100%">
											<tr>
												<td colspan="2">
													<p align="center"><b><font size="4">SCHEMA&nbsp;MANAGEMENT<br/>
															</font><font color="dimgray"><font size="2"><em>Manages information schema
																		<br/>
																		of a shape and its&nbsp;associations.</em></font> </font></b>
													</p>
												</td>
											</tr>
											<tr>
												<td colspan="2"><hr/><b>Attribute</b></td>
											</tr>
											<tr>
												<td width="10%">&nbsp;</td>
												<td width="90%"><a title="Creates a new Attribute." href="attribute.aspx?func=1"><b><font size="3">Create</font></b></a><br/>
													<a title="Deletes a Attribute." href="attribute.aspx?func=3"><b><font size="3">Delete</font></b></a><br/><br/>
												</td>
											</tr>
											<tr>
												<td colspan="2"><hr/><b>ShapeTypeAttribute</b></td>
											</tr>
											<tr>
												<td width="10%">&nbsp;</td>
												<td width="90%"><a title="Creates a new ShapeTypeAttribute." href="ShapeTypeAttribute.aspx?func=1"><b><font size="3">Create</font></b></a><br/>
													<a title="Updates a ShapeTypeAttribute." href="ShapeTypeAttribute.aspx?func=2"><b><font size="3">
																Update</font></b></a><br/>
													<a title="Deletes a ShapeTypeAttribute." href="ShapeTypeAttribute.aspx?func=3"><b><font size="3">
																Delete</font></b></a><br/>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

