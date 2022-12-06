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
		 			<h2><%=prodotto.getNome()%></h2>
		 			<img class="copertina" src="/LaTanaDelGamer/prodotti/immagine?id_prodotto=<%=prodotto.getId_prodotto()%>" onerror="this.src= '/LaTanaDelGamer/immagini/noimage.jpg'" title="copertina">		 
		 			<form action="/LaTanaDelGamer/it/aggiungiAlCarrello" name ="addCart"  method = "GET">
		 			
			 			<input type="hidden"  name="id" value=<%=prodotto.getId_prodotto()%>>
			 			<input type="hidden" id ="quantityOriginale" name="quantityOriginale" value="<%=prodotto.getQuantita()%>">
			 			<%if(carrello!=null) {
			 			int quantity = carrello.getQuantityById(prodotto.getId_prodotto());	%>
			 			<input type="hidden" id="quantity" name="quantity" value="<%=quantity+1%>">
			 			<%} 
			 			 else { %>
			 			<input type="hidden" id="quantity" name="quantity" value="1">
			 			<%} %>
			 			<button class ="aggiungi" type="submit"  onClick="return checkQuantity()" value="Aggiungi Al Carrello"></button>
		 			</form>		
		 		</div>
		          
		      <% }
				}  %> 
				    
		    
		    <%@include file="/WEB-INF/Views/Cliente/footer.jsp" %> 
		 
 			
 		</div>
 		
	    
 </body>
 
 </html>
