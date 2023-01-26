/**
 * 
 */
function valida() {

	var username = document.utente.username;
	var passwd = document.utente.passwd;
	var email = document.utente.e_mail;
	var nome = document.utente.nome;
	var cognome = document.utente.cognome;
	var data = document.utente.datadinascita;
	var via = document.utente.via;
	var citta = document.utente.citta;
	var numero = document.utente.numero;
	var provincia = document.utente.provincia;
	var cap = document.utente.cap;
	
	var intero = /^[+]?[0-9]+$/;
	var datas = /^[0-9]{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$/;	
	var password = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var lettere = /^[A-Za-z ]+$/;
	
	if(username.value.length < 4 || username.value.length > 12 ) {
		alert("Il campo username deve contenere tra i 5 e i 12 caratteri");
		username.focus();
		return false;
	}
	
	if(!passwd.value.match(password)) {
		alert("Il campo password deve contenere almeno 1 numero, 1 lettera maiuscola e 1 minuscola");
		passwd.focus();
		return false;
	}
	
	if(!email.value.match(mailformat)) {
		alert("Formato email sbagliato");
		email.focus();
		return false;
	}
	
	if(nome.value.length < 3 || nome.value.length > 50 || !nome.value.match(lettere)) {
		alert("Inserisci un nome corretto");
		nome.focus();
		return false;
	}
	
	if( cognome.value.length < 3 || cognome.value.length > 50 || !cognome.value.match(lettere)) {
		alert("Inserisci un cognome corretto");
		cognome.focus();
		return false;
	}	
	
	if(!data.value.match(datas)) {
		alert("Formato corretto Data Di Nascita: AAAA-MM-GG");
		data.focus();
		return false;
	}	
	
	if(via.value.length < 2 || via.value.length > 50) {
		alert("Inserisci una via corretta");
		via.focus();
		return false;
	}
	
	if(!numero.value.match(intero)){
		alert("Inserire solo numeri positivi");
		numero.focus();
		return false;
	}
	
	if(numero.value.length < 1){
		alert("Inserisci un numero valido");
		numero.focus();
		return false;
	}	
	
	if(cap.value.length < 5){
		alert("Inserire un cap formato da 5 cifre");
		cap.focus();
		return false;
	}
		
	if(!cap.value.match(intero)){
		alert("Inserire un cap formato da 5 cifre");
		cap.focus();
		return false;
	}
		
	if(citta.value.length < 2 || citta.value.length > 50) {
		alert("Inserire una città corretta");
		citta.focus();
		return false;
	}
	
	if(provincia.value.length < 2 || provincia.value.length > 50) {
		alert("Inserire una provincia valida");
		provincia.focus();
		return false
	}
	
}



function valida1() {

	var username = document.utente1.username;
	var email = document.utente1.e_mail;
	var nome = document.utente1.nome;
	var cognome = document.utente1.cognome;
	var data = document.utente1.datadinascita;
	var via = document.utente1.via;
	var citta = document.utente1.citta;
	var numero = document.utente1.numero;
	var provincia = document.utente1.provincia;
	var cap = document.utente1.cap;
	
	var intero = /^[+]?[0-9]+$/;
	var datas = /^[0-9]{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$/;	
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var lettere = /^[A-Za-z ]+$/;
	
	if(username.value.length < 4 || username.value.length > 12 ) {
		alert("Il campo username deve contenere tra i 5 e i 12 caratteri");
		username.focus();
		return false;
	}
	
	
	
	if(!email.value.match(mailformat)) {
		alert("Formato email sbagliato");
		email.focus();
		return false;
	}
	
	if(nome.value.length < 3 || nome.value.length > 50 || !nome.value.match(lettere)) {
		alert("Inserisci un nome corretto");
		nome.focus();
		return false;
	}
	
	if( cognome.value.length < 3 || cognome.value.length > 50 || !cognome.value.match(lettere)){
		alert("Inserisci un cognome corretto");
		cognome.focus();
		return false;
	}	
	
	if(!data.value.match(datas)) {
		alert("Formato corretto Data Di Nascita: AAAA-MM-GG");
		data.focus();
		return false;
	}	
		

	if(via.value.length < 2 || via.value.length > 50) {
		alert("Inserisci una via corretta");
		via.focus();
		return false;
	}
	
	if(!numero.value.match(intero)){
		alert("Inserire solo numeri positivi");
		numero.focus();
		return false;
	}
	
	if(numero.value.length < 1){
		alert("Inserisci un numero valido");
		numero.focus();
		return false;
	}
	
	if(cap.value.length < 5){
		alert("Inserire un cap formato da 5 cifre");
		cap.focus();
		return false;
	}
		
	if(!cap.value.match(intero)){
		alert("Inserire un cap formato da 5 cifre");
		cap.focus();
		return false;
	}	
	
	if(citta.value.length < 2 || citta.value.length > 50) {
		alert("Inserire una città corretta");
		citta.focus();
		return false;
	}
	
	if(provincia.value.length < 2 || provincia.value.length > 50) {
		alert("Inserire una provincia valida");
		provincia.focus();
		return false
	}	
}

function checkUser(input) {
	
    //Reperiamo il valore del campo
    let temp = input.value;
    let check = temp.toLowerCase();
    
    if(input.value.length <= 4 && input.value.length >= 1) {
	
	  var p_block = document.getElementById("errorSpace");
	  if(document.getElementById("errorSpace").hasChildNodes())
                {
                    var p = document.getElementById("errorSpace").childNodes[0];
                    p.style.color = "red";
                    p.innerText = "Inserire almeno 5 caratteri";

                }
                //Altrimenti lo creo
                else
                {
                    var tag = document.createElement("p");
                    tag.style.color = "red";
                    tag.style.visibility = "block";
                    var text = document.createTextNode("Inserire almeno 5 caratteri");
                    tag.appendChild(text);
                    p_block.appendChild(tag);
                }
                
	  return false;
	} else  if(input.value.length > 12) {
	
	  var p_block = document.getElementById("errorSpace");
	  if(document.getElementById("errorSpace").hasChildNodes())
                {
                    var p = document.getElementById("errorSpace").childNodes[0];
                    p.style.color = "red";
                    p.innerText = "Inserire massimo 12 caratteri";

                }
                //Altrimenti lo creo
                else
                {
                    var tag = document.createElement("p");
                    tag.style.color = "red";
                    tag.style.visibility = "block";
                    var text = document.createTextNode("Inserire massimo 12 caratteri");
                    tag.appendChild(text);
                    p_block.appendChild(tag);
                }
                
	  return false;
	} 
	
	else  {

    //Se non è stato inserito nulla la funzione non viene eseguita
    if(check == "" ) {
        
        if(document.getElementById("errorSpace").hasChildNodes()){
           var p = document.getElementById("errorSpace").childNodes[0];
           p.remove();
        }
    return false;
    }
    
    //Un utente non può registrarsi con l'username admin in quanto è username speciale
    //Se è stato inserito questo username la registrazione non può continuare
    if(check.match(/admin/i))
    {
        alert("Username riservato! Inserire un altro username per continuare");
        input.value = "";
        var p = document.getElementById("errorSpace").childNodes[0];
        p.remove();
        return false;
    }
            //Vengono reperiti tutti gli username dal database
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
    	
        if(xhttp.readyState == 4 && xhttp.status == 200)
        {	
            var JSONobj = JSON.parse(xhttp.responseText);

			
            var flag = false;

            //Tra tutti gli username si cerca se esiste uno uguale a quello inserito
            for( i = 0; i < JSONobj.length; i++)
            {
                var item = JSONobj[i];
                if(item.username == check)
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
                    p.innerText = "Utente già presente! Inserire un altro nome";

                }
                //Altrimenti lo creo
                else
                {
                    var tag = document.createElement("p");
                    tag.style.color = "red";
                    tag.style.visibility = "block";
                    var text = document.createTextNode("Utente già presente! Inserire un altro nome");
                    tag.appendChild(text);
                    p_block.appendChild(tag);
                }
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
            }

        }
    }

    xhttp.open("GET", "/LaTanaDelGamer/gestione?valore=Utenti", true);
    xhttp.send();}
}

function checkEmail(input) {
	
    //Reperiamo il valore del campo
    let temp = input.value;
    let check = temp.toLowerCase();
            //Vengono reperiti tutti gli username dal database
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
    	
        if(xhttp.readyState == 4 && xhttp.status == 200)
        {	
            var JSONobj = JSON.parse(xhttp.responseText);

			
            var flag = false;

            //Tra tutte le email si cerca se esiste una uguale a quella inserita
            for( i = 0; i < JSONobj.length; i++)
            {
                var item = JSONobj[i];
                if(item.e_mail == check)
                    flag = true;
            }

            //Ci reperiamo lo spazio dove viene segnalato se la mail inserita è valida o meno
            var p_block = document.getElementById("errorSpace1");
            
                if(check == "" ) {
        
        if(document.getElementById("errorSpace1").hasChildNodes()){
           var p = document.getElementById("errorSpace1").childNodes[0];
           p.remove();
        }
    return false;
    }

            //Caso in cui la mail è presente
            if(flag)
            {
                //Se è stato creato il p, allora lo modifico
                if(document.getElementById("errorSpace1").hasChildNodes())
                {
                    var p = document.getElementById("errorSpace1").childNodes[0];
                    p.style.color = "red";
                    p.innerText = "E-Mail già presente!";

                }
                //Altrimenti lo creo
                else
                {
                    var tag = document.createElement("p");
                    tag.style.color = "red";
                    tag.style.visibility = "block";
                    var text = document.createTextNode("E-Mail già presente!");
                    tag.appendChild(text);
                    p_block.appendChild(tag);
                }
            }
            //Caso in cui la mail inserita dall'utente è univoca, ovvero non è presente nel database
            else
            {

                //Se esiste il p allora lo modifico
               if(document.getElementById("errorSpace1").hasChildNodes())
               {
                   var p = document.getElementById("errorSpace1").childNodes[0];
                   p.style.color = "green";
                   p.innerText = "Email Valida!";


               }
               //Non esiste il p quindi lo creo
               else
               {
                   var tag = document.createElement("p");
                   tag.style.color = "green";
                   tag.style.visibility = "block";
                   var text = document.createTextNode("Email Valida!");
                   tag.appendChild(text);
                   p_block.appendChild(tag);
               }
            }

        }
    }

    xhttp.open("GET", "/LaTanaDelGamer/gestione?valore=Utenti", true);
    xhttp.send();}

        
       

