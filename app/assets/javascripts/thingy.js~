document.time = new Date();
document.current_length = 0;
function k(){
    if (document.body.scrollHeight == document.body.scrollTop + window.innerHeight) {
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
	    if (xmlhttp.readyState == 4 ) {
	       if(xmlhttp.status == 200){
		  console.log(xmlhttp.responseText);
		  document.getElementById("posts_div").innerHTML += xmlhttp.responseText;
		  document.current_length += 20;
	       }else if(xmlhttp.status == 400) {
		  alert('There was an error 400')
	       }
	    else {
	      alert('something else other than 200 was returned')
	    }
	  }
	}
	xmlhttp.open("GET", "/append_feed/?"+"time=" + encodeURI(document.time.toString()) + "&current_length=" + encodeURI(document.current_length.toString()), true);
	xmlhttp.send();
    }
}


document.addEventListener('scroll', function (event) {
  k();
});

window.onload = function() {
  k();
};
