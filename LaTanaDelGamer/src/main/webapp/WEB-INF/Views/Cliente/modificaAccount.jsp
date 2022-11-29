<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Modifica Account | Cliente"/>
 	<jsp:param name="style" value = "modificaAccount.css"/>
 	<jsp:param name="script" value = "modificaAccount.js"/>
</jsp:include>



</head>
		  <%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %>

<body>
            	  <% 
			if(clienteRole != null && clienteRole.isAdmin() == false) {%> 
			<div class="reg">
			<section>
			<div class="form-container">
				<h1><b>Aggiorna Account</b></h1>
				
          		<form  method="post" name="utente1" class="form"  action="<%=response.encodeURL("/LaTanaDelGamer/it/modificaCliente")%>" name="utente">

				<div class="control">
						<label for="username">Username</label>
					    <input id="username" name="username" readonly type="text" placeholder="Username" value="<%=clienteRole.getUsername()%>"><br>	    
				</div>
		
				<div class="control">
						<label for="e_mail">E-Mail</label>
					    <input id="e_mail" name="e_mail" type="text" placeholder="Inserisci E-Mail" value="<%=clienteRole.geteMail()%>"><br>						
			    </div>
			
				<div class="control">					
						<label for="nome">Nome</label>					
					    <input id="nome" name="nome" type="text" placeholder="Inserisci Nome" value="<%=clienteRole.getNome()%>"><br>
			    </div>
			
				<div class="control">
					<label for="cognome">Cognome</label>
					<input id="cognome" name="cognome" type="text" placeholder="Inserisci Cognome" value="<%=clienteRole.getCognome()%>"><br>	
			    </div>
			
				<div class="control">
					<label for="datadinascita">Data Di Nascita</label>
					<input id="datadinascita" name="datadinascita" type="text" value="<%=clienteRole.getData()%>"><br>
			    </div>
			
				<div class="control">
						<label for="n_ordini">Numero Di Ordini</label>
					    <input  readonly id="n_ordini" name="n_ordini" type="text" value="<%=clienteRole.getn_Ordini()%>"><br>
			    </div>
		
				<div class="control">
						<label for="via">Via</label>
					    <input id="via" name="via" type="text"  placeholder="Inserisci Via"  value="<%=clienteRole.getVia()%>"><br>
			    </div>

				<div class="control">
						<label for="numero">Numero</label>
					    <input  id="numero" name="numero" type="text" placeholder="Inserisci Numero" value="<%=clienteRole.getNumero()%>"><br>
			    </div>		
			
				<div class="control">
						<label for="cap">CAP</label>
					    <input  id="cap" name="cap" type="text" placeholder="Inserisci CAP" value="<%=clienteRole.getCap()%>"><br>
			    </div>

				<div class="control">
						<label for="citta">Città</label>
					    <input  id="citta" name="citta" type="text" placeholder="Inserisci Città"  value="<%=clienteRole.getCitta()%>"><br>
			    </div>	
			
				<div class="control">
						<label for="provincia">Provincia</label>
					    <input  id="provincia" name="provincia" type="text" placeholder="Inserisci Provincia" value="<%=clienteRole.getProvincia()%>"><br>
			    </div>
			
			<div class="control">
			<button type="submit" class="bottone" onClick="return valida1()">Aggiorna</button>
			</div>
			<div class="link">
				<a href="<%=request.getAttribute("context")%>/it/home">Home</a>
			</div>
			</form>
			</div>
<% } %>
</section>

<%@include file="/WEB-INF/Views/Cliente/footer.jsp" %> 
</div>
</body>
</html>