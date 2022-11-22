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

