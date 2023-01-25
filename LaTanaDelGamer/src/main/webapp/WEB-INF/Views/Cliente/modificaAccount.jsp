<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Modifica Account | Cliente"/>
 	<jsp:param name="style" value = "checkout.css"/>
 	<jsp:param name="script" value = "modificaAccount.js"/>
</jsp:include>



</head>
		  

 
<body>
		<%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %> 	       	  
			<div class="pagina1">
		
	          		<form  method="post" name="utente1" class="form-container"  action="<%=response.encodeURL("/LaTanaDelGamer/it/modificaCliente")%>" name="utente">
	
						<h1><b>Modifica Profilo</b></h1>
						
						<input id="username" name="username" readonly type="hidden" placeholder="Username" value="<%=clienteRole.getUsername()%>"><br>	    
					    <input id="e_mail" name="e_mail" readonly  type="hidden" placeholder="Inserisci E-Mail" value="<%=clienteRole.geteMail()%>"><br>						
						<input  readonly id="n_ordini" name="n_ordini" type="hidden" value="<%=clienteRole.getn_Ordini()%>"><br>
					
						<div class="control">	
							<div class="first"> 				
								<label for="nome">Nome:</label>
							</div>	
							<div class="second">				
							    <input class="update" id="nome" name="nome" type="text" placeholder="Inserisci Nome" value="<%=clienteRole.getNome()%>"><br>
					    	</div>
					    </div>
					
						<div class="control">
							<div class="first"> 	
								<label for="cognome">Cognome:</label>
							</div>
							<div class="second">
							<input  class="update" id="cognome" name="cognome" type="text" placeholder="Inserisci Cognome" value="<%=clienteRole.getCognome()%>"><br>	
					    	</div>
					    </div>
					
						<div class="control">
							<div class="first"> 	
								<label for="datadinascita">Data Di Nascita:</label>
							</div>
							<div class="second">
							<input class="update" id="datadinascita" name="datadinascita" type="text" value="<%=clienteRole.getData()%>"><br>
					    	</div>
					    </div>
				
						<div class="control">
							<div class="first"> 	
								<label for="via">Via:</label>
							</div>
							<div class="second">
							    <input class="update" id="via" name="via" type="text"  placeholder="Inserisci Via"  value="<%=clienteRole.getVia()%>"><br>
					    	</div>
					    </div>
		
						<div class="control">
							<div class="first"> 	
								<label for="numero">Numero:</label>
							</div>
							<div class="second">
							    <input class="update" id="numero" name="numero" type="text" placeholder="Inserisci Numero" value="<%=clienteRole.getNumero()%>"><br>
					    	</div>
					    </div>		
					
						<div class="control">
							<div class="first"> 	
								<label for="cap">CAP:</label>
							</div>
							<div class="second">
							    <input class="update" id="cap" name="cap" type="text" placeholder="Inserisci CAP" value="<%=clienteRole.getCap()%>"><br>
					    	</div>
					    </div>
		
						<div class="control">
							<div class="first"> 	
								<label for="citta">Città:</label>
							</div>
							<div class="second">
							    <input class="update" id="citta" name="citta" type="text" placeholder="Inserisci Città"  value="<%=clienteRole.getCitta()%>"><br>
					    	</div>
					    </div>	
					
						<div class="control">
							<div class="first"> 	
								<label for="provincia">Provincia:</label>
							</div>
							<div class="second">
							    <input class="update" id="provincia" name="provincia" type="text" placeholder="Inserisci Provincia" value="<%=clienteRole.getProvincia()%>"><br>
					    	</div>
					    </div>
				
						
						<div class="control1">
							<input class="inputAggiorna" type="submit" onClick="return valida()" value="Aggiorna">
						</div>
						
						<div class="link">
							<a class="alink" href="<%=request.getAttribute("context")%>/it/home">Annulla</a>
						</div>
					</form>
		</div>
		
<%@include file="/WEB-INF/Views/Cliente/footer.jsp" %> 
</body>
</html>