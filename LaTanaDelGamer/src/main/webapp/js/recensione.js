/**
 * 
 */

 
 function valida() {
	var nome = document.recensioneForm.nomeUtente;
	var descrizione = document.recensioneForm.descrizione;

	
		if(nome.value.length < 4 || nome.value.length > 12 ) {
			alert("Il campo nome deve contenere tra i 5 e i 12 caratteri");
			nome.focus();
			return false;
		}
		
		if (descrizione.value.length == 0 || descrizione.value.length >= 500 || descrizione.value.length < 10){
			alert("Il campo descrizione deve contenere tra i "+10+" e i "+500 +" caratteri!");
			descrizione.focus();
			return false;
		}
}