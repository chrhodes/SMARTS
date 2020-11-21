<%@ Page Language="vb" AutoEventWireup="false" Codebehind="default.aspx.vb" Inherits="SMARTSAdmin.WebForm1" %>
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
	<body id="theBody">
		<form id="theForm" method="post" runat="server">
			<table width="100%" align="center">
				<tr>
					<td>
						<h4><label id="lblTitle">SMARTS&nbsp;Administration</label></h4>
						<hr>
					</td>
				</tr>
				<tr>
					<td align="right">
						<h6><A href="../SMARTSBROWSER/default.aspx">SMARTS Browser Home</A></h6>
						<P>
							<TABLE id="Table3" cellSpacing="1" cellPadding="10" width="90%" align="center" border="1">
								<TR>
									<TD vAlign="top" width="50%">
										<table width="100%">
											<TR>
												<TD style="HEIGHT: 57px" colSpan="2">
													<P align="center"><B><FONT size="4">CONTENT&nbsp;MANAGEMENT</FONT> </B><FONT color="dimgray">
															<FONT size="2"><STRONG><EM>
																		<BR>
																		Manages data information&nbsp;of an
																		<BR>
																		artifact or a&nbsp;shape and its&nbsp;associations.</EM></STRONG></FONT></FONT></P>
												</TD>
											</TR>
											<tr>
												<td colSpan="2">
													<hr>
													<B>Business Process Level</B>
												</td>
											</tr>
											<tr>
												<td width="10%">&nbsp;</td>
												<td width="90%"><A title="Shapes in the Business Process level contain Process Steps, have Attributes and Artifacts, and relate to other Business Processes." href="businessprocess.aspx"><B><FONT size="3">Business 
																Process</FONT></B></A><br>
													<A title="Shapes in the Process Steps level are contained by a Business Process, use Objects, have Attributes and Artifacts, and contain/relate to other Process Steps." href="step.aspx"><B><FONT size="3">Process Step</FONT></B></A><br>
													<B><FONT color="gray">SubStep</FONT></B><br>
												</td>
											</tr>
											<tr>
												<td colSpan="2">
													<hr>
													<B>System Level</B></td>
											</tr>
											<tr>
												<td width="10%">&nbsp;</td>
												<td width="90%"><A title="Shapes in the System level contain Objects, have Attributes and Artifacts, and relate to other Systems." href="sys.aspx"><B><FONT size="3">System</FONT></B></A><br>
													<A title="Shapes in the Object level are contained by a System, hosted by Devices, used by Process Steps, contain Functional Pieces, have Attributes and Artifacts, and relate to other Objects." href="object.aspx"><B><FONT size="3">Object</FONT></B></A><BR>
													<B><FONT color="gray">Functional Piece</FONT></B></A><br>
												</td>
											</tr>
											<tr>
												<td colSpan="2">
													<hr>
													<B>Infrastructure Level</B></td>
											</tr>
											<tr>
												<td width="10%">&nbsp;</td>
												<td width="90%"><A title="Shapes in the Device level contain other Devices and IPs, host Objects, have Attributes and Artifacts, and relate to other Devices." href="device.aspx"><B><FONT size="3">Device</FONT></B></A><br>
												</td>
											</tr>
											<tr>
												<td colSpan="2">
													<hr>
													<B>Artifact</B></td>
											</tr>
											<tr>
												<td width="10%">&nbsp;</td>
												<td width="90%"><A title="Creates a new Artifact." href="artifact.aspx?func=1"><B><FONT size="3">Create</FONT></B></A><BR>
													<A title="Updates Artifact." href="artifact.aspx?func=2"><B><FONT size="3">Update</FONT></B></A><BR>
													<A title="Deletes a Artifact." href="artifact.aspx?func=3"><B><FONT size="3">Delete</FONT></B></A><br>
												</td>
											</tr>
										</table>
									</TD>
									<TD vAlign="top" width="50%">
										<table width="100%">
											<TR>
												<TD colSpan="2">
													<P align="center"><B><FONT size="4">SCHEMA&nbsp;MANAGEMENT<BR>
															</FONT><FONT color="dimgray"><FONT size="2"><EM>Manages information schema
																		<BR>
																		of a shape and its&nbsp;associations.</EM></FONT> </FONT></B>
													</P>
												</TD>
											</TR>
											<tr>
												<td colSpan="2"><hr><B>Attribute</B></td>
											</tr>
											<tr>
												<td width="10%">&nbsp;</td>
												<td width="90%"><A title="Creates a new Attribute." href="attribute.aspx?func=1"><b><FONT size="3">Create</FONT></b></A><br>
													<A title="Deletes a Attribute." href="attribute.aspx?func=3"><b><FONT size="3">Delete</FONT></b></A><br><br>
												</td>
											</tr>
											<tr>
												<td colSpan="2"><hr><B>ShapeTypeAttribute</B></td>
											</tr>
											<tr>
												<td width="10%">&nbsp;</td>
												<td width="90%"><A title="Creates a new ShapeTypeAttribute." href="ShapeTypeAttribute.aspx?func=1"><b><FONT size="3">Create</FONT></b></A><br>
													<A title="Updates a ShapeTypeAttribute." href="ShapeTypeAttribute.aspx?func=2"><b><FONT size="3">
																Update</FONT></b></A><BR>
													<A title="Deletes a ShapeTypeAttribute." href="ShapeTypeAttribute.aspx?func=3"><b><FONT size="3">
																Delete</FONT></b></A><br>
												</td>
											</tr>
										</table>
									</TD>
								</TR>
							</TABLE>
						</P>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
