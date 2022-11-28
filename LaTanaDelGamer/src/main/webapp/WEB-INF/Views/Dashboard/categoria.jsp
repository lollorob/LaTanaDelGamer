<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Crea categoria | Admin"/>
 	<jsp:param name="style" value = "categoria.css"/>
 	<jsp:param name="script" value = "dashboard.js"/>
 </jsp:include>
 
  <% if(session.getAttribute("adminRoles") == null){	
	  response.sendRedirect(request.getContextPath() + "/accounts/loginAdmin"); 
	}%> 

 <script type="text/javascript" src="/LaTanaDelGamer/js/categoria.js"></script>

</head>

	<%	int errore=0;	
 	if(request.getAttribute("error")!=null){
 		errore=(int) request.getAttribute("error");
 	}%>

<body>

	<%@include file="/WEB-INF/Views/PagineComuni/menu.jsp" %> 

	<img src="/LaTanaDelGamer/icone/freccia.svg" alt="Freccia" class="freccia" onmouseover="openMenu()" id="menu">
	
	<div id="contenuto" onClick="closeMenu()">
		 
		<header class="top">
			Benvenuto <%= session.getAttribute("username") %>! Quale operazione desidera effettuare?
		</header>
		
		
		<div class="tabella">
			<form method="post" class="form" action="/LaTanaDelGamer/categorie/crea" name="categoria">
				
					<h4><b>Crea Categoria</b></h4>
					
					<%if (errore==1062){ %>
			<p class="errore">Nome categoria già esistente</p>	
			<%} %>
					
					<div class="riga">
						<div class="nome">
							<label for="nome">Nome</label>
						</div>
						<div class="area">
							<input id="nome" name="nome" type="text" maxlength="70" placeholder="Nome"><br>
						</div>
					</div>
					
					<div class="riga">
						<div class="nome">	
							<label for="didascalia">Didascalia</label>
						</div>
						<div class="area">
							<textarea  id="didascalia" name="didascalia" placeholder="Breve Descrizione"></textarea>
						</div>
					</div>
					
						<button type="submit" class="bottone" onClick="return valida()">Crea</button>

			</form>
			<form action="/LaTanaDelGamer/Dashboard/categorie" method="POST">
				<button class="annulla">Annulla</button>
		</form>
	     </div>	
     </div>	


</body>
</html>