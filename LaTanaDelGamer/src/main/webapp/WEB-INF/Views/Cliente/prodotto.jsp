<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Prodotto"/>
 	<jsp:param name="style" value = "carrello.css"/>
 	<jsp:param name="script" value = "cliente.js"/>
 </jsp:include>
 </head>
<body>
	<% ProdottoBean prodotto = new ProdottoBean();
	   prodotto = (ProdottoBean) request.getAttribute("dettagliProdotto");%>

 	<%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %>

</body>
</html>