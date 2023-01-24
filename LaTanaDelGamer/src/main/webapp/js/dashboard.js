/**
 * 
 */

function openMenu(){
	document.getElementById("sidebar").style.marginLeft ="0";
	document.getElementById("contenuto").style.marginLeft ="200px";
	document.getElementById("menu").style.marginLeft ="200px";
	/*document.body.style.backgroundColor = '#b8b8b8';*/
	
}

function closeMenu(){
	document.getElementById("sidebar").style.marginLeft ="-200px";
	document.getElementById("contenuto").style.marginLeft ="0";
	document.getElementById("menu").style.marginLeft ="0px";
	/*document.body.style.backgroundColor = '#f3f5f9' */
}

function checkUser(input) {
	
    //Reperiamo il valore del campo
    var check = input.value;
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
        alert("Username riservato! Inserire un'altro username per continuare");
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
        
       

 