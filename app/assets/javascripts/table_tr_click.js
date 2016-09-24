$(document).on('turbolinks:load', function () {
  // Make table rows clickable
  $(".table tr").on('click', function(event) {
    var target = $(event.target);
    if (target.is(":not(a)")) {
      window.location = $(this).data("link")
    }
    else if (target.text() == "Imagenes"){
    }
    else {
      var href = $(this).find("a").attr("href");
    }
  });
});