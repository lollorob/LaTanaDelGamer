/**
 * 
 */
 
 function valida() {
	var email = document.utente1.email_spedizione;
	var metodoPagamento = document.utente1.metodo_pagamento;
	
	
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var decimal = /^[+]?[0-9]+$/;
	
	if(!email.value.match(mailformat)) {
		alert("Formato email sbagliato");
		email.focus();
		return false;
	}
	
	if(metodoPagamento.value.length != 16) {
		alert("Inserisci un numero di 16 cifre");
		metodoPagamento.focus();
		return false;
	}
	
	if(!metodoPagamento.value.match(decimal)) {
		alert("Inserisci 16 cifre(Numeri non Lettere)");
		metodoPagamento.focus();
		return false;
	}
	

}