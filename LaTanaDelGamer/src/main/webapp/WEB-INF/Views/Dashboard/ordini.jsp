<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Lista Ordini | Admin"/>
 	<jsp:param name="style" value = "ordini.css"/>
 	<jsp:param name="script" value = "dashboard.js"/>
 </jsp:include>
 
  <% if(session.getAttribute("adminRoles") == null){	
	  response.sendRedirect(request.getContextPath() + "/accounts/loginAdmin"); 
	}%> 
 
  <%
 	Collection<?> ordini = (Collection<?>)session.getAttribute("listaOrdini");
 
 	if(ordini == null) {
 		System.out.println("Collection ORDINI NULL");
 		return;
 	}
 %>

</head>

<body>

	<%@include file="/WEB-INF/Views/PagineComuni/menu.jsp" %> 

	<img src="/LaTanaDelGamer/icone/freccia.svg" alt="Freccia" class="freccia" onmouseover="openMenu()" id="menu">
	<div id="contenuto" onClick="closeMenu()">
		 
		<header class="top">
			Benvenuto <%= session.getAttribute("username") %>! Quale operazione desidera effettuare?
		</header>
		
		
		 <% 
	    OrdineBean ordine = (OrdineBean) session.getAttribute("ordini");
		Collection<?> itemOrdini = (Collection<?>)session.getAttribute("itemOrdini");
	    	session.removeAttribute("ordini");
	    	session.removeAttribute("itemOrdini");
    	%>
	          
          
          
	<%
		if(ordine != null) {  
	%>
		<div id="tabella"> 
	    	<table> 
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
	             <td data-title="Id Ordine"><%=ordine.getId_ordine() %></td> 
	             <td data-title="Data Ordine"><%=ordine.getData_ordine() %></td>
	             <td data-title="Username"><%=ordine.getUsername() %></td>
	             <td data-title="Email Spedizione"><%=ordine.getEmail_spedizione() %></td>
	             <td data-title="Importo"><%=ordine.getImporto() %></td>
	             <td data-title="Tipo di Pagamento"><%=ordine.getTipo_pagamento() %></td>
	             <% String cifreTotali = ordine.getMetodo_pagamento(); 
	             String metodo  = "**** **** **** **** "+cifreTotali.substring(cifreTotali.length()-5, cifreTotali.length()); %>
	             <td data-title="Metodo di Pagamento"><%=metodo %></td>
	             <td data-title="Prodotti Acquistati"><%  
	           
	     		if(itemOrdini != null && itemOrdini.size() > 0) {
	     			
	     			Iterator<?> it = itemOrdini.iterator();
	     			while(it.hasNext()) {
	     				ItemOrdineBean bean = (ItemOrdineBean)it.next();
	     			
	     		%><p>
	            <%= bean.getNome() %> </p> 
	            <% } } %></td>
				 <td><form method="POST" action="/LaTanaDelGamer/ordini/elimina">
	             		<button type="submit" name="id" class="bottone1" value="<%=ordine.getId_ordine()%>">Elimina</button>
	             	 </form>
	     			  <form action="/LaTanaDelGamer/Dashboard/ordini" method="POST">
						<button class="bottone1">Annulla</button>    
					 </form>        	
	             </td>
	          </tr>
	       </tbody>
	    </table> 
 </div>	
			<%  } %>
      
       	
	 	<div id="tabella"> 
    	<table> 
	       <thead> 
	          <tr> 
		        <th>Id Ordine</th>
		        <th>Username</th>
		        <th>Importo</th>
		        <th>Azioni</th>
	          </tr> 
               <%
		if(ordini != null && ordini.size() > 0) {
			
			Iterator<?> it = ordini.iterator();
			while(it.hasNext()) {
				OrdineBean bean = (OrdineBean)it.next();
			
	%>
       		</thead> 
       <tbody> 
          <tr> 
          	 <td data-title="Id"><%= bean.getId_ordine()%></td>
             <td data-title="Username"><%=bean.getUsername() %></td>
             <td data-title="Importo"><%=bean.getImporto() %></td>
			 <td>
             	 <form method="POST" action="/LaTanaDelGamer/ordini/dettagli">
             		<button type="submit" name="id" class="bottone" value="<%=bean.getId_ordine()%>">Dettagli</button>
             	</form>
             	
             	</td>

      <% }
		} else { %>
			<td colspan="15">Non ci sono Ordini</td>
	<% } %>
	     </tr>
	    </table>
	    	
       	</div>	

</div>
</body>
</html>