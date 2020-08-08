// // 1桁の数字を0埋めで2桁にする
// var toDoubleDigits = function(num) {
//   num += "";
//   if (num.length === 1) {
//     num = "0" + num;
//   }
//  return num;
// };

// // 最初に呼ばれる変数の定義
// var toDay = function(day) {
//   var year = day.getFullYear();
//   var month = day.getMonth() + 1 ;
//   var date = day.getDate() ;
//   var dayOfWeek = day.getDay();
//   var dayOfWeekStr = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ][dayOfWeek];
//   var str = year + '/' + month + '/' + date + '(' + dayOfWeekStr + ')';
// }

// // 日付を表示 + テキストボックスにセットする
// function setDay(day) {
//   year = day.getFullYear();
//   month = day.getMonth() + 1 ;
//   date = day.getDate() ;
//   dayOfWeek = day.getDay();
//   dayOfWeekStr = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ][dayOfWeek];
//   str = year + '/' + month + '/' + date + ' ' + '(' + dayOfWeekStr + ')';
//   $('#record_date').val(year.toString() + toDoubleDigits(month).toString() + toDoubleDigits(date).toString());
//   $('#day-show').text(str);
// }

// $(function() {
//   //今日の日付を定義
//   //var day = new Date();
//   var day = gon.today;
//   alert(day);
//   setDay(day);


//   // //前日
//   // $('#previous').on('click', function() {
//   //   day.setDate(day.getDate() - 1);
//   //   setDay(day);
//   // });

//   // //翌日
//   // $('#next').on('click', function() {
//   //   day.setDate(day.getDate() + 1);
//   //   setDay(day);
//   // });

// });