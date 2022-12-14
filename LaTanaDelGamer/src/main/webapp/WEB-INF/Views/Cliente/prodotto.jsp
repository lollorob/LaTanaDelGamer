<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Prodotto"/>
 	<jsp:param name="style" value = "prodottoCliente.css"/>
 	<jsp:param name="script" value = "cliente.js"/>
 </jsp:include>
 </head>
<body>
	<% ProdottoBean prodotto = new ProdottoBean();
	   prodotto = (ProdottoBean) request.getAttribute("dettagliProdotto");%>


 	<%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %>
 	
 	<div class="pagina1">
 	<%Carrello carrello = (Carrello) request.getSession().getAttribute("Carrello");%>
	 	
	 	
	 	<div class="prodotto">
			 	<div class="galleria">
				 	<div class="contenitoreCopertina">
						<img class="copertina" src="/LaTanaDelGamer/prodotti/immagine?id_prodotto=<%=prodotto.getId_prodotto()%>" onerror="this.src= '/LaTanaDelGamer/immagini/noimage.jpg'" title="copertina">
					</div>
				<!--  
					<div class = "altreFoto">
						<div class="foto"></div>
						<div class="foto"></div>
						<div class="foto"></div>
					</div>
				-->	
				</div>
				
				
				<div class="schedaProdotto">
				
					<div class="nome">
						<h1> <%=prodotto.getNome()%></h1>
					</div>
					
					<div class="casaProduttrice">
						<p><%=prodotto.getCasaProduttrice() %></p>
					</div>
					
					<div class="dettagli">
						<p><%=prodotto.getDescrizione()%></p>
					</div>
					
					<div class="prezzo">
						<h4><%=prodotto.getPrezzo()%> €</h4>
					</div>
					
					<div class="informazione">
						<div class="quantità">Quantità disponibile: <%=prodotto.getQuantita()%></div>
						<div class="genere">Genere: <%=prodotto.getnomeCategoria()%></div>
					</div>
					
					<div class="bottone">
						<form action="/LaTanaDelGamer/it/aggiungiAlCarrello" name ="addCart"  class="aggiungi" method = "GET">
							 
							 				<input type="hidden" id="id" name="id" value=<%=prodotto.getId_prodotto()%>>
								 			<%if(carrello!=null) {
									 			 if(prodotto.getQuantita() == 0) {%>
									 			 <p>Non Disponibile</p>
									 			 <%
									 			 }else {
								 				// int quantity = carrello.getQuantityById(prodotto.getId_prodotto());	
									 			if(carrello.doretrieveById(prodotto.getId_prodotto())!=null){
									 			%> 
									 				<p>Già nel carrello</p> 
									 			<% 
									 			}
									 			else { %>
									 			<input type="hidden" id="quantity" name="quantity" value="1">
									 			<button class ="acquista" type="submit">Aggiungi Al Carrello</button>
									 			<%} 
								 			} }
								 			 else { %>
								 			<input type="hidden" id="quantity" name="quantity" value="1">
								 			<button class ="acquista" type="submit">Aggiungi Al Carrello</button>
								 			<%} %>
								 			
							 			</form>
					</div>
					
				</div>
			
		</div>
		
		
	</div>
</body>
</html>