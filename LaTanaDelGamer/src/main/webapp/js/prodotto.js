/**
 * 
 */


function valida(){
	
	var nome=document.prodotto.nome;
	var prezzo=document.prodotto.prezzo;
	var descrizione=document.prodotto.descrizione;
	var casaproduttrice=document.prodotto.casaproduttrice;
	var quantita=document.prodotto.quantita;
	var copertina=document.prodotto.copertina.value;
	
	var intero = /^[+]?[0-9]+$/;
	var decimale = /^[+]?[0-9]+\.[0-9]+$/;

	
	
	if (nome.value.length <4){
		alert("Il campo nome deve contenere almeno 4 caratteri!");
		nome.focus();
		return false;
	}
	
	if(!prezzo.value.match(decimale)){
		alert('Formato corretto prezzo: numero.numero');
		prezzo.focus();
		return false;
	}
	
	if(prezzo.value<0.01){
		alert('Valore minimo prezzo: 0.01');
		prezzo.focus();
		return false;
	}
	
	if (descrizione.value.length == 0 || descrizione.value.length >= 500 || descrizione.value.length < 10){
			alert("Il campo descrizione deve contenere tra i "+10+" e i "+500 +" caratteri!");
			descrizione.focus();
			return false;
	}
	

	if (casaproduttrice.value.length == 0 || casaproduttrice.value.length >= 50 || casaproduttrice.value.length < 5){
			alert("Il campo Casa Produttrice deve contenere tra i "+5+" e i "+50+" caratteri!");
			casaproduttrice.focus();
			return false;
	}
	
	
	if(quantita.value<1){
		alert('Valore minimo quantità: 1');
		quantita.focus();
		return false;
	}
	
	if(!quantita.value.match(intero)){
		alert('Inserire solo quantità intere positive');
		prezzo.focus();
		return false;
	}


	var estensione= getExt(copertina);
	if (!((estensione == "jpg") || (estensione == "jpeg") || (estensione== "png"))) {
        alert("Per favore carica un immagine! (png/jpeg/jpg)");
        return false;
    }
}


function getExt(filename) {
    var dot_pos = filename.lastIndexOf(".");
    if (dot_pos == -1) {
        return "";
    }
    return filename.substr(dot_pos + 1).toLowerCase();
}