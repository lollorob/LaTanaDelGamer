<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp">
    	<jsp:param name="title" value="Registrazione | Cliente"/>
    	<jsp:param name="style" value = "registrazione.css"/>
    	<jsp:param name="script" value = "account.js"/>
  </jsp:include>
</head>
<body>
 	<%@include file="/WEB-INF/Views/Cliente/navbar.jsp" %> 
 	
 	<%	int errore=0;	
 	if(request.getAttribute("error")!=null){
 		errore=(int) request.getAttribute("error");
 	}%>

<div class="reg">
	<section>
		<div class="form-container">
			<h1>Registrati</h1>
		<form name="utente" action="<%=response.encodeURL("/LaTanaDelGamer/it/registrazione")%>" method="POST">
		<%if (errore==1062){ %>
			<p class="errore">Username/Email già esistente</p>	
			<%} %>
		<div class="control">
			<label for="nome">Nome</label>
			<input type="text" name="nome" id="nome" placeholder="Es. Mario">
			</div>
		<div class="control">
			<label for="cognome">Cognome</label>
			<input type="text" name="cognome" id="cognome" placeholder="Es. Rossi">
			</div>
		<div class="control">
			<label for="e_mail">E-Mail</label>
			<input type="text" name="e_mail" id="e_mail" placeholder="Es. prova@prova.pr">
			</div>
		<div class="control">
			<label for="passwd">Password</label>
			<input type="password" name="passwd" id="passwd">
			</div>
		<div class="control">
			<label for="username">Username</label>
			<input type="text" name="username" id="usernameRegistration" placeholder="Username" oninput="checkUser(this)">
			</div>
		<div class="control">
			<label for="datadinascita">Data Di Nascita</label>
			<input type="date" name="datadinascita" id="datadinascita">
			</div>
		<div class="control">
			<label for="via">Via/Strada</label>
			<input type="text" name="via" id="via" placeholder="Es. Via Roma">
			</div>
		<div class="control">
			<label for="numero">Numero</label>
			<input type="text" name="numero" id="numero" placeholder="Es. 25">
			</div>
		<div class="control">
			<label for="cap">CAP</label>
			<input type="text" name="cap" id="cap" placeholder="Es. 80054">
			</div>		
		<div class="control">
			<label for="citta">Città</label>
			<input type="text" name="citta" id="citta" placeholder="Es. Gragnano">
			</div>
		<div class="control">
			<label for="provincia">Provincia</label>
			<input type="text" name="provincia" id="provincia" placeholder="Es. Napoli">
			</div>
			
		<div class="control">
			<input type="submit" onClick="return valida()" value="Registrati">
		</div>
		<div class="link">
			<a href="<%=request.getAttribute("context")%>/it/home">Annulla</a>
		</div>
		
	</form>
		
	</div>
</section>
</div>

<script>
function checkUser(input) {
    //Reperiamo il valore del campo
    var check = input.value;

    //Se non è stato inserito nulla la funzione non viene eseguita
    if(check == "" )
        return false;

    //Un utente non può registrarsi con l'username admin in quanto è username speciale
    //Se è stato inserito questo username la registrazione non può continuare
    if(check.match(/admin/i))
    {
        alert("Username riservato! Inserire un'altro username per continuare");
        reg_input = false;
        return false;
    }
            //Vengono reperiti tutti gli username dal database
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
    	
        if(xhttp.readyState == 4 && xhttp.status == 200)
        {
        	alert(xhttp.responseText);
            var JSONobj = JSON.parse(xhttp.responseText);
            	
			
            var flag = false;

            //Tra tutti gli username si cerca se esiste uno uguale a quello inserito
            for( i = 0; i < JSONobj.length; i++)
            {
                var item = JSONobj[i];
                console.log(item.Username);
                if(item.Username == check)
                    flag = true;
            }

            //Ci reperiamo lo spazio dove viene segnalato se l'username inserito è valido o meno
            var p_block = document.getElementById("errorSpace");

            //Caso in cui l'username è presente
            if(flag)
            {
                //Se è stato creato il p, allora lo modifico
                if(document.getElementById("errorSpace").hasChildNodes())
                {
                    var p = document.getElementById("errorSpace").childNodes[0];
                    p.style.color = "red";
                    p.innerText = "Utente già presente! Inserire un'altro nome";

                }
                //Altrimenti lo creo
                else
                {
                    var tag = document.createElement("p");
                    tag.style.color = "red";
                    tag.style.visibility = "block";
                    var text = document.createTextNode("Utente già presente! Inserire un'altro nome");
                    tag.appendChild(text);
                    p_block.appendChild(tag);
                }

                //Variabile globale necessaria per non fare proseguire la registrazione
                reg_input = false;

            }
            //Caso in cui l'username inserito dall'utente è univoco, ovvero non è presente nel database
            else
            {

                //Se esiste il p allora lo modifico
               if(document.getElementById("errorSpace").hasChildNodes())
               {
                   var p = document.getElementById("errorSpace").childNodes[0];
                   p.style.color = "green";
                   p.innerText = "Nome valido!";


               }
               //Non esiste il p quindi lo creo
               else
               {
                   var tag = document.createElement("p");
                   tag.style.color = "green";
                   tag.style.visibility = "block";
                   var text = document.createTextNode("Nome valido!");
                   tag.appendChild(text);
                   p_block.appendChild(tag);
               }

               //Registrazione avvenuta con successo, si setta la variabile globale a true
                reg_input = true;

            }

        }
    }

    xhttp.open("GET", "AjaxFilter?valore=Utenti", true);
    xhttp.send();

}</script>

</body>
</html>