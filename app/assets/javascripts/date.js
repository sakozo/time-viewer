$(function() {
  var day = new Date();
  var year = day.getFullYear();
  var month = day.getMonth() + 1 ;
  var date = day.getDate() ;
  var dayOfWeek = day.getDay();
  var dayOfWeekStr = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ][dayOfWeek];

  var str = year + '/' + month + '/' + date + '(' + dayOfWeekStr + ')';
  $('#record_date').val(year.toString() + month.toString() + date.toString());
});