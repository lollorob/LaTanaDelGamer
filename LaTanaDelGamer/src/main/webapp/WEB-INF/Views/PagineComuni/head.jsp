

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setAttribute("context", request.getContextPath());%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width= device-width, initial-scale=1, viewport-fit=cover">
<title><%= request.getParameter("title") %></title>
<meta name="description" content="Semplicemente il migliore shop di videogiochi">
<link rel="icon" type="image/png" href="/LaTanaDelGamer/immagini/logo.png">
<meta name="format-detection" content="telephone-no">   <!-- sequenze di numeri non interpretate come numeri di telefono cliccabili da cellulare -->
<meta name="theme-color" content="black">


<link href="<%= request.getAttribute("context")%>/css/generico.css" rel="stylesheet">
<%if ((request.getParameter("style"))!=null) { %>
	<link rel="stylesheet" href="<%= request.getAttribute("context")%>/css/<%=request.getParameter("style")%>">
<% } %>


<script src="<%= request.getAttribute("context")%>/js/generico.js" defer></script>  <!-- defer = script viene eseguito al termine dell'analisi della pagina per non interrompere il render. -->
<%if ((request.getParameter("script"))!=null) { %>
	<script src="<%= request.getAttribute("context")%>/js/<%=request.getParameter("script") %>" defer></script>
	<%} %>

</head>
<body>
</body>
</html>