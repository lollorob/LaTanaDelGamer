<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp">
    	<jsp:param name="title" value="Login | Cliente"/>
    	<jsp:param name="style" value = "login.css"/>
    	<jsp:param name="script" value = "loginCliente.js"/>
  </jsp:include>
  

</head>
<body>
 	<%@include file="/WEB-INF/Views/Cliente/navbar.jsp"%>
 	<% 
 		if(clienteRole != null && clienteRole.isAdmin() == false)
 			response.sendRedirect("/LaTanaDelGamer/it/home");
 	  	
    %>
 	<div class="pagina1">
<section>
	<div class="form-container">
		<h1>Login</h1>
	<form name = "LoginFormCliente" action="<%= request.getAttribute("context")%>/it/login" method="POST">
	<div class="control">
		<label for="username">Username</label>
		<input type="text" name="username" id="username" placeholder="Username">
	</div>
	<div class="control">
		<label for="passwd">Password</label>
		<input type="password" name="passwd" id="passwd" placeholder="Password">
		</div>
		<div class="control">
			<input type="submit" onClick="return valida()" value="Login">
		</div>
	</form>
	<div class="link">
		<a href="<%=request.getAttribute("context")%>/it/registrati">Registrati</a>
		</div>
							 <% if(session.getAttribute("failedlog") != null){
		    boolean failedlog = (Boolean) session.getAttribute("failedlog");
		    if( failedlog == true) {%>
			<div>
		       <p align="center">Wrong User/Pass</p>
		    <%request.getSession().setAttribute("failedlog",false);
		   }
   		 }%>  
	</div>
	</div>
</section>
</div>

  <%@include file="/WEB-INF/Views/Cliente/footer.jsp" %> 
</body>
</html>