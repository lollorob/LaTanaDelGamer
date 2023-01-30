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
 	<div class="pagina1" id="pagina1">	
 		
 		
 		<%Carrello carrello = (Carrello) request.getSession().getAttribute("Carrello");%>
 			
			    <div class="slider">
			    	<img class="frecciaSinistra" src="/LaTanaDelGamer/icone/frecciaSinistra.png" onclick="return precedente()">
			    	<img class="frecciaDestra" src="/LaTanaDelGamer/icone/frecciaDestra.png"  onclick="return successiva()">
				    
			    	<div class="immagini">
			    	<a href="/LaTanaDelGamer/it/prodotto?titolo=Fifa+2023&id=3" target="_self"> 
   						<img src="/LaTanaDelGamer/immagini/slider1.jpg" class="immagine-slider1"/> 
					</a>
					<a href="/LaTanaDelGamer/it/prodotto?titolo=Formula+1+2022&id=2" target="_self"> 
   						<img src="/LaTanaDelGamer/immagini/slider2.jpg" class="immagine-slider2"/> 
					</a>
					<a href="/LaTanaDelGamer/it/prodotto?titolo=Life+is+Strange%3A+True+Colors&id=9" target="_self"> 
   						<img src="/LaTanaDelGamer/immagini/slider3.jpg" class="immagine-slider3"/> 
					</a>
					</div>	
			    </div> 
		   <div class="lastRelease">
			   <div class="boxText"> 
			   		<h2 class="titoloBox">Latest Releases</h2>
			   		<p class="descrizioneBox">Scopri i nuovi giochi appena aggiunti al catalogo!</p>
			   </div>
			   
				<div class="prodotti" id="prodotti">
					  	<%
				int i = 0;
			 	Collection<?> prodotti = (Collection<?>)session.getAttribute("prodottiForDate");
			 
			 	if(prodotti == null) {
			 		System.out.println("Collection Prodotti NULL");
			 		return;
			 	}
			 	%>
			 	
			 	
					 	<%
							if(prodotti != null && prodotti.size() > 0) {
								
								Iterator<?> it = prodotti.iterator();
								while(it.hasNext() && i < 5) {
									ProdottoBean prodotto = (ProdottoBean)it.next();
									i++;
								
						%>
					
					 		<div class ="prodotto" id="prodotto">
					 			
							 		<div class="contenitoreFoto">	
							 			<div id="copertina" class="copertina">
							 				<img  class ="foto" id="foto" src="/LaTanaDelGamer/prodotti/immagine?id_prodotto=<%=prodotto.getId_prodotto()%>" onerror="this.src= '/LaTanaDelGamer/immagini/noimage.jpg'" title="copertina">		 
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
									 				<%if(prodotto.getQuantita() == 0) {%>
										 			 <p>Non Disponibile</p>
										 			 <%
										 			 } else {%> 
										 	    <input type="hidden" id="quantity" name="quantity" value="1">
									 			<input class ="aggiungi" type="submit"  value="Aggiungi Al Carrello">								 			
									 			<%} 
									 			}%>								 			
								 			</form>
							 			</div>
							 		</div>		
					 		</div>
					     <% }
								}
								%> 
							
					
			     </div>
		     
			</div>
	
			<div class="cheaper">
				<div class="boxText">
				   	<h2 class="titoloBox">I Più Economici</h2> 
				   	<p class="descrizioneBox">Hai un budget limitato? Questi giochi fanno per te!</p>
				 </div>
			   
				<div class="prodotti" id="prodotti">
					  	<%
				int y = 0;
			 	Collection<?> prodottiCheaper = (Collection<?>)session.getAttribute("prodottiCheaper");
			 
			 	if(prodottiCheaper == null) {
			 		System.out.println("Collection Prodotti NULL");
			 		return;
			 	}
			 	%>
			 	
			 	
					 	<%
							if(prodottiCheaper != null && prodottiCheaper.size() > 0) {
								
								Iterator<?> il = prodottiCheaper.iterator();
								while(il.hasNext() && y < 5) {
									ProdottoBean prodotto1 = (ProdottoBean)il.next();
									y++;
								
						%>
					
					 		<div class ="prodotto" id="prodotto">
					 			
							 		<div class="contenitoreFoto">	
							 			<div id="copertina" class="copertina">
							 				<img  class ="foto" id="foto" src="/LaTanaDelGamer/prodotti/immagine?id_prodotto=<%=prodotto1.getId_prodotto()%>" onerror="this.src= '/LaTanaDelGamer/immagini/noimage.jpg'" title="copertina">		 
							 			</div>
							 			
							 		</div>
							 			
							 		<div class ="contenitoreInfo">
							 			<div class="nome">
							 				<form action="/LaTanaDelGamer/it/prodotto" method="GET">
							 					<input type="submit"  class="titolo" name="titolo" value = "<%=prodotto1.getNome()%>">
							 					<input type="hidden" id="id" name="id" value=<%=prodotto1.getId_prodotto()%>>		 			
							 				</form>
							 			</div>
							 			
							 			<div class="bottone">
								 			<form action="/LaTanaDelGamer/it/aggiungiAlCarrello" name ="addCart"  class="aggiungi" method = "GET">
								 
								 				<input type="hidden" id="id" name="id" value=<%=prodotto1.getId_prodotto()%>>
									 			<%if(carrello!=null) {
										 			 if(prodotto1.getQuantita() == 0) {%>
										 			 <p>Non Disponibile</p>
										 			 <%
										 			 }else {
									 				// int quantity = carrello.getQuantityById(prodotto.getId_prodotto());	
										 			if(carrello.doretrieveById(prodotto1.getId_prodotto())!=null){
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
									 				<%if(prodotto1.getQuantita() == 0) {%>
										 			 <p>Non Disponibile</p>
										 			 <%
										 			 } else {%> 
										 	    <input type="hidden" id="quantity" name="quantity" value="1">
									 			<input class ="aggiungi" type="submit"  value="Aggiungi Al Carrello">								 			
									 			<%} 
									 			}%>								 			
								 			</form>
							 			</div>
							 		</div>		
					 		</div>
					     <% }
								}
								%> 
							
					
			     </div>
		     
			</div>
		
			<div class="moreProducts">
				<a class="sfogliaTutto" href="/LaTanaDelGamer/it/prodottiCategoria?str=MostraTutto"> SFOGLIA TUTTO</a>
			</div>
		
		</div>    
		    <%@include file="/WEB-INF/Views/Cliente/footer.jsp" %> 
	    
 </body>
 
 </html>
