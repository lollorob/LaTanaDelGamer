<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Carrello"/>
 	<jsp:param name="style" value = "carrello.css"/>
 	<jsp:param name="script" value = "cliente.js"/>
 </jsp:include>
 </head>
<body>
 	<%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %> 
 	<div class="pagina1">
	 	<%Carrello carrello = (Carrello) request.getSession().getAttribute("Carrello");%>
	 	
	 	<%if(carrello == null || carrello.getSize()==0) {%>
	 	
	 	<div class="noProducts">
	 		<p class="noProdotto"> Non ci sono prodotti nel carrello :(</p>
	 		<a class="home" href="./home">Torna alla Home</a>
	 	</div>
	 	<%} else { %>
			
			<div class="ordine">
			
				<div class="checkoutForm">
					<form action="/LaTanaDelGamer/it/checkOut" method="GET">
						<fieldset class="field">
							<legend>Riassunto Ordine</legend>
							<ul class="elementiOrdine">
								<%
								for (int i = 0; i < carrello.getSize(); i++) {
							   		ItemCarrello item = carrello.doretrieveByIndex(i);
							       	ProdottoBean prodotto = item.getProdotto();
							      %>
							      <li class="nomeOrdine">
							      	<%=prodotto.getNome()%> x <%=item.getQuantity()%> = <%=item.getSomma() %>€
							      </li> <%
								
								}
								%>
							</ul>
							
								<p class="totaleOrdine"><b>Totale ordine : <%=carrello.getTotale()%>€</b></p>
							
							<div class="bottoneDiv">
			           			<input id="checkoutButton" type="submit" class="checkoutButton" name="checkout" value="Acquista">
			        		</div>
			        	</fieldset>
			        </form>
		        </div>
		        
		       
			    <div class="prodotti">
			       
			        <%for (int i = 0; i < carrello.getSize(); i++) {
				   		ItemCarrello item = carrello.doretrieveByIndex(i);
				       	ProdottoBean prodotto = item.getProdotto();%>
				        <div  class="prodotto">
				        
				        	<div class="contenitoreFoto">
				        		<div class="copertina">
				            		<img class ="foto" src="/LaTanaDelGamer/prodotti/immagine?id_prodotto=<%=prodotto.getId_prodotto()%>" onerror="this.src= '/LaTanaDelGamer/immagini/noimage.jpg'" title="copertina">
				            	</div>
				            </div>
				            
				            <div class="contenitoreInfo">
				            
				            	<div class="nome">
					                	<form action="/LaTanaDelGamer/it/prodotto" class="nomeClick" method="GET">
							 					<input type="submit"  class="titolo" name="titolo" value = "<%=prodotto.getNome()%>">
							 					<input type="hidden" id="id" name="id" value=<%=prodotto.getId_prodotto()%>>		 			
							 			</form>
					                      
				                </div>
				                
				                <div class="quantita">		
						 			<form name="selected" action="/LaTanaDelGamer/it/aggiungiAlCarrello" method="GET" >
							 			<fieldset class="displayQuantita">
	    									<legend><b>Quantità:</b></legend>
								 			<input type="hidden" name="id" value=<%=prodotto.getId_prodotto()%>>
								 			<select id="quantity" name="quantity" onchange="this.form.submit()">
											 <%
												if(prodotto != null && prodotto.getQuantita() > 0) {
														
													int max = prodotto.getQuantita();
													int j=1;
													while(j<=max) {	//quantità disponibile
														//poniamo come selected la quantita' precisa
												%>
												
														<%if(item.getQuantity() == j) {%>
															<option selected value="<%=j%>"><%=j%></option>
															
															<%} else { %>
															<option value="<%=j%>"><%=j%></option>
															
															
														<%}	j++;
													}
												} %>
											</select>
										</fieldset>
									</form>
								</div>
								
								<div class="prezzo">	
										<p>Totale : <%=item.getSomma() %>€</p>
										<form action="/LaTanaDelGamer/it/aggiungiAlCarrello" method = "GET">
										<input type="hidden" name ="eliminaProdotto" value="1">
										<input type="hidden" name="id" value=<%=prodotto.getId_prodotto()%>>
										<input type="submit"  class="elimina" value="Elimina"> 
										</form>
						 		</div>
						 				
				            </div>	
						</div>
			     	<%}%>
			     
		       </div>
	       </div>
	          	
       <%} %>
       </div>
       <%@include file="/WEB-INF/Views/Cliente/footer.jsp" %> 
</body>
</html>