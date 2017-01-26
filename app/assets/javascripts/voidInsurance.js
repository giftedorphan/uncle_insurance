$(document).on('turbolinks:load', function () {

  function toggle_form() {
    if($('#insurance_renovation').is(':checked'))
    {
      $( ".voidInsurance" ).attr("disabled", true);
    }
    else
    {
      $( ".voidInsurance" ).attr("disabled", false);
    }
  }

  $('#insurance_renovation').on('change', function(){
    toggle_form();
  });

  toggle_form();

});