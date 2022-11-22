<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Categorie | Admin"/>
 	<jsp:param name="style" value = "categorie.css"/>
 	<jsp:param name="script" value = "dashboard.js"/>
 </jsp:include>
 
  <% if(session.getAttribute("adminRoles") == null){	
	  response.sendRedirect(request.getContextPath() + "/accounts/loginAdmin"); 
	}%> 
 
  <%
 	Collection<?> categorie = (Collection<?>)session.getAttribute("listaCat");
 
 	if(categorie == null) {
 		System.out.println("Collection Categorie NULL");
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
		<div class="selezione">
			<a class="add" href="/LaTanaDelGamer/categorie/crea">Aggiungi Categoria</a>
	 	</div>
	 	<div id="tabella"> 
    <table> 
       <thead> 
          <tr> 
        <th>Nome</th>
        <th>Didascalia</th>
          </tr> 
               <%
		if(categorie != null && categorie.size() > 0) {
			
			Iterator<?> it = categorie.iterator();
			while(it.hasNext()) {
				CategoriaBean bean = (CategoriaBean)it.next();
			
	%>
       </thead> 
       <tbody> 
          <tr> 
             <td data-title="Nome"><%=bean.getNome() %></td> 
             <td data-title="Didascalia"><%=bean.getDidascalia() %></td>
          </tr>
      <% }
		} else { %>
		<tr>
			<td colspan="15">Non ci sono Categorie</td>
		</tr>
	<% } %> 
       </tbody>
    </table> 
 </div>
       		
       	</div>	


</body>
</html>