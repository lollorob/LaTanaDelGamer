<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Account | Admin"/>
 	<jsp:param name="style" value = "accounts.css"/>
 	<jsp:param name="script" value = "dashboard.js"/>
 </jsp:include>
 
  <% if(session.getAttribute("adminRoles") == null){	
	  response.sendRedirect(request.getContextPath() + "/accounts/loginAdmin"); 
	}%> 	
	 <script type="text/javascript" src="/LaTanaDelGamer/js/account.js"></script>
</head>

<body>

	<%@include file="/WEB-INF/Views/PagineComuni/menu.jsp" %> 
	
	 	<%	int errore=0;	
 	if(request.getAttribute("error")!=null){
 		errore=(int) request.getAttribute("error");
 	}%>
	<img src="/LaTanaDelGamer/icone/freccia.svg" alt="Freccia" class="freccia" onmouseover="openMenu()" id="menu">
	<div id="contenuto" onClick="closeMenu()">
		 
		<header class="top">
			Benvenuto <%= session.getAttribute("username") %>! Quale operazione desidera effettuare?
		</header>
		
			<div class="Form">
          		<form class="tabella" name="utente" action="<%=response.encodeURL("/LaTanaDelGamer/accounts/crea")%>" method="POST">
			
				<h4><b>Crea Un Utente</b></h4>
				<%if (errore==1062){ %>
			<p class="errore">Username/Email già esistente</p>	
			<%} %>
				<div class="riga">
					<div class="nome">
						<label for="username">Username</label>
					</div>
				<div class="area">
					<input id="username" name="username" type="text" placeholder="Username" oninput="checkUser(this)"><br>
					<div id="errorSpace"></div>
				</div>
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="passwd">Password</label>
					</div>
				<div class="area">
					<input id="passwd" name="passwd" type="password" placeholder="Inserisci Password"><br>
				</div>			
			</div>			
		
				<div class="riga">
					<div class="nome">
						<label for="e_mail">E-Mail</label>
					</div>
				<div class="area">
					<input id="e_mail" name="e_mail" type="text" placeholder="Inserisci E-Mail" oninput="checkEmail(this)"><br>
					<div id="errorSpace1"></div>
				</div>			
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="nome">Nome</label>
					</div>
				<div class="area">
					<input id="nome" name="nome" type="text"  placeholder="Inserisci Nome"><br>
				</div>
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="cognome">Cognome</label>
					</div>
				<div class="area">
					<input id="cognome" name="cognome" type="text"  placeholder="Inserisci Cognome"><br>
				</div>	
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="datadinascita">Data Di Nascita</label>
					</div>
				<div class="area">
					<input id="datadinascita" name="datadinascita" type="text" placeholder="Inserisci Data Di Nascita"><br>
				</div>
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="via">Via</label>
					</div>
				<div class="area">
					<input id="via" name="via" type="text"  placeholder="Inserisci Via"><br>
				</div>
			</div>

				<div class="riga">
					<div class="nome">
						<label for="numero">Numero</label>
					</div>
				<div class="area">
					<input  id="numero" name="numero" type="text"  placeholder="Inserisci Numero"><br>
				</div>
			</div>		
			
				<div class="riga">
					<div class="nome">
						<label for="cap">CAP</label>
					</div>
				<div class="area">
					<input  id="cap" name="cap" type="text"   placeholder="Inserisci CAP"><br>
				</div>
			</div>

				<div class="riga">
					<div class="nome">
						<label for="citta">Città</label>
					</div>
				<div class="area">
					<input  id="citta" name="citta" type="text"  placeholder="Inserisci Città"><br>
				</div>
			</div>	
			
				<div class="riga">
					<div class="nome">
						<label for="provincia">Provincia</label>
					</div>
				<div class="area">
					<input  id="provincia" name="provincia" type="text"  placeholder="Inserisci Provincia"><br>
				</div>
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="is_admin">Admin</label>
					</div>
				<div class="area">
					<select id="is_admin" name="is_admin">
						<option value="true">SI</option>
						<option value="false">NO</option>
					</select>
				</div>
			</div>			
			
			<button type="submit" class="bottone" onClick="return valida()">Crea</button>			
		</form>
		
		<form action="/LaTanaDelGamer/Dashboard/account" method="POST">
				<button class="annulla">Annulla</button>
		</form>
		
	</div>
</div>
</body>
</html>