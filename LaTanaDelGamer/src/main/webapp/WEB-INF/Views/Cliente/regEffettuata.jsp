<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Registrazione Effettuata"/>
 	<jsp:param name="style" value = "regeffettuata.css"/>
 	<jsp:param name="script" value = "dashboard.js"/>
 </jsp:include>

<%	String usernameAccount="utente";
	if (request.getAttribute("usernameAccount")!=null)
		usernameAccount = (String) request.getAttribute("usernameAccount");
	else
		response.sendRedirect("./home");
	%>
	
</head>

<body>
 	<%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %> 


<div class="pagina1">

	<div class="benvenuto">	
		<div id="testoBenvenuto">
			<h1>Benvenuto <%=usernameAccount %>!</h1>
		</div>
		
		<div id="tastoHome">
			<a href="<%=request.getAttribute("context")%>/it/home" class="link">Entra nella nostra Home</a>
		</div>
	</div>
</div>

  <%@include file="/WEB-INF/Views/Cliente/footer.jsp" %> 
</body>
</html>