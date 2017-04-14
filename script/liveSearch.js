

  function showResult(str) {

  	if (str.length===0) {
      document.getElementById("livesearch").innerHTML="";
      return;
    }

  	httpRequest = new XMLHttpRequest();
  	//its a js api (virtual object) has properties and events

  	if (!httpRequest) {
  		//if its too old it wont have the object built in
  		console.log('this will not work on your computer');
  		return false;
  	}
  	httpRequest.onreadystatechange = showImage;
  	httpRequest.open('GET', 'includes/livesearch.php' + '?search=' + str);
  	httpRequest.send();
  }

  	function showImage() {
  		if (httpRequest.readyState === XMLHttpRequest.DONE && httpRequest.status === 200) {
  			document.getElementById("livesearch").innerHTML=this.responseText;
  		}
  }
