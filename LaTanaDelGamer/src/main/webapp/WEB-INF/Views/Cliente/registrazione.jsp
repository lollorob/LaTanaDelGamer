<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp">
    	<jsp:param name="title" value="Registrazione | Cliente"/>
    	<jsp:param name="style" value = "registrazione.css"/>
    	<jsp:param name="script" value = "account.js"/>
  </jsp:include>
</head>
<body>
 	<%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %> 
 	
 	<%	int errore=0;	
 	if(request.getAttribute("error")!=null){
 		errore=(int) request.getAttribute("error");
 	}%>

<div class="pagina1">
		<div class="form-container">
			<div class="titolo">
				<h1>Registrati</h1>
			</div>
		<form name="utente" action="<%=response.encodeURL("/LaTanaDelGamer/it/registrazione")%>" method="POST">
		<%if (errore==1062){ %>
			<p class="errore">Username/Email già esistente</p>	
			<%} %>
		<div class="control">
			<label for="nome">Nome</label>
			<input type="text" name="nome" id="nome" placeholder="Es. Mario">
			</div>
		<div class="control">
			<label for="cognome">Cognome</label>
			<input type="text" name="cognome" id="cognome" placeholder="Es. Rossi">
			</div>
		<div class="control">
			<label for="e_mail">E-Mail</label>
			<input type="text" name="e_mail" id="e_mail" placeholder="Es. prova@prova.pr" oninput="checkEmail(this)">
			<div id="errorSpace1"></div>
			</div>
		<div class="control">
			<label for="passwd">Password</label>
			<input type="password" name="passwd" id="passwd" placeholder="*******">
			</div>
		<div class="control">
			<label for="username">Username</label>
			<input type="text" name="username" id="usernameRegistration" placeholder="Username" oninput="checkUser(this)">
			<div id="errorSpace"></div>
			</div>
		<div class="control">
			<label for="datadinascita">Data Di Nascita</label>
			<input type="date" name="datadinascita" id="datadinascita">
			</div>
		<div class="control">
			<label for="via">Via/Strada</label>
			<input type="text" name="via" id="via" placeholder="Es. Via Roma">
			</div>
		<div class="control">
			<label for="numero">Numero</label>
			<input type="text" name="numero" id="numero" placeholder="Es. 25">
			</div>
		<div class="control">
			<label for="cap">CAP</label>
			<input type="text" name="cap" id="cap" placeholder="Es. 80054">
			</div>		
		<div class="control">
			<label for="citta">Città</label>
			<input type="text" name="citta" id="citta" placeholder="Es. Gragnano">
			</div>
		<div class="control">
			<label for="provincia">Provincia</label>
			<input type="text" name="provincia" id="provincia" placeholder="Es. Napoli">
			</div>		
		<div class="control">
			<input type="submit" value="Registrati" onClick="return valida3()">
		</div>
		<div class="link">
			<a href="<%=request.getAttribute("context")%>/it/home">Annulla</a>
		</div>
		
	</form>
		
	</div>
</div>

  <%@include file="/WEB-INF/Views/Cliente/footer.jsp" %> 
</body>
</html>