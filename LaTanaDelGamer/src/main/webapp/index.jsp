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
<% response.sendRedirect("./it/home"); %>
</body>
</html>