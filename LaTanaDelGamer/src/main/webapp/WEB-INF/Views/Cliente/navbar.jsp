<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Home"/>
 	<jsp:param name="style" value = "navbar.css"/>
 	<jsp:param name="script" value = "navbar.js"/>
 </jsp:include>
 
 </head>
    
 		<section class="navbar">
 		<div class="laterale">
 			
 		</div>
 			<div class="contenuto">
 				<div class="logo">
 					<a href="./home">La Tana Del Gamer</a>
 				</div>
 				<nav>
 					<div class="mobile"><img class="icona" onclick="openMenu()" src="/LaTanaDelGamer/icone/menu.png" onclick="mostraMenu()"><span></span></div>
 					<ul class="lista">
 						<li>
 							<a href="./home">Home</a>
 						</li>
 						<li>
 							<a href="#" onmouseover="mostra()" onmouseleave="nascondi()">Categorie  ▾</a>
 							<ul class="dropMenu" onmouseover="mostra()" onmouseleave="nascondi()">
 								<li>
 									<a href="#">Azione</a>
 									<a href="#">Avventura</a>
 									<a href="#">GDR</a>
 									<a href="#">Simulazione</a>
 									<a href="#">Sportivi</a>
 									<a href="#">Guida</a>
 									<a href="#">Mostra tutto</a>
 								</li>
 							</ul>
 						</li>
 						<li>
 							<a href="#" onmouseover="mostra1()" onmouseleave="nascondi1()">Profilo   ▾</a>
 							<ul class="dropMenu" onmouseover="mostra1()" onmouseleave="nascondi1()">
 								<li>
 									<a href="<%=request.getAttribute("context")%>/cliente/ordini">I miei ordini</a>
 									<a href="#">Modifica</a>
 									<a href="#">Elimina</a>
 								</li>
 							</ul>
 						</li>
 						
 						<li>
 							<a href="<%=request.getAttribute("context")%>/cliente/login">Login</a>
 						</li>
 						
 						<li>
 							<a href="#"><img class="carrello" src="/LaTanaDelGamer/icone/carrello.png" alt="Carrello"></a>
 						</li>
 						
 						<li>
 							<a><input type="search"  class="cerca" placeholder="Cerca sul sito"></a>
 						</li>
 					</ul>
 				</nav>
 				
 				
 			</div>
 		
 		</section>
 		