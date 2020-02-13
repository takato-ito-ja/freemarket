$(function () {
  // rootカテゴリ
  var root_id = $("#parent").data("root");
  var root = $(`#parent > option[value=${root_id}]`);
  root.attr("selected", "selected");
  
  // childカテゴリ
  var child_id = $("#child").data("child");
  var child = $(`#child > option[value=${child_id}]`);
  child.attr("selected", "selected");

  // 画像の削除
  $(".delete-btn").click(function (e) {
    e.preventDefault();
    var image_id = $(this).data("imgid")
    // 新規で画像をいれらときはlengthは「0」になる
    if (image_id.length != 0) {
      $.ajax({
        // Api::ProductsControllerのimage_destroyに飛ぶ
        type: 'DELETE',
        url: '/api/destroy/image_destroy',
        data: { img_id: image_id },
        dataType: 'json'
      })
        .done(function () {
          alert("削除しました");
        })
        .fail(function () {
          alert("削除に失敗しました");
        });
    }
  });
});