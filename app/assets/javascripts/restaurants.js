$(document).ready(function() {
  $(".treasure1").hover(function() {
    $(this).find(".text").show();
  }, function() {
    $(this).find(".text").hide();
  });

  $(".treasure2").hover(function() {
    $(this).find(".text").show();
  }, function() {
    $(this).find(".text").hide();
  });
});

