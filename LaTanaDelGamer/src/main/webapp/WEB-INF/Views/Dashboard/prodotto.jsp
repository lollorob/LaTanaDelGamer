<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Crea prodotto | Admin"/>
 	<jsp:param name="style" value = "prodotto.css"/>
 	<jsp:param name="script" value = "dashboard.js"/>
 </jsp:include>
 
  <% if(session.getAttribute("adminRoles") == null){	
	  response.sendRedirect(request.getContextPath() + "/accounts/loginAdmin"); 
	}%> 

   <%
 	Collection<?>  categorie = (Collection<?>)session.getAttribute("listaCategorie");
 
 	if(categorie == null) {
 		System.out.println("Categorie non caricate - prodotto.jsp");
 		
 		return;
 	}
 %>
 <script type="text/javascript" src="/LaTanaDelGamer/js/prodotto.js"></script>

</head>

<body>

	<%@include file="/WEB-INF/Views/PagineComuni/menu.jsp" %> 

	<img src="/LaTanaDelGamer/icone/freccia.svg" alt="Freccia" class="freccia" onmouseover="openMenu()" id="menu">
	
	<div id="contenuto" onClick="closeMenu()">
		 
		<header class="top">
			Benvenuto <%= session.getAttribute("username") %>! Quale operazione desidera effettuare?
		</header>
		
		
		<div class="tabella">
			<form method="post" class="form" action="/LaTanaDelGamer/prodotti/crea" enctype="multipart/form-data" name="prodotto">
				
					<h4><b>Crea Prodotto</b></h4>
					
					
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
							<label for="prezzo">Prezzo</label>
						</div>
						<div class="area">
							<input id="prezzo" name="prezzo" type="text" placeholder="Prezzo"><br>
						</div>
					</div>
					
					<div class="riga">	
						<div class="nome">
							<label for="descrizione">Descrizione</label>
						</div>
						<div class="area">
							<input id="descrizione" name="descrizione" type="text" maxlength="500" placeholder="Descrizione"><br>
						</div>
					</div>
					
					<div class="riga">	
						<div class="nome">
							<label for="descrizione">Data Di Uscita</label>
						</div>
						<div class="area">
							<input type="date" name="datadiuscita" id="datadiuscita"><br>
						</div>
					</div>
					
					<div class="riga">	
						<div class="nome">
							<label for="casaproduttrice">Casa produttrice</label>
						</div>
						<div class="area">
							<input id="casaproduttrice" name="casaproduttrice" type="text" maxlength="50" placeholder="Casa Produttrice" ><br>
						</div>
					</div>
						
					<div class="riga">	
						<div class="nome">
							<label for="quantita">Quantità</label>
						</div>
						<div class="area">
							<input id="quantita" name="quantita" type="text" placeholder="Quantità"><br>
						</div>
					</div>
					
					<div class="riga">	
						<div class="nome">
							<label for="copertina">Copertina</label>
						</div>
						<div class="area">
							<input id="copertina" name="copertina" type="file" placeholder="Copertina"><br>
						</div>
					</div>

					<div class="riga">
						<div class="nome">	
							<label for="nome_categoria">Categoria</label>
						</div>
								<select id="nome_categoria" name="nome_categoria">
								 <%
		if(categorie != null && categorie.size() > 0) {
			
			Iterator<?> it = categorie.iterator();
			while(it.hasNext()) {
				CategoriaBean bean = (CategoriaBean)it.next();
			
	%>
									<option value="<%= bean.getNome() %>"><%= bean.getNome() %></option>
									  <%		}
		} %>
								</select>
					</div>	
					   
					
						<button type="submit" class="bottone" onClick="return valida()">Crea</button>
					
				
			</form>
			<form action="/LaTanaDelGamer/Dashboard/prodotti" method="POST">
						<button class="annulla">Annulla</button>
			</form>
	     </div>	
     </div>	


</body>
</html>