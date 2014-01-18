$(document).ready(function() {
  function showText() {
    $(this).addClass("treasure-open");
    $(this).find(".text").show();
    $(this).siblings().css("opacity", "0.5");
  }
  
  $(".treasure1").click(showText);
  $(".treasure2").click(showText);
  $(".treasure3").click(showText);
});
