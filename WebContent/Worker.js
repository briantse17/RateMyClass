var i = 0;
var id = 0;
onmessage = function(input){
	var myVar = setInterval(myTimer, 8000);
	i = input.data.currNumRev;
	id = input.data.courseID;
}

function myTimer(){
	var xhttp = new XMLHttpRequest();
	xhttp.open("GET", "checkUpdate?id=" + id, false);
	xhttp.send();
	var text = xhttp.responseText;
	var n = parseInt(text);
	
	if(i<n){
		var diff = n-i;
		postMessage("Please refresh the page, the number of reviews increased by " + diff);
	}
	
}

