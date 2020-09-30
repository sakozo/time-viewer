$(function(){
    $('.sidenav').sidenav();
  
  $('.datepicker').datepicker({
    format: "yyyy-mm-dd"
  });
  
  $('select').formSelect();
  $('.modal').modal();

  $('.tabs').tabs();
})