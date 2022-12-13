<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Home"/>
 	<jsp:param name="style" value = "cliente.css"/>
 	<jsp:param name="script" value = "cliente.js"/>
 </jsp:include>
 
 </head>
 
 <body>
 	<%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %> 
 		
 		
 		<div class="pagina">
 		<%Carrello carrello = (Carrello) request.getSession().getAttribute("Carrello");%>
 			
		    <div class="slider">
		    	<img class="frecciaSinistra" src="/LaTanaDelGamer/icone/frecciaSinistra.png" onclick="return precedente()">
		    	<img class="frecciaDestra" src="/LaTanaDelGamer/icone/frecciaDestra.png"  onclick="return successiva()">
			    
		    	<div class="immagini">
					 <img src="/LaTanaDelGamer/immagini/assassinHome.jpg" class="immagine-slider1" />
					 <img src="/LaTanaDelGamer/immagini/fifa22Home.jpg" class="immagine-slider2" />
					 <img src="/LaTanaDelGamer/immagini/nba22Home.jpg" class="immagine-slider3" />
				</div>	
		    </div> 
		   
				   
				  	<%
		 	Collection<?> prodotti = (Collection<?>)session.getAttribute("listaProdotti");
		 
		 	if(prodotti == null) {
		 		System.out.println("Collection Prodotti NULL");
		 		return;
		 	}
		 	%>
		 	<%
				if(prodotti != null && prodotti.size() > 0) {
					
					Iterator<?> it = prodotti.iterator();
					while(it.hasNext()) {
						ProdottoBean prodotto = (ProdottoBean)it.next();
					
			%>
		
		 		<div class ="prodotto">
		 			<form action="/LaTanaDelGamer/it/prodotto" method="GET">
		 			<input type="submit" name="titolo" value = "<%=prodotto.getNome()%>">
		 			<input type="hidden" id="id" name="id" value=<%=prodotto.getId_prodotto()%>>		 			
		 			</form>
		 			<img class="copertina" src="/LaTanaDelGamer/prodotti/immagine?id_prodotto=<%=prodotto.getId_prodotto()%>" onerror="this.src= '/LaTanaDelGamer/immagini/noimage.jpg'" title="copertina">		 
		 			<form action="/LaTanaDelGamer/it/aggiungiAlCarrello" name ="addCart"  method = "GET">
		 
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
				 			<input class ="aggiungi" type="submit"  value="Aggiungi Al Carrello">
				 			<%} 
			 			} }
			 			 else { %>
			 			<input type="hidden" id="quantity" name="quantity" value="1">
			 			<input class ="aggiungi" type="submit"  value="Aggiungi Al Carrello">
			 			<%} %>
			 			
		 			</form>		
		 		</div>
		          
		      <% }
					}
					%> 
				    
		    
		    <%@include file="/WEB-INF/Views/Cliente/footer.jsp" %> 
		 
 			
 		</div>
 		
	    
 </body>
 
 </html>
