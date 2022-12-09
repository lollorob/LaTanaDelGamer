


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
/*
function checkQuantity(){
		
		var quantityOriginale=document.addCart.quantityOriginale;
		var quantity=document.addCart.quantity;
		var id_prodotto=document.getElementById('id');
		
		alert("id " + id_prodotto.value);
		alert("quantità massima " + quantityOriginale.value);
		alert("quantità attuale " + quantity.value);
		
		
		
		if(quantity.value>quantityOriginale.value){
			alert("E' presente già la massima quantità acquistabile nel carrello")
			return false;
		}
	}
	*/	
		
