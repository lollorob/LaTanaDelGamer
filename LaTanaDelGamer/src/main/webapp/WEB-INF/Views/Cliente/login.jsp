<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp">
    	<jsp:param name="title" value="Login | Cliente"/>
    	<jsp:param name="style" value = "login.css"/>
    	<jsp:param name="script" value = "loginAdmin.js"/>
  </jsp:include>
</head>
<body>
 	<%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %> 
 	<div class="pagina1">
<section>
	<div class="form-container">
		<h1>Login</h1>
	<form action="<%= request.getAttribute("context")%>/cliente/login" method="POST">
	<div class="control">
		<label for="username">Username</label>
		<input type="text" name="username" id="username" placeholder="Username">
	</div>
	<div class="control">
		<label for="passwd">Password</label>
		<input type="password" name="passwd" id="passwd" placeholder="Password">
		</div>
		<div class="control">
			<input type="submit" value="Login">
		</div>
	</form>
	<div class="link">
		<a href="<%=request.getAttribute("context")%>/cliente/registrati">Registrati</a>
		</div>
	</div>
</section>
</div>
</body>
</html>