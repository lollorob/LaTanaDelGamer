


function successiva(){




	  if(document.getElementsByClassName("immagine-slider1")[0].style.marginLeft==0 || document.getElementsByClassName("immagine-slider1")[0].style.marginLeft=="0px") {
		  document.getElementsByClassName("immagine-slider2")[0].style.visibility="visible";
		  document.getElementsByClassName("immagine-slider2")[0].style.marginLeft="0";
		  document.getElementsByClassName("immagine-slider2")[0].style.transition="0.35s";
		   document.getElementsByClassName("immagine-slider1")[0].style.transition="none";
		  document.getElementsByClassName("immagine-slider1")[0].style.visibility="hidden";
		  document.getElementsByClassName("immagine-slider1")[0].style.marginLeft="800px";
		 
		  return false;
	  }
	  
	   if( document.getElementsByClassName("immagine-slider2")[0].style.marginLeft=="0px") {
	  	  
		  document.getElementsByClassName("immagine-slider3")[0].style.visibility="visible";
		  document.getElementsByClassName("immagine-slider3")[0].style.marginLeft="0";
		  document.getElementsByClassName("immagine-slider3")[0].style.transition="0.35s";
		  document.getElementsByClassName("immagine-slider2")[0].style.visibility="hidden";
		  document.getElementsByClassName("immagine-slider2")[0].style.transition="none";
		  document.getElementsByClassName("immagine-slider2")[0].style.marginLeft="800px";
		  return false;  
	  }
	  
	  if( document.getElementsByClassName("immagine-slider3")[0].style.marginLeft=="0px") {
	  	  
		  document.getElementsByClassName("immagine-slider1")[0].style.visibility="visible";
		  document.getElementsByClassName("immagine-slider1")[0].style.marginLeft="0";
		  document.getElementsByClassName("immagine-slider1")[0].style.transition="0.35s";
		  document.getElementsByClassName("immagine-slider3")[0].style.visibility="hidden";
		  document.getElementsByClassName("immagine-slider3")[0].style.transition="none";
		  document.getElementsByClassName("immagine-slider3")[0].style.marginLeft="800px";
		  return false;  
	  }
	  
}


function precedente(){
		
		 if(document.getElementsByClassName("immagine-slider1")[0].style.marginLeft==0 || document.getElementsByClassName("immagine-slider1")[0].style.marginLeft=="0px") {
		  document.getElementsByClassName("immagine-slider3")[0].style.visibility="visible";
		  document.getElementsByClassName("immagine-slider3")[0].style.marginLeft="0";
		  document.getElementsByClassName("immagine-slider3")[0].style.transition="0.35s";
		   document.getElementsByClassName("immagine-slider1")[0].style.transition="none";
		  document.getElementsByClassName("immagine-slider1")[0].style.visibility="hidden";
		  document.getElementsByClassName("immagine-slider1")[0].style.marginLeft="800px";
		 
		  return false;
	  }
	  
	   if( document.getElementsByClassName("immagine-slider2")[0].style.marginLeft=="0px") {
	  	  
		  document.getElementsByClassName("immagine-slider1")[0].style.visibility="visible";
		  document.getElementsByClassName("immagine-slider1")[0].style.marginLeft="0";
		  document.getElementsByClassName("immagine-slider1")[0].style.transition="0.35s";
		  document.getElementsByClassName("immagine-slider2")[0].style.visibility="hidden";
		  document.getElementsByClassName("immagine-slider2")[0].style.transition="none";
		  document.getElementsByClassName("immagine-slider2")[0].style.marginLeft="800px";
		  return false;  
	  }
	  
	  if( document.getElementsByClassName("immagine-slider3")[0].style.marginLeft=="0px") {
	  	  
		  document.getElementsByClassName("immagine-slider2")[0].style.visibility="visible";
		  document.getElementsByClassName("immagine-slider2")[0].style.marginLeft="0";
		  document.getElementsByClassName("immagine-slider2")[0].style.transition="0.35s";
		  document.getElementsByClassName("immagine-slider3")[0].style.visibility="hidden";
		  document.getElementsByClassName("immagine-slider3")[0].style.transition="none";
		  document.getElementsByClassName("immagine-slider3")[0].style.marginLeft="800px";
		  return false;  
	  }
	
	
}

function checkQuantity(){
		alert("ciao");
		var quantityOriginale=document.addCart.quantityOriginale;
		var quantity=document.addCart.quantity;
		alert("quantità nuova = " +quantity);
		alert("quantità originale = " + quantityOriginale);
		
		if(quantity>quantityOriginale){
			alert("E' presente già la massima quantità acquistabile nel carrello")
			return false;
		}
	}
		
		
