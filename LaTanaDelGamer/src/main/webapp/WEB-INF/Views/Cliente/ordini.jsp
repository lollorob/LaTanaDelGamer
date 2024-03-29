<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Profilo | Ordini"/>
 	<jsp:param name="style" value = "ordiniCliente.css"/>
 	<jsp:param name="script" value = "cliente.js"/>
 </jsp:include>
 
 	<%
 	Collection<?> ordini = (Collection<?>)request.getAttribute("ordiniCliente");
 	if(ordini == null) {
 		System.out.println("Collection ORDINI CLIENTE NULL");
 	}
 %>
 
  <% 
	    OrdineBean ordineSingolo = (OrdineBean) session.getAttribute("ordini");
		Collection<?> itemOrdine = (Collection<?>)session.getAttribute("itemOrdini");
	    	session.removeAttribute("ordini");
	    	session.removeAttribute("itemOrdini");
    	%>
	         
 </head> 
 	
 
 <body>
 	<%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %> 
 	
 	<% 
 		if(clienteRole == null || clienteRole.isAdmin() != false)
 			response.sendRedirect("/LaTanaDelGamer/it/login");
 	  	
    %>

 	<div class="pagina1">
 			
 				<%
		if(ordineSingolo != null) {  
	%>
		<div id="tabella" class="tabella"> 
	    	<table class="tab1"> 
	        <thead> 
		       <tr> 
			        <th>Id Ordine</th>
			        <th>Data Ordine</th>
			        <th>Username</th>
			        <th>Email Spedizione</th>
			        <th>Importo</th>
			        <th>Tipo di Pagamento</th>
			        <th>Metodo di Pagamento</th>
			        <th>Prodotti Acquistati</th>
			        <th>Azioni</th>
		        </tr>
	        </thead> 
	       <tbody> 
	          <tr> 
	             <td data-title="Id Ordine"><%=ordineSingolo.getId_ordine() %></td> 
	             <td data-title="Data Ordine"><%=ordineSingolo.getData_ordine() %></td>
	             <td data-title="Username"><%=ordineSingolo.getUsername() %></td>
	             <td data-title="Email Spedizione"><%=ordineSingolo.getEmail_spedizione() %></td>
	             <td data-title="Importo"><%=ordineSingolo.getImporto() %>€</td>
	             <td data-title="Tipo di Pagamento"><%=ordineSingolo.getTipo_pagamento() %></td>
	             <% String cifreTotali = ordineSingolo.getMetodo_pagamento(); 
	             String metodo  = "**** **** **** **** "+cifreTotali.substring(cifreTotali.length()-4, cifreTotali.length()); %>
	             <td data-title="Metodo di Pagamento"><%=metodo %></td>
	             <td data-title="Prodotti Acquistati"><%  
	           
	     		if(itemOrdine != null && itemOrdine.size() > 0) {
	     			
	     			Iterator<?> it = itemOrdine.iterator();
	     			while(it.hasNext()) {
	     				ItemOrdineBean bean = (ItemOrdineBean)it.next();
	     			
	     		%><p class="itemOrdine">
	            <%= bean.getNome() %> x<%=bean.getQuantita() %> </p> 
	            <% } } %></td>
				 <td>
	     			  <form action="/LaTanaDelGamer/it/ordini" method="GET">
						<button class="bottone1">Annulla</button>    
					 </form>        	
	             </td>
	          </tr>
	       </tbody>
	    </table> 
 </div>	
			<%  } %>
      
 		
 		 <%
				if(ordini != null && ordini.size() > 0) {
					%>
 		
 		
 		
		 	<div  class="tabella" id="tabella"> 
		    	<table class="tab2"> 
			       <thead>
			       	
			          <tr class="titolo"> 
				        <th>Id Ordine</th>
				        <th>Importo</th>
				        <th>Email Spedizione</th>
				        <th>Data Ordine</th>
				        <th>Azioni</th>
			          </tr>
			   
		              
					<% 
					Iterator<?> it = ordini.iterator();
					while(it.hasNext()) {
						OrdineBean bean = (OrdineBean)it.next();
					
			%>
		       		</thead> 
		       <tbody> 
		          <tr> 
		          	 <td data-title="Id"><%= bean.getId_ordine()%></td>
		             <td data-title="Importo"><%=bean.getImporto() %>€</td>
		             <td data-title="Email Spedizione"><%=bean.getEmail_spedizione() %></td>
		             <td data-title="Data Ordine"><%=bean.getData_ordine() %></td>
					 <td>
		             	 <form method="POST" action="/LaTanaDelGamer/ordini/dettagliOrdineCliente">
		             		<button type="submit" name="id" class="bottone" value="<%=bean.getId_ordine()%>">Dettagli</button>
		             	</form>
		             	
		             	</td>
		
		      <% 	} %> </table>
			    	
		      </div>	
				<%}else{
					%><div class="noOrdini">
						<h1>Non ci sono ordini! :(</h1>
					</div>
				<%} %>
 
 		</div>
 			<%@include file="/WEB-INF/Views/Cliente/footer.jsp" %> 
 </body>
 
 </html>