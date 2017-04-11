(function(){

  var pic = document.querySelectorAll(".box"),
      popup = document.querySelector("#pop"),
      closePop = document.querySelector("#closeButton"),
      mainImg = document.querySelector("#mainImg"),
      desc = document.querySelector("#desc"),
      cred = document.querySelector("#cred");

      function open() {
        popup.style.display = "block";
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
