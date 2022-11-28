<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Categorie | Admin"/>
 	<jsp:param name="style" value = "categorie.css"/>
 	<jsp:param name="script" value = "dashboard.js"/>
 </jsp:include>
 
  <% if(session.getAttribute("adminRoles") == null){	
	  response.sendRedirect(request.getContextPath() + "/accounts/loginAdmin"); 
	}%> 
 
  <%
 	Collection<?> categorie = (Collection<?>)session.getAttribute("listaCat");
 
 	if(categorie == null) {
 		System.out.println("Collection Categorie NULL");
 		return;
 	}
 	
 	CategoriaBean categoria1 = (CategoriaBean) session.getAttribute("categoriaSelezionata");
	session.removeAttribute("categoriaSelezionata");
 %>


 <script type="text/javascript" src="/LaTanaDelGamer/js/categoria.js"></script>
</head>

<body>

	<%@include file="/WEB-INF/Views/PagineComuni/menu.jsp" %> 

	<img src="/LaTanaDelGamer/icone/freccia.svg" alt="Freccia" class="freccia" onmouseover="openMenu()" id="menu">
	<div id="contenuto" onClick="closeMenu()">
		 
		<header class="top">
			Benvenuto <%= session.getAttribute("username") %>! Quale operazione desidera effettuare?
		</header>
		
		
		 
		
		<%
		if(categoria1!= null) {
	%>
         		<h2>Dettagli</h2>
		<div id="tabella"> 
		
		<table>
		<thead>
			<tr>
				<th>Nome </th>
				<th>Descrizione</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td data-title="Nome"><%=categoria1.getNome()%></td>
				<td data-title="Descrizione"><%=categoria1.getDidascalia()%></td>
			</tr>
		</tbody>
		</table>
		
			<div class="Form">
          		<form  method="post" name="categoria" class="form"  action="<%=response.encodeURL("/LaTanaDelGamer/categorie/aggiorna")%>" >
			
				<h4><b>Aggiorna Categoria</b></h4>
				
				<div class="riga">
					<div class="nome">
						<label for="nome">Nome</label>
					</div>
				<div class="area">
					<input id="nome" name="nome" readonly type="text" placeholder="Nome Categoria" value="<%=categoria1.getNome()%>"><br>
				</div>
			</div>
		
				<div class="riga">
					<div class="nome">
						<label for="didascalia">Descrizione</label>
					</div>
				<div class="area">
					<input id="didascalia" name="didascalia" type="text" placeholder="Inserisci Descrizione" value="<%=categoria1.getDidascalia()%>"><br>
				</div>			
			</div>
			
			
			<button type="submit" class="bottone" onClick="return valida()">Aggiorna</button>
		
			</form>
			
			<form action="/LaTanaDelGamer/Dashboard/categorie" method="POST">
				<button class="annulla">Annulla</button>
			</form>
			</div>
	</div>

	
			<%  } %>
		
		
		
		
		<div class="selezione">
			<a class="add" href="/LaTanaDelGamer/categorie/crea">Aggiungi Categoria</a>
	 	</div>
	 	<div id="tabella"> 
    <table> 
       <thead> 
          <tr> 
        <th>Nome</th>
        <th>Didascalia</th>
        <th>Azioni</th>
          </tr> 
               <%
		if(categorie != null && categorie.size() > 0) {
			
			Iterator<?> it = categorie.iterator();
			while(it.hasNext()) {
				CategoriaBean bean = (CategoriaBean)it.next();
			
	%>
       </thead> 
       <tbody> 
          <tr> 
             <td data-title="Nome"><%=bean.getNome() %></td> 
             <td data-title="Didascalia"><%=bean.getDidascalia() %></td>
             <td data-title="Azioni"><form method="POST" action="/LaTanaDelGamer/categorie/cancella">
             		<button type="submit" name="nome" class="bottone1" value="<%=bean.getNome()%>">Elimina</button>
             	</form> 
             	 <form method="POST" action="/LaTanaDelGamer/categorie/dettagli">
             		<button type="submit" name="nome" class="bottone1" value="<%=bean.getNome()%>">Dettagli</button>
             	</form>
             </td>
          </tr>
      <% }
		} else { %>
		<tr>
			<td colspan="15">Non ci sono Categorie</td>
		</tr>
	<% } %> 
       </tbody>
    </table> 
 </div>
 </div>      		
       	


</body>
</html>