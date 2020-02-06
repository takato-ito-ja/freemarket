// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function () {

  var buildPrompt = `<option value>---</option>`
  var buildHtmlOption = function (cat) {
    var option = `<option value ="${cat.id}">${cat.name}</option>`
    return option
  }


  
  $('.sell__image-select__ul-text').on('change', 'input[type="file"]', function (e) {
    var id = $(this).data('id'),
      file = e.target.files[0],
      reader = new FileReader(),
      $label = $(".ul-id-" + id),
      $li = $label.children('li')

    // 画像ファイル以外の場合は何もしない
    if (file.type.indexOf("image") < 0) {
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function (file) {
      return function (e) {
        // liの中を削除する
        $li.empty();
        // 透過していた領域を表示する
        $label.css('opacity', '1');
        // 領域の中にロードした画像を表示するimageタグを追加
        $li.append($('<img>').attr({
          src: e.target.result,
          width: "114px",
          height: "116px",
          class: "preview",
          title: file.name,
        }));
        // 編集削除ボタンを表示する
        $('.btn-box').css('display', 'block');
      };
    })(file);

    reader.readAsDataURL(file);
  });

  $(this).on("click", ".delete-btn", function () {
    $(this).parent().prev().empty();
    $(this).parent().parent().css('opacity', '0');
    return false;
  });





  $('#parent').change(function () {
    var parent_id = $(this).val();
    $.ajax({
      type: 'GET',
      url: '/api/sell/child',
      data: { id: parent_id },
      dataType: 'json'
    })
      .done(function (categories) {
        $('.child').css('display', 'block');
        $('#child').empty();
        $('.grand_child').css('display', 'none');
        $('#child').append(buildPrompt);

        categories.forEach(function (cat) {
          var html_option = buildHtmlOption(cat);
          $('#child').append(html_option);
        });
      })
      .fail(function () {
      });
  });

  $(this).on("change", "#child", function () {
    var child_id = $("#child").val();
    $.ajax({
      type: 'GET',
      url: '/api/sell/grand_child',
      data: { id: child_id },
      dataType: 'json'
    })
      .done(function (categories) {
        $('.grand_child').css('display', 'block');
        $('#grand_child').empty();
        $('#grand_child').append(buildPrompt);
        categories.forEach(function (cat) {
          var html_option = buildHtmlOption(cat);
          $('#grand_child').append(html_option);
        });
      })
      .fail(function () {
      });
  });

  $("#product_price").on("keyup", function () {
    var price = $(this).val();
    var fee = Math.floor(price * 0.1);
    $(".sell__about__right__wrap__fee-right").text("¥ " + fee);
    var profit = price - fee
    $(".sell__about__right__wrap__profit-right").text("¥ " + profit);
  });

});