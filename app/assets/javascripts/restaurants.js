$(document).ready(function() {
  function showText() {
    $(this).addClass("treasure-open");
    $(this).find(".text").show();
    $("#overlay").show();
    $(this).css("z-index", "9999");
  }
  
  $(".treasure1").click(showText);
  $(".treasure2").click(showText);
  $(".treasure3").click(showText);
});