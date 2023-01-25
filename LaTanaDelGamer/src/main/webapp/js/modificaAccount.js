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
	
	if(!email.value.match(mailformat)) {
		alert("Formato email sbagliato");
		email.focus();
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

