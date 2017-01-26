$(document).on('turbolinks:load', function () {

  $('#selectSearch').on('change', function(){
    if($('#selectSearch').find('option:selected').val() !== "Insurance")
      {
        $('#date_month').hide();
        $('#date_year').hide();
        $('#searchForm').attr('action', 'clients');
      }
     else
      {
        $('#date_month').show();
        $('#date_year').show();
        $('#searchForm').attr('action', 'insurances');
      }
  });

});