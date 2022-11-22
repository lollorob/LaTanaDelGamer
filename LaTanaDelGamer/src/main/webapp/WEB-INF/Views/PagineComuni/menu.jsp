	<div id="sidebar" onmouseleave="closeMenu()">
		<h3>Pannello</h3>
		<nav>
			
		 	<ul >
		 		<li><a href="<%= request.getAttribute("context")%>/Dashboard/home" ">Home</a>
		 		<li><a href="<%= request.getAttribute("context")%>/Dashboard/account">Utenti Registrati</a>
		 		<li><a href="<%= request.getAttribute("context")%>/Dashboard/ordini">Ordini</a>
		 		<li><a href="<%= request.getAttribute("context")%>/Dashboard/categorie">Categorie</a>
		 		<li><a href="<%= request.getAttribute("context")%>/Dashboard/prodotti">Prodotti</a>
		 		<li><a href="<%=request.getAttribute("context")%>/Dashboard/logout">Disconnetti</a>	
		 	</ul>
	 	</nav>
	
	</div>