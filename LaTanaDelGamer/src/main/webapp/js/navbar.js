/**
 * 
 */

function mostra(){
	 document.getElementsByClassName("dropMenu")[0].style.display = "block";
}

function nascondi(){
	document.getElementsByClassName("dropMenu")[0].style.display = "none";
}

function mostra1(){
	 document.getElementsByClassName("dropMenu")[1].style.display = "block";
}

function nascondi1(){
	document.getElementsByClassName("dropMenu")[1].style.display = "none";
}


function openMenu(){
	document.getElementsByClassName("laterale")[0].style.transition ="0.5s";
	document.getElementsByClassName("laterale")[0].style.marginRight ="0";
	document.getElementsByClassName("laterale")[0].style.position ="absolute";
	

	document.getElementsByClassName("lista")[0].style.marginRight ="0";
	document.getElementsByClassName("lista")[0].style.transition ="0.5s";
	document.getElementsByClassName("lista")[0].style.position ="absolute";
	
	
	document.getElementsByClassName("icona")[0].src="/LaTanaDelGamer/icone/xMenu.png";
	document.getElementsByClassName("icona")[0].style.width="25px";
	document.getElementsByClassName("icona")[0].style.transform="translate(10px,25px)"
	document.getElementsByClassName("icona")[0].style.transition="0.3s"
	document.getElementsByClassName("icona")[0].setAttribute("onClick", "closeMenu()")
}

function closeMenu(){
	document.getElementsByClassName("laterale")[0].style.transition ="0.5s";
	document.getElementsByClassName("laterale")[0].style.marginRight ="-250px";
	document.getElementsByClassName("laterale")[0].style.position ="fixed";
	
	document.getElementsByClassName("lista")[0].style.transition ="0.5s";
	document.getElementsByClassName("lista")[0].style.marginRight ="-250px";
	document.getElementsByClassName("lista")[0].style.position ="fixed";	
	
	document.getElementsByClassName("icona")[0].src="/LaTanaDelGamer/icone/menu.png";
	document.getElementsByClassName("icona")[0].style.width="40px";
	document.getElementsByClassName("icona")[0].style.transform="translateY(15px)";
	document.getElementsByClassName("icona")[0].style.transition="0.3s"
	document.getElementsByClassName("icona")[0].setAttribute("onClick", "openMenu()")
}