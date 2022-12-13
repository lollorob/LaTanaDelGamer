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
 	
	 	
	 	
	 	<div class="prodotto">
			 	<div class="galleria">
				 	<div class="contenitoreCopertina">
						<img class="copertina" src="/LaTanaDelGamer/prodotti/immagine?id_prodotto=<%=prodotto.getId_prodotto()%>" onerror="this.src= '/LaTanaDelGamer/immagini/noimage.jpg'" title="copertina">
					</div>
					
					<div class = "altreFoto">
						<div class="foto"></div>
						<div class="foto"></div>
						<div class="foto"></div>
					</div>
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
						<button class="acquista"> Aggiungi al Carrello</button>
					</div>
					
				</div>
			
		</div>
		
		
	</div>
</body>
</html>