function getAllMess(){
$.post("Browse_getAllMess",
	    {},
     function(responseText, textStatus, XMLHttpRequest){
    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
    	document.getElementById("all").innerHTML=responseText;
    });
} 
function getChoiceMess(){
	$.post("Browse_getChoiceMess",
		    {},
	     function(responseText, textStatus, XMLHttpRequest){
	    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
	    	/* $('#choice').hide(); */
	    	document.getElementById("choice").innerHTML=responseText;
	    });
}
function getWishMess(){
	$.post("Browse_getWishMess",
		    {},
	     function(responseText, textStatus, XMLHttpRequest){
	    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
	    	/* $('#choice').hide(); */
	    	document.getElementById("wish").innerHTML=responseText;
	    });
}
function getLoveMess(){
	$.post("Browse_getLoveMess",
		    {},
	     function(responseText, textStatus, XMLHttpRequest){
	    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
	    	/* $('#choice').hide(); */
	    	document.getElementById("love").innerHTML=responseText;
	    });
}
function getFriendMess(){
	$.post("Browse_getFriendMess",
		    {},
	     function(responseText, textStatus, XMLHttpRequest){
	    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
	    	/* $('#choice').hide(); */
	    	document.getElementById("friend").innerHTML=responseText;
	    });
}
function getFunnyMess(){
	$.post("Browse_getFunnyMess",
		    {},
	     function(responseText, textStatus, XMLHttpRequest){
	    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
	    	/* $('#choice').hide(); */
	    	document.getElementById("funny").innerHTML=responseText;
	    });
}
function getSadMess(){
	$.post("Browse_getSadMess",
		    {},
	     function(responseText, textStatus, XMLHttpRequest){
	    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
	    	/* $('#choice').hide(); */
	    	document.getElementById("sad").innerHTML=responseText;
	    });
}
function getOtherMess(){
	$.post("Browse_getOtherMess",
		    {},
	     function(responseText, textStatus, XMLHttpRequest){
	    	this;//在这里this指向的是当前的DOM对象，即$(".ajax.load")[0]
	    	/* $('#choice').hide(); */
	    	document.getElementById("other").innerHTML=responseText;
	    });
}
window.setInterval(getChoiceMess,1000);
window.setInterval(getAllMess,1000);
window.onload=function(){
	getChoiceMess();
	getAllMess();
	getAllMess();
	getAllMess();
	getAllMess();
	getAllMess();
	getAllMess();
	getAllMess(); 
};