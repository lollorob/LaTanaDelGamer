<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Lista Account | Admin"/>
 	<jsp:param name="style" value = "accounts.css"/>
 	<jsp:param name="script" value = "dashboard.js"/>
 </jsp:include>
 
  <% if(session.getAttribute("adminRoles") == null){	
	  response.sendRedirect(request.getContextPath() + "/accounts/loginAdmin"); 
	}%> 
 
  <%
 	Collection<?> accounts = (Collection<?>)session.getAttribute("listaAccount");
 
 	if(accounts == null) {
 		System.out.println("Collection ACCOUNTS NULL");
 		return;
 	}
 	
		int errore=0;	
 	if(request.getAttribute("error")!=null){
 		errore=(int) request.getAttribute("error");
 	}
 %>

	 <script type="text/javascript" src="/LaTanaDelGamer/js/account.js"></script>
</head>

<body>

	<%@include file="/WEB-INF/Views/PagineComuni/menu.jsp" %> 

	<img src="/LaTanaDelGamer/icone/freccia.svg" alt="Freccia" class="freccia" onmouseover="openMenu()" id="menu">
	<div id="contenuto" onClick="closeMenu()">
		 
		<header class="top">
			Benvenuto <%= session.getAttribute("username") %>! Quale operazione desidera effettuare?
		</header>
		
		 <% AccountUserBean account1 = (AccountUserBean) session.getAttribute("clienti");
    	session.removeAttribute("clienti");%>
	
	<%
		if(account1!= null) {  
	%>
         		<h2>Dettagli</h2>
		<div id="tabella"> 
		
		<table>
		<thead>
			<tr>
				<th>Username</th>
				<th>Nome</th>
				<th>Cognome</th>
				<th>Via</th>
				<th>Numero</th>
				<th>CAP</th>
				<th>Citta</th>
				<th>Provincia</th>
				<th>Admin</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td data-title="Username"><%=account1.getUsername()%></td>
				<td data-title="Nome"><%=account1.getNome() %></td>
				<td data-title="Cognome"><%=account1.getCognome()%></td>
				<td data-title="Via"><%=account1.getVia()%></td>
				<td data-title="Numero"><%=account1.getNumero()%></td>
				<td data-title="CAP"><%=account1.getCap()%></td>
				<td data-title="Citta"><%=account1.getCitta()%></td>	
				<td data-title="Provincia"><%=account1.getProvincia()%></td>
				<td data-title="Admin"><%=account1.isAdmin()%></td>
			</tr>
		</tbody>
		</table>
		
			<div class="Form">
          		<form  method="post" name="utente1" class="form"  action="<%=response.encodeURL("/LaTanaDelGamer/accounts/aggiorna")%>" name="utente">
			
				<h4><b>Aggiorna Account</b></h4>
				
				<div class="riga">
					<div class="nome">
						<label for="username">Username</label>
					</div>
				<div class="area">
					<input id="username" name="username" readonly type="text" placeholder="Username" value="<%=account1.getUsername()%>"><br>
				</div>
			</div>
		
				<div class="riga">
					<div class="nome">
						<label for="e_mail">E-Mail</label>
					</div>
				<div class="area">
					<input id="e_mail" name="e_mail" type="text" placeholder="Inserisci E-Mail" value="<%=account1.geteMail()%>"><br>
				</div>
				</div>			
			
			
				<div class="riga">
					<div class="nome">
						<label for="nome">Nome</label>
					</div>
				<div class="area">
					<input id="nome" name="nome" type="text" placeholder="Inserisci Nome" value="<%=account1.getNome()%>"><br>
				</div>
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="cognome">Cognome</label>
					</div>
				<div class="area">
					<input id="cognome" name="cognome" type="text" placeholder="Inserisci Cognome" value="<%=account1.getCognome()%>"><br>
				</div>	
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="datadinascita">Data Di Nascita</label>
					</div>
				<div class="area">
					<input id="datadinascita" name="datadinascita" type="text" value="<%=account1.getData()%>"><br>
				</div>
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="n_ordini">Numero Di Ordini</label>
					</div>
				<div class="area">
					<input  readonly id="n_ordini" name="n_ordini" type="text" value="<%=account1.getn_Ordini()%>"><br>
				</div>
			</div>
		
				<div class="riga">
					<div class="nome">
						<label for="via">Via</label>
					</div>
				<div class="area">
					<input id="via" name="via" type="text"  placeholder="Inserisci Via"  value="<%=account1.getVia()%>"><br>
				</div>
			</div>

				<div class="riga">
					<div class="nome">
						<label for="numero">Numero</label>
					</div>
				<div class="area">
					<input  id="numero" name="numero" type="text" placeholder="Inserisci Numero" value="<%=account1.getNumero()%>"><br>
				</div>
			</div>		
			
				<div class="riga">
					<div class="nome">
						<label for="cap">CAP</label>
					</div>
				<div class="area">
					<input  id="cap" name="cap" type="text" placeholder="Inserisci CAP" value="<%=account1.getCap()%>"><br>
				</div>
			</div>

				<div class="riga">
					<div class="nome">
						<label for="citta">Città</label>
					</div>
				<div class="area">
					<input  id="citta" name="citta" type="text" placeholder="Inserisci Città"  value="<%=account1.getCitta()%>"><br>
				</div>
			</div>	
			
				<div class="riga">
					<div class="nome">
						<label for="provincia">Provincia</label>
					</div>
				<div class="area">
					<input  id="provincia" name="provincia" type="text" placeholder="Inserisci Provincia" value="<%=account1.getProvincia()%>"><br>
				</div>
			</div>
			
			<button type="submit" class="bottone" onClick="return valida1()">Aggiorna</button>
		
			</form>
			
			<form action="/LaTanaDelGamer/Dashboard/account" method="POST">
				<button class="annulla">Annulla</button>
			</form>
			</div>
	</div>
</div>
	
			<%  } %>
 
        	<div class="selezione">
				<a class="add" href="/LaTanaDelGamer/accounts/crea">Aggiungi Utente</a>
			</div>
	 	<div id="tabella"> 
    <table> 
       <thead> 
          <tr> 
	 		<th>Username</th>
			<th>E-Mail</th>
			<th>DataDiNascita</th>
			<th>N-Ordini</th>
			<th>Azioni</th>
          </tr> 
               <%
		if(accounts != null && accounts.size() > 0) {
			
			Iterator<?> it = accounts.iterator();
			while(it.hasNext()) {
				AccountUserBean bean = (AccountUserBean)it.next();
			
	%>
       </thead> 
       <tbody> 
          <tr>	
             <td data-title="Username"><%=bean.getUsername() %></td> 
             <td data-title="E-Mail"><%=bean.geteMail() %></td>
             <td data-title="DataDiNascita"><%=bean.getData() %></td>
             <td data-title="N-Ordini"><%=bean.getn_Ordini() %></td>
			 <td><form method="POST" action="/LaTanaDelGamer/accounts/cancella">
             		<button type="submit" name="id" class="bottone1" value="<%=bean.getUsername()%>">Elimina</button>
             	</form> 
             	 <form method="POST" action="/LaTanaDelGamer/accounts/dettagli">
             		<button type="submit" name="id" class="bottone1" value="<%=bean.getUsername()%>">Dettagli</button>
             	</form>
             	
             </td>
          </tr>
                <% }
		} else { %>
		<tr>
			<td colspan="15">Non ci sono Utenti Registrati</td>
		</tr>
	<% } %>
		</tbody>
      </table>
   

</div>

</body>
</html>