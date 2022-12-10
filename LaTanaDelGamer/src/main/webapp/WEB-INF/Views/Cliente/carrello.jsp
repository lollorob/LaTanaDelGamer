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
 	
 	<%if(carrello == null) {%>
 	
 	<h1>NON CI SONO PRODOTTI NEL CARRELLO</h1>
 	<%} else { %>
	
	
	    <div class="prodotto">
        <h1>Cart</h1>
        <%for (int i = 0; i < carrello.getSize(); i++) {
   		ItemCarrello item = carrello.doretrieveByIndex(i);
       ProdottoBean prodotto = item.getProdotto();%>
        <div id="<%prodotto.getId_prodotto();%>" class="cartItem">
            <img src="/LaTanaDelGamer/prodotti/immagine?id_prodotto=<%=prodotto.getId_prodotto()%>" onerror="this.src= '/LaTanaDelGamer/immagini/noimage.jpg'" title="copertina">
            <div class="informazioni">
                <h4>
                	<%=prodotto.getNome()%>
                </h4>            
                <div class="quantita">
		 				<p class="display"> Quantità = </p>
		 				
		 				<form name="selected" action="/LaTanaDelGamer/it/aggiungiAlCarrello" method="GET" >
		 				<input type="hidden" name="id" value=<%=prodotto.getId_prodotto()%>>
		 				<select id="quantity" name="quantity" onchange="this.form.submit()">
								 <%
							if(prodotto != null && prodotto.getQuantita() > 0) {
								
								int max = prodotto.getQuantita();
								int j=1;
								while(j<=max) {	
						%>
						
									<%if(item.getQuantity() == j) {%>
									<option selected value="<%=j%>"><%=j%></option>
									
									<%} else { %>
									<option value="<%=j%>"><%=j%></option>
									
									
									<%}	j++;
								}
							} %>
						</select>
						
						</form>
						
						<p>Totale : <%=item.getSomma() %></p>
						<form action="/LaTanaDelGamer/it/aggiungiAlCarrello" method = "GET">
						<input type="hidden" name ="eliminaProdotto" value="1">
						<input type="hidden" name="id" value=<%=prodotto.getId_prodotto()%>>
						<input type="submit" value="Elimina"> 
						</form>
		 				
		 				
		 		</div>
                
            </div>	
	</div>
     <%}%>
     
       </div>
       
          	<form action="/LaTanaDelGamer/it/checkOut" method="GET">
            <input id="checkoutButton" type="submit" name="checkout" value="Checkout">
        </form>
       
       </div>
       <%} %>
</body>
</html>