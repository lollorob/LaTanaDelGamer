<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*, java.awt.image.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Prodotti | Admin"/>
 	<jsp:param name="style" value = "prodotti.css"/>
 	<jsp:param name="script" value = "dashboard.js"/>
 </jsp:include>
 <script type="text/javascript" src="/LaTanaDelGamer/js/prodotto.js"></script>
 
 
 
  <% if(session.getAttribute("adminRoles") == null){	
	  response.sendRedirect(request.getContextPath() + "/accounts/loginAdmin"); 
	}%> 
 
  <%
 	Collection<?> prodotti = (Collection<?>)session.getAttribute("listaProdotti");
 
 	if(prodotti == null) {
 		System.out.println("Collection Prodotti NULL");
 		return;
 	}



	Collection<?>  categorie = (Collection<?>)session.getAttribute("listaCategorie");
 
 	if(categorie == null) {
 		System.out.println("Categorie non caricate - prodotti.jsp");
 		
 		return;
 	}
 %>
 
 
 <script type="text/javascript" src="/LaTanaDelGamer/js/prodotto.js"></script>
</head>

<body>

	<%@include file="/WEB-INF/Views/PagineComuni/menu.jsp" %> 

	<img src="/LaTanaDelGamer/icone/freccia.svg" alt="Freccia" class="freccia" onmouseover="openMenu()" id="menu">
	<div id="contenuto" onClick="closeMenu()">
		 
	<header class="top">
			Benvenuto <%= session.getAttribute("username") %>! Quale operazione desidera effettuare?
	</header>
		
		 <% ProdottoBean  prodotto= (ProdottoBean) session.getAttribute("prodotti");
    	    session.removeAttribute("prodotti");
    	    
    	    String filtro="";
    	 	String order="";
    	 	if(session.getAttribute("filtro")!=null)
    	 		filtro= (String)session.getAttribute("filtro");
    	 	
    	 	if(session.getAttribute("order")!=null)
    	 		order=(String)session.getAttribute("order");
    	    %>
	
	<div class="filtri">
			<div class="selezione">
				<a class="add" href="/LaTanaDelGamer/prodotti/crea">Aggiungi Prodotto</a>
		 	</div>
		 	
		 	<div class="divFormFiltri">
			 	<form name="filtri" class="formFiltro" action="/LaTanaDelGamer/Dashboard/prodotti" method="POST">
			 			<select name="filtro">
		 						<option value="id_prodotto">No filter</option>
		 						<% if(filtro.equalsIgnoreCase("nome")) {%>
		 							<option selected value="nome">Nome</option>
		 							<% }else{ %>
		 							<option value="nome">Nome</option>
		 							<%}%>
		 						<% if(filtro.equalsIgnoreCase("prezzo")) {%>
		 							<option selected value="prezzo">Prezzo</option>
		 							<% }else{ %>
		 							<option  value="prezzo">Prezzo</option>
		 							<%}%>
		 						<% if(filtro.equalsIgnoreCase("datadiuscita")) {%>
		 							<option selected value="datadiuscita">Data</option>
		 							<% }else{ %>
		 							<option value="datadiuscita">Data</option>
		 							<%}%>
		 						<% if(filtro.equalsIgnoreCase("quantita")) {%>
		 							<option selected value="quantita">Quantità</option>
		 							<% }else{ %>
		 							<option  value="quantita">Quantità</option>
		 							<%}%>
		 						<% if(filtro.equalsIgnoreCase("casaproduttrice")) {%>
		 							<option selected value="casaproduttrice">Casa Produttrice</option>
		 							<% }else{ %>
		 							<option  value="casaproduttrice">Casa Produttrice</option>
		 							<%}%>
		 						<% if(filtro.equalsIgnoreCase("categoria")) {%>
		 							<option selected value="categoria">Categoria</option>
		 							<% }else{ %>
		 							<option  value="categoria">Categoria</option>
		 							<%}%>
		 				</select>
		 				
		 				<select name="order">
		 					<% if(order.equalsIgnoreCase("ASC")) {%>
		 							<option selected value="ASC">Crescente</option>
		 							<% }else{ %>
		 							<option value="ASC">Crescente</option>
		 							<%}%>
		 					<% if(order.equalsIgnoreCase("DESC")) {%>
		 							<option selected value="DESC">Decrescente</option>
		 							<% }else{ %>
		 							<option value="DESC">Decrescente</option>
		 							<%}%>
		 				</select>
		 				<input type="submit"  class="bottoneFiltra" value="filtra">
			 	</form>
		 	</div>
		 	
		 	
	 	</div>
	
	
	
	<%
		if(prodotto!= null) {  
			
	%>
         		<h2>Dettagli</h2>
        	<div id="tabella"> 
   		 	<table> 
     	  	<thead>
				<tr>
					<th>Nome</th>
					<th>Prezzo</th>
					<th>Descrizione</th>
					<th>Data Di Uscita</th>
					<th>Casa Produttrice</th>
					<th>Quantità</th>
					<th>Copertina</th>
					<th>Categoria</th>
					
				</tr>
			</thead> 
			<tbody> 
				<tr>
					<td data-title="Nome"><%=prodotto.getNome()%></td>
					<td data-title="Prezzo"><%=prodotto.getPrezzo()%></td>
					<td data-title="Descrizione"><%=prodotto.getDescrizione()%></td>
					<td data-title="Data Di Uscita"><%=prodotto.getDataDiUscita()%></td>
					<td data-title="Casa Produttrice"><%=prodotto.getCasaProduttrice()%></td>
					<td data-title="Quantità"><%=prodotto.getQuantita()%></td>
					<td data-title="Copertina"><img src="/LaTanaDelGamer/prodotti/immagine?id_prodotto=<%=prodotto.getId_prodotto()%>" alt="no photo"  width="80" height="100"></td>
					<td data-title="Categoria"><%=prodotto.getnomeCategoria()%></td>				
				</tr>
			</tbody>
		</table>
         
         <div class="Form">
			<form method="post" name="prodotto" class="form" action="<%=response.encodeURL("/LaTanaDelGamer/prodotti/aggiorna")%>" enctype="multipart/form-data" name="prodotto">
				
					<h4><b>Aggiorna Prodotto</b></h4>
					
					
					<div class="riga">
						<div class="nome">
							<label for="id">ID</label>
						</div>
						<div class="area">
							<input id="id" name="id" readonly type="text" maxlength="70" placeholder="Nome" value="<%=prodotto.getId_prodotto()%>"><br>
						</div>
					</div>
					
					<div class="riga">
						<div class="nome">
							<label for="nome">Nome</label>
						</div>
						<div class="area">
							<input id="nome" name="nome" type="text" maxlength="70" placeholder="Nome" value="<%=prodotto.getNome()%>"><br>
						</div>
					</div>
					
					<div class="riga">
						<div class="nome">	
							<label for="prezzo">Prezzo</label>
						</div>
						<div class="area">
							<input id="prezzo" name="prezzo" type="text" placeholder="Prezzo" value="<%=prodotto.getPrezzo()%>"><br>
						</div>
					</div>
					
					<div class="riga">	
						<div class="nome">
							<label for="descrizione">Descrizione</label>
						</div>
						<div class="area">
							<input id="descrizione" name="descrizione" type="text" maxlength="500" placeholder="Descrizione" value="<%=prodotto.getDescrizione()%>"><br>
						</div>
					</div>
					
					<div class="riga">	
						<div class="nome">
							<label for="descrizione">Data Di Uscita</label>
						</div>
						<div class="area">
							<input type="date" name="datadiuscita" id="datadiuscita" value="<%=prodotto.getDataDiUscita()%>"><br>
						</div>
					</div>
					
					<div class="riga">	
						<div class="nome">
							<label for="casaproduttrice">Casa produttrice</label>
						</div>
						<div class="area">
							<input id="casaproduttrice" name="casaproduttrice" type="text" maxlength="50" placeholder="Casa Produttrice" value="<%=prodotto.getCasaProduttrice()%>" ><br>
						</div>
					</div>
						
					<div class="riga">	
						<div class="nome">
							<label for="quantita">Quantità</label>
						</div>
						<div class="area">
							<input id="quantita" name="quantita" type="text" placeholder="Quantità" value="<%=prodotto.getQuantita()%>"><br>
						</div>
					</div>
					
					<div class="riga">
						<div class="nome">	
							<label for="nome_categoria">Categoria</label>
						</div>
								<select id="nome_categoria" name="nome_categoria">
								 <%
										if(categorie != null && categorie.size() > 0) {
											
											Iterator<?> it = categorie.iterator();
											while(it.hasNext()) {
												CategoriaBean bean = (CategoriaBean)it.next();
												if(bean.getNome().equals(prodotto.getnomeCategoria())){
											
											%>
													<option selected value="<%= bean.getNome() %>"><%= bean.getNome() %></option>
												<%} else {%> 
													<option value="<%= bean.getNome() %>"><%= bean.getNome() %></option>
											<%} 
										}	
										} %>
								</select>
					</div>	
					   
					
						<button type="submit" class="bottone" onClick="return valida1()">Aggiorna</button>
						
				
			</form>
			<form action="/LaTanaDelGamer/Dashboard/prodotti" method="POST">
						<button class="annulla">Annulla</button>
			</form>
	     	</div>	
         
         </div>
		
	<%  } %>
		
	 	<div id="tabella"> 
    <table> 
       <thead> 
          <tr> 
        <th>Id-Prodotto</th>
        <th>Nome</th>
        <th>Prezzo</th>
        <th>Descrizione</th>
        <th>Data Di Uscita</th>
        <th>Casa Produttrice</th>
        <th>Quantità</th>
        <th>Categoria</th>
        <th>Azioni</th>
          </tr> 
               <%
		if(prodotti != null && prodotti.size() > 0) {
			
			Iterator<?> it = prodotti.iterator();
			while(it.hasNext()) {
				ProdottoBean bean = (ProdottoBean)it.next();
			
	%>
	
	
       </thead> 
       <tbody> 
          <tr>
             <td data-title="Id-Prodotto"><%=bean.getId_prodotto() %></td> 
             <td data-title="Nome"><%=bean.getNome() %></td> 
             <td data-title="Prezzo"><%=bean.getPrezzo() %></td> 
             <td data-title="Descrizione"><%=bean.getDescrizione() %></td> 
             <td data-title="Data Di Uscita"><%=bean.getDataDiUscita() %></td> 
             <td data-title="Casa Produttrice"><%=bean.getCasaProduttrice() %></td> 
             <td data-title="Quantità"><%=bean.getQuantita()%></td> 
             <td data-title="Categoria"><%=bean.getnomeCategoria() %></td> 
             <td>
             	<form method="POST" action="/LaTanaDelGamer/prodotti/dettagli">
             		<button type="submit" name="id" class="bottone" value="<%=bean.getId_prodotto()%>">Dettagli</button>
             	</form>
             	
             	<form method="POST" action="/LaTanaDelGamer/prodotti/elimina">
             		<button type="submit" name="id" class="bottone" value="<%=bean.getId_prodotto()%>">Elimina</button>
             	</form>
             	
			 </td>
          </tr>
          
      <%		}
		} else { %>
		<tr>
			<td colspan="15">Non ci sono Prodotti</td>
		</tr>
	<% } %> 
       </tbody>
    </table> 
 	</div>

     		
</div>	


</body>
</html>