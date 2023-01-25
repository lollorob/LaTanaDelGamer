/**
 * 
 */

function valida(){
	
	var nome=document.categoria.nome;
	var didascalia=document.categoria.didascalia;

	
	var intero = /^[+]?[0-9]+$/;
	var decimale = /^[+]?[0-9]+\.[0-9]+$/;
	
	if (nome.value.length <4){
		alert("Il campo nome deve contenere almeno 4 caratteri!");
		nome.focus();
		return false;
	}
	
	if (didascalia.value.length == 0 || didascalia.value.length >= 500 || didascalia.value.length < 10){
			alert("Il campo didascalia deve contenere tra i "+10+" e i "+500 +" caratteri!");
			didascalia.focus();
			return false;
	}
}
function checkCategories(input) {
	
    //Reperiamo il valore del campo
    let temp = input.value;
    let check = temp.toLowerCase();
    
    if(input.value.length <= 4 && input.value.length >= 1) {
	
	  var p_block = document.getElementById("errorSpace");
	  if(document.getElementById("errorSpace").hasChildNodes())
                {
                    var p = document.getElementById("errorSpace").childNodes[0];
                    p.style.color = "red";
                    p.innerText = "Inserire almeno 4 caratteri";

                }
                //Altrimenti lo creo
                else
                {
                    var tag = document.createElement("p");
                    tag.style.color = "red";
                    tag.style.visibility = "block";
                    var text = document.createTextNode("Inserire almeno 4 caratteri");
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
    
            //Vengono reperiti tutte le categorie dal database
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
    	
        if(xhttp.readyState == 4 && xhttp.status == 200)
        {	
            var JSONobj = JSON.parse(xhttp.responseText);

			
            var flag = false;

            //Tra tutte le categorie si cerca se esiste una uguale a quella inserita
            for( i = 0; i < JSONobj.length; i++)
            {
                var item = JSONobj[i];
                if(item.nome.toLowerCase() == check)
                    flag = true;
            }

            //Ci reperiamo lo spazio dove viene segnalato se la categoria inserita è valida o meno
            var p_block = document.getElementById("errorSpace");

            //Caso in cui la categoria è presente
            if(flag)
            {
                //Se è stato creato il p, allora lo modifico
                if(document.getElementById("errorSpace").hasChildNodes())
                {
                    var p = document.getElementById("errorSpace").childNodes[0];
                    p.style.color = "red";
                    p.innerText = "Categoria già presente!";

                }
                //Altrimenti lo creo
                else
                {
                    var tag = document.createElement("p");
                    tag.style.color = "red";
                    tag.style.visibility = "block";
                    var text = document.createTextNode("Categoria già presente!");
                    tag.appendChild(text);
                    p_block.appendChild(tag);
                }
            }
            //Caso in cui la categoria inserita dall'utente è univoca, ovvero non è presente nel database
            else
            {

                //Se esiste il p allora lo modifico
               if(document.getElementById("errorSpace").hasChildNodes())
               {
                   var p = document.getElementById("errorSpace").childNodes[0];
                   p.style.color = "green";
                   p.innerText = "Nome Categoria valido!";


               }
               //Non esiste il p quindi lo creo
               else
               {
                   var tag = document.createElement("p");
                   tag.style.color = "green";
                   tag.style.visibility = "block";
                   var text = document.createTextNode("Nome Categoria valido!");
                   tag.appendChild(text);
                   p_block.appendChild(tag);
               }
            }

        }
    }

    xhttp.open("GET", "/LaTanaDelGamer/gestione?valore=Categoria", true);
    xhttp.send();}
    }

