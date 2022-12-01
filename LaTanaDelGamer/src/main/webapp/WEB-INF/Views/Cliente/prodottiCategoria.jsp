<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Prodotti | Cliente"/>
 	<jsp:param name="style" value = "modificaAccount.css"/>
 	<jsp:param name="script" value = "modificaAccount.js"/>
</jsp:include>

 	<%
 	Collection<?> prodotticat = (Collection<?>)request.getAttribute("prodottiCat");
 	if(prodotticat == null) {
 		System.out.println("Collection PRODOTTI PER CATEGORIA NULL");
 	}
 %>

</head>
<body>
	  	<%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %> 
 
 		 	<%
				if(prodotticat != null && prodotticat.size() > 0) {
					
					Iterator<?> it = prodotticat.iterator();
					while(it.hasNext()) {
						ProdottoBean prodottocat = (ProdottoBean)it.next();
					
			%>
		
		 		<div class ="prodotto">
		 			<h2><%=prodottocat.getNome()%></h2>
		 			<button class="bottonecarrello" onClick="">Aggiungi al Carrello</button>		 		
		 		</div>
		          
		      <% }
				}  %> 

</body>
</html>