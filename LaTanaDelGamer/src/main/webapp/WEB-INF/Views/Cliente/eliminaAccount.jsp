<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Elimina Account | Cliente"/>
 	<jsp:param name="style" value = "eliminaAccount.css"/>
 	<jsp:param name="script" value = "modificaAccount.js"/>
</jsp:include>

</head>
<body>
			<%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %>        	  
			<div class="pagina">
				<section>
				<div class="form-container">
					<h1><b>Sei Sicuro Di Voler Eliminare L'Account?</b></h1>
					    <h4>Facendo così perderai tutti i tuoi dati</h4>
					   
	          		<form  method="POST" name="utente1" class="form"  action="<%=response.encodeURL("/LaTanaDelGamer/it/eliminaAccount")%>" name="utente">
						<input class="bt" type="submit" value="Elimina Account">
					</form>
					<form method="GET" action="<%=response.encodeURL("/LaTanaDelGamer/it/home")%>">
						<input class="bt" type="submit" value="Torna Alla Home">	
						</form>
					</div>
			</section>	
		</div>
		<%@include file="/WEB-INF/Views/Cliente/footer.jsp" %>
</body>
</html>