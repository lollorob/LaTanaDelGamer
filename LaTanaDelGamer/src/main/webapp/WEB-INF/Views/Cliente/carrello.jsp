<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Carrello"/>
 	<jsp:param name="style" value = "cliente.css"/>
 	<jsp:param name="script" value = "cliente.js"/>
 </jsp:include>
 </head>
<body>
 	<%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %> 
 	
 	<%Carrello carrello = (Carrello) request.getSession().getAttribute("Carrello");%>
 	
 	<%if(carrello == null) {%>
 	
 	<h1>NON CI SONO PRODOTTI NEL CARRELLO</h1>
 	<%} else { %>
	
	<div id="ContenitoreCarrello">
	    <div id="ItemCarrello">
        <h1>Cart</h1>
        <%for (int i = 0; i < carrello.getSize(); i++) {%>
        <%ProdottoBean prodotto = carrello.doretrieveByIndex(i);%>
        <div id="<%prodotto.getId_prodotto();%>" class="cartItem">
            <img src="/LaTanaDelGamer/prodotti/immagine?id_prodotto=<%=prodotto.getId_prodotto()%>" onerror="this.src= '/LaTanaDelGamer/immagini/noimage.jpg'" title="copertina">
            <div class="informazioni">
                <h4><%=prodotto.getNome()%>
                </h4>
            </div>	
	</div>
     <%}%>
     
       </div>
       
       </div>
       <%} %>
</body>
</html>