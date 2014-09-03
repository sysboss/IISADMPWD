<%@Language="VBScript"%>
<HTML>
<!--#include file = "text.asp"-->

<title><%=L_Title_Text%></title>

<FONT COLOR=FFFFFF>
<STYLE>
</STYLE>
</FONT>

<head>
		<META HTTP-EQUIV="Content-Type" Content="text/html; charset=Windows-1252">
</head>


<BODY BGCOLOR=#FFFFFF LINK=000000 VLINK=000000>

<%On Error goto 0%>
<%if Request.Form("cancel") <> "" then
	Response.Redirect(Request.QueryString) 
	Response.End
end if

	dim domain, username, posbs, posat

	username = Request.Form("acct")
	if username <> "" then
		username = Server.HTMLEncode(username)
	else
		username = Server.HTMLEncode(Request.ServerVariables("REMOTE_USER"))
	end if

	domain = Request.Form("domain")
	if domain <> "" then
		domain = Server.HTMLEncode(domain)
	else
		posbs = Instr(1, username, "\")
		posat = Instr(1, username, "@")
		if posbs > 0 then
			domain = Left(username, posbs - 1)
			username = Right(username, len(username) - posbs)
		elseif posat > 0 then
			domain = Right(username, len(username) - posat)
			username = Left(username, posat - 1)
		else	
			set nw = Server.CreateObject("WScript.Network")
			domain = nw.UserDomain
		end if 
	end if

%>

<!-- Windows NT Server with IIS  -->
<%if Instr(1,Request.ServerVariables("SERVER_SOFTWARE"), "IIS") > 0 then%>
	<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<TR VALIGN=CENTER>
		<TD></TD>
		<TD WIDTH=20> </TD>
		<TD><FONT SIZE=+3 COLOR=#000000><B><%=L_ISM_Text%><BR> <FONT SIZE=-1><%=L_IIS6_Text%><FONT></B></FONT></TD>
	</TR>
	</Table>
<%end if%>   

<!-- Windows NT Workstation with PWS  -->
<%if Instr(1,Request.ServerVariables("SERVER_SOFTWARE"), "PWS") then%>
<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0>
<TR VALIGN=CENTER>
	<TD></TD>
	<TD WIDTH=20> </TD>
	<TD><FONT SIZE=+3 COLOR=#000000><B><%=L_ISM_Text%><BR> <FONT SIZE=-1><%=L_PWS_Text%><FONT></B></FONT></TD>
</TR>
</Table>
<%end if%>

<p>

<form method="POST" action="http://<%=Server.HTMLEncode(Request.ServerVariables("SERVER_NAME"))%>/iisadmpwd/achg.asp?<%=Server.HTMLEncode(Request.QueryString)%>">

<table>
<tr>
<td><%=L_Domain_Text%></td><td><input type="text" name="domain" value="
<%
	Response.Write domain
%>
"></td></tr>
<tr>
<td><%=L_Account_Text%></td><td><input type="text" name="acct" value="
<%
	Response.Write username
%>
"></td>
</tr>
<tr>
<td><%=L_OldPassword_Text%></td><td><input type="password" name="old" value=""></td>
</tr>
<tr>
<td><%=L_NewPassword_Text%></td><td><input type="password" name="new" value=""></td>
</tr>
<tr>
<td><%=L_Confirm_Text%></td><td><input type="password" name="new2" value=""></td>
</tr>
</table>

<p>

<input type="submit" value="<%=L_OK_Text%>">
<input type="submit" name="cancel" value="<%=L_Cancel_Text%>">
<input type="reset" value="<%=L_Reset_Text%>">

</form>
</body>
</html>
