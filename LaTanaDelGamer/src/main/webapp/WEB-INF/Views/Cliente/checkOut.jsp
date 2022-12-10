<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>

<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Carrello | Check Out"/>
 	<jsp:param name="style" value = "modificaAccount.css"/>
 	<jsp:param name="script" value = "modificaAccount.js"/>
 </jsp:include>
 </head>
<body>
 	<%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %> 
 	
 				<div class="pagina1">
				<section>
				<div class="form-container">
					<h1><b>Concludi Il Tuo Ordine</b></h1>
					
	          		<form  method="POST" name="utente1" class="form"  action="/LaTanaDelGamer/it/acquista" name="utente">
	
					
						<div class="control">	
							<div class="first"> 				
								<label for="email_spedizione">E-Mail Spedizione:</label>
							</div>	
							<div class="second">				
							    <input class="update" id="email_spedizione" name="email_spedizione" type="text" placeholder="Inserisci E-Mail Spedizione"><br>
					    	</div>
					    </div>
					
						<div class="control">
							<div class="first"> 	
								<label for="tipo_pagamento">Circuito Di Pagamento:</label>
							</div>
							<div class="second">
							<select class="update" id="tipo_pagamento" name="tipo_pagamento">
							<option value="MasterCard"> MasterCard </option>
							<option value="Visa"> Visa </option>
							<option value="AmericanExpress"> AmericanExpress </option>
							<option value="Discover"> Discover </option>
							<option value="JCB"> JBC </option>
							</select><br>	
					    	</div>
					    </div>
					
						<div class="control">
							<div class="first"> 	
								<label for="metodo_pagamento">Numero Di Carta:</label>
							</div>
							<div class="second">
							<input class="update" id="metodo_pagamento" name="metodo_pagamento" type="text" placeholder="1111 1111 1111 1111"><br>
					    	</div>
					    </div>
						<div class="control1">
							<input class="inputAggiorna" type="submit" value="Compra Prodotti">
						</div>
						
						<div class="link">
							<a class="alink" href="<%=request.getAttribute("context")%>/it/mostraCarrello">Torna Al Carrello</a>
						</div>
					</form>
				</div>
			</section>
		</div>
		
		<%@include file="/WEB-INF/Views/Cliente/footer.jsp" %> 
</body>
</html>