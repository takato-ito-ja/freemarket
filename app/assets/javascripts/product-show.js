$(function () {
  console.log("test");
  $('.image-list').click(function () {
    console.log("test");
    var $src = $(this).attr('src');
    $('.main-image').attr('src', $src);
  });
});