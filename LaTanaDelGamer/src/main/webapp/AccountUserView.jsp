<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
    
    
    <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp">
    	<jsp:param name="title" value="LolloTheKing"/>
    </jsp:include>
 <%
 	Collection<?> accounts = (Collection<?>)request.getAttribute("accounts");
 
 	String error = (String)request.getAttribute("error");
 	
 	if(accounts == null && error == null) {
 		response.sendRedirect(response.encodeRedirectUrl("./AccountUserControl"));
 		return;
 	}
 	
 	AccountUserBean account = (AccountUserBean) request.getAttribute("username");
 %>

<!DOCTYPE html>
<html lang="it">

<head>
<style>
		html,body{
			font-family: "Andika";
			font-weight: normal;
			font-style: normal;	
		}
	
	</style>
	<meta name="author" content="Lorenzo Lucio Ruocco, Roberto Balestrieri"> 
	<meta charset="UTF-8">


</head>
<body>

<h1> Store Demo</h1>
<h2>Accounts</h2>

<table>
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
		<tr>
			<td><%=bean.getUsername() %></td>
			<td><%=bean.geteMail() %></td>
			<td><%=bean.getData() %></td>
			<td><%=bean.getn_Ordini() %></td>
			<td><%=bean.getVia() %></td>
			<td>
			<a href="<%=response.encodeURL("AccountUserControl?action=details&id=" + bean.getUsername())%>">Details</a>
			<a href="<%=response.encodeURL("AccountUserControl?action=delete&id=" + bean.getUsername())%>">Delete</a>	
			</td>
		</tr>
	<%		}
		} else { %>
		<tr>
			<td colspan="15">Non ci sono Account</td>
		</tr>
	<% } %>
</table>
	
	<% AccountUserBean account1 = (AccountUserBean) request.getAttribute("account1");%>
	
	<%
		if(account1!= null && !account1.isEmpty()) {  
	%>
	
		<h2>Details</h2>
		<table>
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
			
			<tr>
				<td><%=account1.getUsername()%></td>
				<td><%=account1.getNome() %></td>
				<td><%=account1.getCognome()%></td>
				<td><%=account1.getVia()%></td>
				<td><%=account1.getNumero()%></td>
				<td><%=account1.getCap()%></td>
				<td><%=account1.getCitta()%></td>	
				<td><%=account1.getProvincia()%></td>
				<td><%=account1.isAdmin()%></td>
			</tr>
		</table>
		
		<form action="<%=response.encodeURL("AccountUserControl")%>" method="POST">
			
			<fieldset>
				<legend><b>Update</b></legend>
				<input type="hidden" name="action" value="update">
				<input type="hidden" name="username" value="<%=account1.getUsername()%>">
				
				
				<label for="e_mail">EMAIL:</label><br>
				<input id="e_mail" name="e_mail"  type="email" maxlength="100" placeholder="inserisci email" required value="<%=account1.geteMail()%>"><br>

				<label for="nome">Nome:</label><br>
				<input id="nome" name="nome" type="text" maxlength="20" placeholder="inserisci name" required value="<%=account1.getNome()%>"><br>

				<label for="cognome">Cognome:</label><br>
				<input id="cognome" name="cognome" type="text" required value="<%=account1.getCognome()%>"><br>


				<label for="datadinascita">Data di nascita:</label><br>
				<input id="datadinascita" name="datadinascita" type ="date" required value="<%=account1.getData()%>"><br>

				<label for="n_ordini">N Ordini:</label><br>
				<input readonly id="n_ordini" name="n_ordini" type="number" min="0" required value="<%=account1.getn_Ordini()%>"><br>

				<label for="via">Via:</label><br>
				<input id="via" name="via" type="text" maxlength="20" placeholder="inserisci via" required value="<%=account1.getVia()%>"><br>

				<label for="numero">Numero:</label><br>
				<input id="numero" name="numero" type="number" min="1" placeholder="inserisci numero" required value="<%=account1.getNumero()%>"><br>		

				<label for="cap">CAP:</label><br>
				<input id="cap" name="cap" type="number" min="1" required  placeholder="inserisci cap" value="<%=account1.getCap()%>"><br>

				<label for="citta">Città:</label><br>
				<input id="citta" name="citta" type="text" maxlength="20" placeholder="inserisci città" required value="<%=account1.getCitta()%>"><br>

				<label for="prvincia">Provincia:</label><br>
				<input id="provincia" name="provincia" type="text" maxlength="20" placeholder="inserisci via" required value="<%=account1.getProvincia()%>"><br>
	
				
				<input type="submit" value="Update">
				<input type="reset" value="Reset">
			</fieldset>
		</form>		

	<%  } %>

<%
	String message = (String)request.getAttribute("message");
	if(message != null && !message.equals("")) {
%>
	<p style="color: green;"><%=message %></p>
<%
	}
	if(error != null && !error.equals("")) {
%>
	<p style="color: red;">Error: <%= error%></p>
<%
	}
%>	


<form action="<%=response.encodeURL("AccountUserControl")%>" method="POST">
	<fieldset>
		<legend><b>Insert</b></legend>
		<input type="hidden" name="action" value="insert">
		
		<label for="username">Username:</label><br>
		<input id="username" name="username" type="text" maxlength="20" placeholder="Inserisci username" required><br>
		
		<label for="e_mail">EMAIL:</label><br>
		<input id="e_mail" name="e_mail" type="email" maxlength="100" placeholder="Inserisci email" required><br>
		
		<label for="passwd">Password:</label><br>
		<input id="passwd" name="passwd" type="password" min="5" placeholder="Inserisci password" required><br>
		
		<label for="nome">Nome:</label><br>
		<input id="nome" name="nome" type="text" maxlength="20" placeholder="Inserisci nome" required><br>
		
		<label for="cognome">Cognome:</label><br>
		<input id="cognome" name="cognome" type="text" maxlength="20" placeholder="Inserisci cognome" required><br>
		
		<label for="datadinascita">Data di Nascita:</label><br>
		<input id="datadinascita" name="datadinascita" type="date" required><br>
		
		<label for="via">Via:</label><br>
		<input id="via" name="via" type="text" placeholder="enter via"placeholder="Inserisci via" required><br>

		<label for="numero">Numero:</label><br>
		<input id="numero" name="numero" type="number" min="1"placeholder="Inserisci numero" required><br>		

		<label for="cap">CAP:</label><br>
		<input id="cap" name="cap" type="text" required><br>

		<label for="citta">Città:</label><br>
		<input id="citta" name="citta" type="text" maxlength="20" placeholder="Inserisci città" required><br>

		<label for="prvincia">Provincia:</label><br>
		<input id="provincia" name="provincia" type="text" maxlength="20" placeholder="Inserisci provincia" required ><br>
		
			<label for="is_admin">Admin:</label>

				<select name="is_admin" id="is_admin" required>
  					<option value="true">Sì</option>
  					<option value="false">No</option>
				</select>
		
		<input type="submit" value="Insert">
		<input type="reset" value="Reset">
	</fieldset>
</form>

</body>
</html> 