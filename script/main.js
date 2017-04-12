(function(){
//console.log("working");
  var pic = document.querySelectorAll(".movieThumbs"),
      pop = document.querySelector("#pop"),
      //console.log(pop);
      closePop = document.querySelector("#closeButton");
      /*mainImg = document.querySelector("#mainImg"),
      desc = document.querySelector("#desc"),
      cred = document.querySelector("#cred");*/

      function open() {
        pop.style.display = "block";
        pop.style.opacity = "1";
        console.log("bruh");
      }

      function close(){
        pop.style.display = "none";
        pop.style.opacity = 0;
      }

    for (var i = 0; i < pic.length; i++) {
    pic[i].addEventListener('click', open, false);
    console.log("listening");
}

    closePop.addEventListener('click', close, false);

})();
