/**
 * 
 */


function valida(){
	var uid=document.login.username;
	var passid=document.login.passwd;
	var mx=5;
	var my=12;
	
	if (uid.value.length == 0 || uid.value.length >= my || uid.value.length < mx){
			alert("Il campo username deve contenere tra i "+mx+" e i "+my +" caratteri!");
			uid.focus();
			return false;
	}
	
	if (passid.value.length == 0 || passid.value.length >= my || passid.value.length < mx){
			alert("Il campo password deve contenere tra i "+mx+" e i "+my +" caratteri!");
			passid.focus();
			return false;
	}
	
	
    
}

	