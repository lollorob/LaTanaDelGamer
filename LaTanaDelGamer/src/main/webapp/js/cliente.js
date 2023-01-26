var widthDiv = $('#prodotti').width();
var widthDivMax = widthDiv+50;


jQuery.extend({
	rand: function(val) {
            return Math.floor(val * (Math.random() % 1))+1;
	}
});


var intervalId = window.setInterval(function(){
	var num = $.rand(18);
	$("#pagina1").css('background', 'linear-gradient(rgba(0, 0, 0, 0.50), rgba(0, 0, 0, 0.8)), url(/LaTanaDelGamer/immagini/sfondo'+num+'.jpg)');
	$("#pagina1").css('width', '100%');
	$("#pagina1").css('height', '100%');
	$("#pagina1").css('background-position', 'center center');
	$("#pagina1").css('position', 'relative');
	$("#pagina1").css('box-shadow', '0 0 60px 60px #000000 inset');
	$("#pagina1").css('color', 'white');
	
  
}, 7000);

$( ".prodotto").mouseover(function(){
	$( this ).css('transition' , '0.15s');
    $( this ).css('height' , '360px');

	   
})
                 .mouseleave(function(){
	$( this ).css('transition' , '0.15s')  
    $( this ).css('height' , '340px');
     
});


var intervalSlider = window.setInterval(function(){
	
	if($( '.immagine-slider1' ).css('marginLeft') == 0 || $( '.immagine-slider1' ).css('marginLeft') == "0px") {
		
		$(".immagine-slider2").css('visibility', 'visible');
		$(".immagine-slider2").css('marginLeft', '0');
		$(".immagine-slider2").css('transition', '0.35s');
		$(".immagine-slider1").css('transition', 'none');
		$(".immagine-slider1").css('visibility', 'hidden');
		$(".immagine-slider1").css('marginLeft', '800px');
		return false;
		}
  
  	if($( '.immagine-slider2' ).css('marginLeft') == "0px") {
	
		$('.immagine-slider3').css('visibility', 'visible');
		$('.immagine-slider3').css('marginLeft', '0');
		$('.immagine-slider3').css('transition', '0.35s');
		$('.immagine-slider2').css('transition', 'none');
		$('.immagine-slider2').css('visibility', 'hidden');
		$('.immagine-slider2').css('marginLeft', '800px');
		return false;
		}
		
    if($( '.immagine-slider3' ).css('marginLeft') == "0px") {
	
		$('.immagine-slider1').css('visibility', 'visible');
		$('.immagine-slider1').css('marginLeft', '0');
		$('.immagine-slider1').css('transition', '0.35s');
		$('.immagine-slider3').css('transition', 'none');
		$('.immagine-slider3').css('visibility', 'hidden');
		$('.immagine-slider3').css('marginLeft', '800px');
		return false;
		}
}, 5000);




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
		
