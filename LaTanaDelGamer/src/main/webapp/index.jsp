<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
<jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp">
    	<jsp:param name="title" value="La Tana Del Gamer"/>
    </jsp:include>
<meta charset="UTF-8">
</head>
<body>
	<p>Immagine caricata kitemmuo
	
	<%
	String message = (String)request.getAttribute("message");
	String message2 = (String)request.getAttribute("message2");
	String error = (String)request.getAttribute("error");
	String error2 = (String)request.getAttribute("error2");
	if(message != null && !message.equals("")) {
%>
	<p style="color: green;"><%=message %></p>
<%
	}
	if(error != null && !error.equals("")) {
%>
	<p style="color: red;">Error: <%= error%></p>
<% 
	}
	


	if(message2 != null && !message2.equals("")) {
%>
	<p style="color: green;"><%=message2 %></p>
<%

	} else{

		%>
		<p style="color: red;"> IMMAGINE NON CARICATA</p>
	<%
	}
	%>

	
</body>
</html>