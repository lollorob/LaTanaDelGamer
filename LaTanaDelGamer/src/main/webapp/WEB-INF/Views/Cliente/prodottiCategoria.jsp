<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Prodotti | Cliente"/>
 	<jsp:param name="style" value = "prodottiCategoria.css"/>
 	<jsp:param name="script" value = "modificaAccount.js"/>
</jsp:include>

 	<%
 	Collection<?> prodottiCategoria = (Collection<?>)request.getAttribute("prodottiCategoria");
 	if(prodottiCategoria == null) {
 		System.out.println("Collection PRODOTTI PER CATEGORIA NULL");
 	}
 	
 	CategoriaBean categoria = (CategoriaBean) request.getAttribute("categoria");
 %>

</head>
<body>
	  	<%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %> 
 
 		<div class = "pagina1">
 		 	
 		 	
	 		 	<%if(categoria!=null){ %>
	 		 	
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
							}
							%> 
						
				
		     </div>
			
			
				
		</div>

			<%@include file="/WEB-INF/Views/Cliente/footer.jsp" %> 
</body>
</html>