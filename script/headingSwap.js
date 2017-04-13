(function(){

  var pic = document.querySelectorAll(".galleryPhotos img"),
      popup = document.querySelector("#pop"),
      closePop = document.querySelector("#closeButton"),
      mainImg = document.querySelector("#mainImg"),
      desc = document.querySelector("#desc"),
      cred = document.querySelector("#cred");

    function open() {
      popup.style.display = "block";
      var currentPhoto = this.id;

      var next = document.querySelector('#nextGallButton'),
          prev = document.querySelector('#prevGallButton');

      function nextPhoto() {
        if (currentPhoto < 9) {

          currentPhoto++;

          httpRequest = new XMLHttpRequest();
          //its a js api (virtual object) has properties and events

          if (!httpRequest) {
            //if its too old it wont have the objecty built in
            console.log('this will not work on your computer');
            return false;
          }
          httpRequest.onreadystatechange = showImage;
          httpRequest.open('GET', 'includes/getGallery.php' + '?image=' + currentPhoto);
          httpRequest.send();
        }

      }

      function prevPhoto() {
        if (currentPhoto > 1) {
        currentPhoto--;

        httpRequest = new XMLHttpRequest();
        //its a js api (virtual object) has properties and events

        if (!httpRequest) {
          //if its too old it wont have the objecty built in
          console.log('this will not work on your computer');
          return false;
        }
        httpRequest.onreadystatechange = showImage;
        httpRequest.open('GET', 'includes/getGallery.php' + '?image=' + currentPhoto);
        httpRequest.send();
      }
      }

      next.addEventListener('click', nextPhoto, false);
      prev.addEventListener('click', prevPhoto, false);

        //creates keyboard shortcuts for lightbox
        document.onkeydown = function(evt) {
          evt = evt || window.event;

          if (evt.keyCode == 27) {
            popup.style.display = "none";
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
      httpRequest.open('GET', 'includes/getGallery.php' + '?image=' + currentPhoto);
      httpRequest.send();
    }

      function showImage() {
        if (httpRequest.readyState === XMLHttpRequest.DONE && httpRequest.status === 200) {
          //parse stringified result
          var imgData = JSON.parse(httpRequest.responseText);
          mainImg.src = "images/" + imgData.gallery_photo + '.jpg';
          desc.innerHTML = imgData.gallery_desc;
          cred.innerHTML = imgData.gallery_credit;
          popup.style.transition = ".3s";
          popup.style.opacity = "1";
        }
      }

    function close(){
      popup.style.display = "none";
      popup.style.opacity = ".0";
    }

  closePop.addEventListener('click', close, false);

  [].forEach.call(pic, function(selectedPic){
    selectedPic.addEventListener('click', open, false);
  });

})();
