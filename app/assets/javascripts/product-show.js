$(function () {
  $('.image-list').click(function () {
    var $src = $(this).attr('src');
    $('.main-image').attr('src', $src);
  });
});