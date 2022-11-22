<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Home | Admin"/>
 	<jsp:param name="style" value = "home.css"/>
 	<jsp:param name="script" value = "dashboard.js"/>
 </jsp:include>
 
  <% if(session.getAttribute("adminRoles") == null){	
	  response.sendRedirect(request.getContextPath() + "/accounts/loginAdmin"); 
	}%> 

</head>

<body>

	<%@include file="/WEB-INF/Views/PagineComuni/menu.jsp" %> 
	
	<img src="/LaTanaDelGamer/icone/freccia.svg" alt="Freccia" class="freccia" onmouseover="openMenu()" id="menu">
	<div id="contenuto" onClick="closeMenu()">
		 
		<header class="top">
			Benvenuto <%= session.getAttribute("username") %>! Quale operazione desidera effettuare?
		</header>
		
		
       		<div class="clienti">
       			<h4>Clienti Registrati</h4>
       			<p><%=request.getAttribute("numeroClienti") %></p>
       		</div>
       		
       		<div class="clienti">
       			<h4>Guadagno Totale</h4>
       			<p><%=request.getAttribute("guadagnoTotale") %> €</p>
       		</div>
       		
       		<div class="clienti">
       			<h4>Numero Ordini</h4>
       			<p><%=request.getAttribute("numeroOrdini") %></p>
       		</div>
       		
       		<div class="clienti">
       			<h4>Prodotti</h4>
       			<p><%=request.getAttribute("numeroProdotti") %></p>
       		</div>
    	
    </div>



</body>
</html>



