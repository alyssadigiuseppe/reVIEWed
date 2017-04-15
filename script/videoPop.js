(function(){

  var pic = document.querySelectorAll(".movieThumbs img"),
      pop = document.querySelector("#pop"),
      closePop = document.querySelector("#closeButton"),
      trailerSrc = document.querySelector("#movieTrailer video source"),
      trailer = document.querySelector("#movieTrailer video"),
      desc = document.querySelector("#desc"),
      cred = document.querySelector("#cred"),
      commentSection = document.querySelector("#commentViewer"),
      comments = document.querySelector("#commentViewer ul"),
      movieId = document.querySelector("#movieId"),
      commentForm = document.querySelector("#commentViewer form input[type='submit']"),
      movieComment = document.querySelector("#movieComment");
      html = document.querySelector("html");

      trailer.autoplay = false;

      function open() {
        pop.style.display = "block";
        pop.style.opacity = "1";
        pop.style.transition = "1s";

        html.style.overflow = "hidden";

        var currentMovie = this.id;

        commentSection.classList.add(this.id);

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
          var comment = null;

          if (httpRequest.readyState === XMLHttpRequest.DONE && httpRequest.status === 200) {
            //parse stringified result
            var movieInfo = JSON.parse(httpRequest.responseText);
            trailerSrc.src = "trailers/" + movieInfo[0].movies_trailers;
            trailer.load();
            desc.innerHTML = movieInfo[0].movies_title;
            cred.innerHTML = movieInfo[0].movies_year;
            movieId.value = movieInfo[0].movies_id;
            pop.style.transition = ".3s";
            pop.style.opacity = "1";

            for(var i = 0; movieInfo.length > i; i++){
              if (movieInfo[i].comment_text !== null) {
                comment += "<li class=\"comment\">" + movieInfo[i].comment_text + "</li>";
              }
            }

            if(comment !== null){
              comments.innerHTML = comment;
            }

          }
      }

      function close(){
        trailer.pause();

        pop.style.display = "none";
        pop.style.opacity = 0;

        html.style.overflow = "auto";
      }

      function makeComment(e) {
        e.preventDefault();
        httpRequest = new XMLHttpRequest();

        if (!httpRequest) {
          console.log('this will not work on your computer');
          return false;
        }
        httpRequest.onreadystatechange = createComment;
        httpRequest.open('GET', 'admin/phpscripts/comment.php' + '?id=' + movieId.value + '&comment=' + movieComment.value );
          httpRequest.send();

          function createComment(){
            if (httpRequest.readyState === XMLHttpRequest.DONE && httpRequest.status === 200) {
                var commentText = document.querySelector("#movieComment");

                comments.innerHTML += "<li class=\"comment\">" + commentText.value + "</li>";
            }
          }
        }

    for (var i = 0; i < pic.length; i++) {
    pic[i].addEventListener('click', open, false);
}
    commentForm.addEventListener('click', makeComment, false);
    closePop.addEventListener('click', close, false);

})();
