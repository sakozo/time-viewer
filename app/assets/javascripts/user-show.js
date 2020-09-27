var color = 0;
var own_time_id = 1;

var block_li_id_list = ["5:00", "5:15", "5:30", "5:45", "6:00", "6:15", "6:30", "6:45", "7:00", "7:15", "7:30", "7:45", "8:00", "8:15", "8:30", "8:45", "9:00", "9:15", "9:30", "9:45", "10:00", "10:15", "10:30", "10:45", "11:00", "11:15", "11:30", "11:45", "12:00", "12:15", "12:30", "12:45", "13:00", "13:15", "13:30", "13:45", "14:00", "14:15", "14:30", "14:45", "15:00", "15:15", "15:30", "15:45", "16:00", "16:15", "16:30", "16:45", "17:00", "17:15", "17:30", "17:45", "18:00", "18:15", "18:30", "18:45", "19:00", "19:15", "19:30", "19:45", "20:00", "20:15", "20:30", "20:45", "21:00", "21:15", "21:30", "21:45", "22:00", "22:15", "22:30", "22:45", "23:00", "23:15", "23:30", "23:45", "24:00", "24:15", "24:30", "24:45", "1:00", "1:15", "1:30", "1:45", "2:00", "2:15", "2:30", "2:45", "3:00", "3:15", "3:30", "3:45", "4:00", "4:15", "4:30", "4:45"];

$(function () {
  var result_times = gon.result_times;
  var own_time_list = gon.own_time_list;

  $('.datepicker').datepicker({
    format: "yyyy-mm-dd"
  });

  $('select').formSelect();
  $('.modal').modal();

  // ページから離れる際に検知する
  $(window).on('beforeunload', function (e) {
    /** 更新される直前の処理 */
    //$('#result_time_submit_button').trigger("click");
    console.log('beforeunload');
  });

  //色の定義
  var setColor = function (type) {
    //gonでユーザー設定の色を配列で取得する
    const user_color_array = gon.user_color_array
    let draw_color = user_color_array[type];
    return draw_color;
  }

  var setId = function (id) {
    var time_id = 'time_' + id;
    return time_id;
    //$( ".ui-selected", this ).addClass(time_id);
  }

  //tooltipに入力したown_timeのnameを追加するメソッド
  function setToolTip(block_selector, time_id) {
    let index = Number(block_selector.slice(10))
    let new_title = block_li_id_list[index] + " " + own_time_list[time_id];
    $(block_selector).attr('data-tooltip', new_title);
  }


  showInputTime();


  function showInputTime() {
    //inputフォームに入力されたown_time_idをカウントする
    let time_array = Array(gon.own_time_count); //配列の長さを確定(idの数だけ確保)
    time_array.fill(0); //0で初期化
    $("[id^=block_]").each(function (index, element) {
      var time_id = $(element).val();
      time_array[time_id] += 1; //idと一致する要素のカウントを+1
    })
    $('#time-show').empty();
    $.each(time_array, function (index, val) {
      //0番目はから文字のためスキップ
      if (index == 0) {
        return;
      }
      //0なら次のループへ
      if (val == 0) {
        return;
      }
      //15分ブロックの数から時間に変換
      var hour = Math.floor(val / 4);
      var minutes = (val % 4 == 0) ? "00" : val % 4 * 15; //参考演算子 0なら"00"とする
      var show_time = hour + ":" + minutes;
      $('#time-show').append(gon.own_time_list[index] + ":" + show_time + " "+ '<br>');
    });
    $('#tweet').val($('#time-show').text());
  }

  $(function () {
    $("#selectable").selectable({
      stop: function () {

        //ここで選択箇所の色を上書き、他を選択しても消えないようにする
        //TODO:重要度×緊急度のマトリクスの説明
        //選択項目と同じ要領で合計時間を直後に右側に表示
        //TODO:メソッド切り出しで処理を共通化 javascriptファイルに処理を持っていく
        $(".ui-selected", this).css('background-color', setColor(color));
        $(".ui-selected", this).removeClass(function (index, className) {
          return (className.match(/\btime_\S+/g) || []).join(' ');
        });
        $(".ui-selected", this).addClass(setId(own_time_id));

        var result = $("#select-result").empty();
        $(".ui-selected", this).each(function () {
          var index = $("#selectable li").index(this);
          result.append(" #" + (index + 1));
          var block_id = "#block_" + index;
          var class_name = $(".ui-selected").attr('class');
          $(block_id).val(own_time_id);

          //tooltipにown_timeを追加
          var block_li_id = "#block_li_" + index
          setToolTip(block_li_id, own_time_id);

          //own_timeのnameごとに時間を表示
          showInputTime();
        });
        $('#time-submit-button').click();
        $('#temporary-storage').empty();
      }
    });

    $('#reset').on("click", function () {
      $(".ui-selectee").css('background-color', '#fff');
      $(".ui-selectee").removeClass(function (index, className) {
        return (className.match(/\btime_\S+/g) || []).join(' ');
      });
      $('[id^="block_"]').val('');
    });

    $('#red').on("click", function () {
      color = "1";
      var val = $('#own_time_select_time_1').val();
      own_time_id = val;
      //alert(val);
      //alert(color);
    });
    $('#blue').on("click", function () {
      color = "2";
      var val = $('#own_time_select_time_2').val();
      own_time_id = val;
      //alert(val);
      //alert(color);
    });
    $('#green').on("click", function () {
      color = "3";
      var val = $('#own_time_select_time_3').val();
      own_time_id = val;
      //alert(val);
      //alert(color);
    });
    $('#yellow').on("click", function () {
      color = "4";
      var val = $('#own_time_select_time_4').val();
      own_time_id = val;
      //alert(val);
      //alert(color);
    });
    $('#grey').on("click", function () {
      color = "0";
      own_time_id = 1;
      //alert(own_time_id);
      //alert(color);
    });

    $('#select_time1').on("click", function () {
      $('#select_time1_radio').prop('checked', true);
      color = "1";
      var val = $('#own_time_select_time_1').val();
      own_time_id = val;
      //alert(own_time_id);
    });
    $('#select_time1').change(function () {
      $('#select_time1_radio').prop('checked', true);
      color = "1";
      var val = $('#own_time_select_time_1').val();
      own_time_id = val;
      //alert(own_time_id);
    });

    $('#select_time2').on("click", function () {
      $('#select_time2_radio').prop('checked', true);
      color = "2";
      var val = $('#own_time_select_time_2').val();
      own_time_id = val;
      //alert(own_time_id);
    });
    $('#select_time2').change(function () {
      $('#select_time2_radio').prop('checked', true);
      color = "2";
      var val = $('#own_time_select_time_2').val();
      own_time_id = val;
      //alert(own_time_id);
    });

    $('#select_time3').on("click", function () {
      $('#select_time3_radio').prop('checked', true);
      color = "3";
      var val = $('#own_time_select_time_3').val();
      own_time_id = val;
      //alert(own_time_id);
    });
    $('#select_time3').change(function () {
      $('#select_time3_radio').prop('checked', true);
      color = "3";
      var val = $('#own_time_select_time_3').val();
      own_time_id = val;
      //alert(own_time_id);
    });

    $('#select_time4').on("click", function () {
      $('#select_time4_radio').prop('checked', true);
      color = "4";
      var val = $('#own_time_select_time_4').val();
      own_time_id = val;
      //alert(own_time_id);
    });
    $('#select_time4').change(function () {
      $('#select_time4_radio').prop('checked', true);
      color = "4";
      var val = $('#own_time_select_time_4').val();
      own_time_id = val;
      //alert(own_time_id);
    });

    $('#select_time0').on("click", function () {
      $('#select_time0_radio').prop('checked', true);
      color = "0";
      //var val = $('#select0').val();
      own_time_id = 1;
      //alert(own_time_id);
    });
    $('#select_time0').change(function () {
      $('#select_time0_radio').prop('checked', true);
      color = "0";
      //var val = $('#select0').val();
      own_time_id = 1;
      //alert(own_time_id);
    });
  });


  //gon.result_times_type
  Object.keys(gon.result_times_type).forEach(function (key) {
    var val = this[key]; // this は gon.result_times_type

    var selector = "#block_li_" + key;
    $(selector).css('background-color', setColor(val));

  }, gon.result_times_type);

  Object.keys(gon.result_times).forEach(function (key) {
    let val = this[key]; // this は gon.result_times
    let selector = "#block_li_" + key;
    setToolTip(selector, val);
  }, gon.result_times);


  // 画面表示時にgon.result_timesが値ありで帰ってきた場合に
  // 「入力されていません」の文字を削除する
  if (Object.keys(gon.result_times).length != 0) {
    $('#temporary-storage').empty();
  }

  $('.input-date-button').click(function() {
    $('.datepicker').datepicker('open');
  });


  $('#instead-time-submit-button').click(function(){
    $('#time-submit-button').click();
  })

  // datepickerのテキストボックスで変更があった場合に
  $('.datepicker-date-link').change(function () {
    let date_val = $('.datepicker').val();
    let link = '/users/' + gon.user_id + '.' + date_val;
    $('#date_link').attr('href', link);
    $('#date-link-btn').click();
  });

  $('.tooltipped').tooltip({
    exitDelay: 0,
    enterDelay: 0,
    inDuration: 0,
    outDuration: 0,
    position: 'top',
    margin: 0,
    transitionMovement: 0,
  });

})