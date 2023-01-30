<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Prodotti | Cliente"/>
 	<jsp:param name="style" value = "prodottiCategoria.css"/>
 	<jsp:param name="script" value = "prodottiCategoria.js"/>
</jsp:include>

 	<%
 	Collection<?> prodottiCategoria = (Collection<?>)request.getAttribute("prodottiCategoria");
 	if(prodottiCategoria == null) {
 		System.out.println("Collection PRODOTTI PER CATEGORIA NULL");
 	}
 	
 
 	Collection<?>  listaCategorie = (Collection<?>)request.getAttribute("listaCategorie");
 
 	if(listaCategorie == null) {
 		System.out.println("Categorie non caricate");
 		
 		return;
 	}
 	
 	CategoriaBean categoria = (CategoriaBean) request.getAttribute("categoria");
 	String nomeCategoria="MostraTutto";
 	String filtro="";
 	String order="";
 	if(request.getParameter("str")!=null)
 		nomeCategoria=request.getParameter("str");
 	
 	if(request.getParameter("filtro")!=null)
 		filtro=request.getParameter("filtro");
 	
 	if(request.getParameter("order")!=null)
 		order=request.getParameter("order");
 %>

</head>
<body>
	  	<%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %> 
 
 
 		
 		<div class = "pagina1">
 		 	
 		<div class="filtro">
 			<form class="formFiltro" action="/LaTanaDelGamer/it/prodottiCategoria" method="GET">
 				<div class="valore">
 				
	 				<select name="filtro">
	 						<option value="false">No filter</option>
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
	 				</select>
 				</div>
 				<div class="valore">
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
 				</div>
 				<div class="valore">
	 				<select id="nome_categoria" name="str"> <!-- select con nomi delle categorie -->
	 					<option value="MostraTutto">Tutte</option>
									 <%
						if(listaCategorie != null && listaCategorie.size() > 0) {
							
							Iterator<?> it = listaCategorie.iterator();
							while(it.hasNext()) {
								CategoriaBean bean = (CategoriaBean)it.next();
								if(bean.getNome().equals(nomeCategoria)){
									%>
								<option selected value="<%= bean.getNome()%>"><%= bean.getNome()%></option>
							<%		
							} else{
							%>
								<option value="<%= bean.getNome()%>"><%= bean.getNome()%></option>
							<%}
							} 
						}%>
					</select>
				</div>
  				<input type="submit" class="bottoneFiltra" value="Filtra">
 			</form>
 		 </div> 	
	 		 	<%if(categoria!=null && !categoria.getNome().equals("")){ %>
			 		 <div class = "descrizioneCategoria">
			 		 
			 		 	<p class = "testoDescrizione"><%=categoria.getDidascalia() %> </p>
			 		 
			 		 </div>	
		 		 <%} %>	

			
			<div class="prodotti">
				  	
		 	
				 	<%
				 	if(prodottiCategoria != null && prodottiCategoria.size() > 0) {
							
							Iterator<?> it = prodottiCategoria.iterator();
							while(it.hasNext()) {
								ProdottoBean prodotto = (ProdottoBean)it.next();
							
					%>
				
				 		<div class ="prodotto">
				 			
						 		<div class="contenitoreFoto">	
						 			<div class="copertina">
						 				<img  class ="foto" src="/LaTanaDelGamer/prodotti/immagine?id_prodotto=<%=prodotto.getId_prodotto()%>" onerror="this.src= '/LaTanaDelGamer/immagini/noimage.jpg'" title="copertina">		 
						 			</div>
						 			
						 		</div>
						 			
						 		<div class ="contenitoreInfo">
						 			<div class="nome">
						 				<form action="/LaTanaDelGamer/it/prodotto" method="GET">
						 					<input type="submit"  class="titolo" name="titolo" value = "<%=prodotto.getNome()%>">
						 					<input type="hidden" id="id" name="id" value=<%=prodotto.getId_prodotto()%>>		 			
						 				</form>
						 			</div>
						 			
						 			<div class="bottone">
							 			<form action="/LaTanaDelGamer/it/aggiungiAlCarrello" name ="addCart"  class="aggiungi" method = "GET">
							 
							 				<input type="hidden" id="id" name="id" value=<%=prodotto.getId_prodotto()%>>
								 			<input type="hidden" id="quantity" name="quantity" value="1">
									 		<input class ="aggiungi" type="submit"  value="Aggiungi Al Carrello">
									 			
								 			 
								 			
							 			</form>
						 			</div>
						 		</div>		
				 		</div>
				     <% }
							} else{
							%> <p class="noProd"> Non ci sono prodotti disponibili</p>
						<%} %>
						
				
		     </div>
			
			
				
		</div>

			<%@include file="/WEB-INF/Views/Cliente/footer.jsp" %> 
</body>
</html>