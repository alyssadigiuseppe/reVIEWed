(function(){
//console.log("working");
  var pic = document.querySelectorAll(".movieThumbs img"),
      pop = document.querySelector("#pop"),
      closePop = document.querySelector("#closeButton"),
      trailerSrc = document.querySelector("#movieTrailer video source"),
      trailer = document.querySelector("#movieTrailer video"),
      desc = document.querySelector("#desc"),
      cred = document.querySelector("#cred"),
      html = document.querySelector("html");

      trailer.autoplay = false;

      function open() {
        pop.style.display = "block";
        pop.style.opacity = "1";
        pop.style.transition = "1s";

        html.style.overflow = "hidden";

        var currentMovie = this.id;

        var next = document.querySelector('#nextGallButton'),
            prev = document.querySelector('#prevGallButton');

        function nextPhoto() {
          if (currentMovie < 10) {

            currentMovie++;

            httpRequest = new XMLHttpRequest();
            //its a js api (virtual object) has properties and events

            if (!httpRequest) {
              //if its too old it wont have the objecty built in
              console.log('this will not work on your computer');
              return false;
            }
            httpRequest.onreadystatechange = showImage;
            httpRequest.open('GET', 'includes/getMovie.php' + '?movie=' + currentMovie);
            httpRequest.send();
          }

        }

        function prevPhoto() {
          if (currentMovie > 1) {
          currentMovie--;

          httpRequest = new XMLHttpRequest();
          //its a js api (virtual object) has properties and events

          if (!httpRequest) {
            //if its too old it wont have the objecty built in
            console.log('this will not work on your computer');
            return false;
          }
          httpRequest.onreadystatechange = showImage;
          httpRequest.open('GET', 'includes/getMovie.php' + '?movie=' + currentMovie);
          httpRequest.send();
        }
        }

        next.addEventListener('click', nextPhoto, false);
        prev.addEventListener('click', prevPhoto, false);


        document.onkeydown = function(evt) {
          evt = evt || window.event;

          if (evt.keyCode == 27) {
            pop.style.display = "none";

            html.style.overflow = "auto";
          }

          if (evt.keyCode == 39) {
            nextPhoto();
          }

          if (evt.keyCode == 37) {
            prevPhoto();
          }
        };

        httpRequest = new XMLHttpRequest();
        //its a js api (virtual object) has properties and events

        if (!httpRequest) {
          //if its too old it wont have the object built in
          console.log('this will not work on your computer');
          return false;
        }
        httpRequest.onreadystatechange = showImage;
        httpRequest.open('GET', 'includes/getMovie.php' + '?movie=' + currentMovie);
        httpRequest.send();
      }

        function showImage() {
          if (httpRequest.readyState === XMLHttpRequest.DONE && httpRequest.status === 200) {
            //parse stringified result
            var movieInfo = JSON.parse(httpRequest.responseText);
            console.log(movieInfo);
            trailerSrc.src = "trailers/" + movieInfo.movies_trailers;
            trailer.load();
            desc.innerHTML = movieInfo.movies_title;
            cred.innerHTML = movieInfo.movies_year;
            pop.style.transition = ".3s";
            pop.style.opacity = "1";
          }
      }

      function close(){
        trailer.pause();

        pop.style.display = "none";
        pop.style.opacity = 0;

        html.style.overflow = "auto";
      }

    for (var i = 0; i < pic.length; i++) {
    pic[i].addEventListener('click', open, false);
}

    closePop.addEventListener('click', close, false);

})();
