$(function(){
  if ($('.contents').length) {
    var result = $('.contents').find('p.past:last');
    var resultA = result[0]
    if (!$(resultA).length) return;
    console.log(resultA);
    console.log($(resultA).offset());
    var targetY = $(resultA).offset().top;
    $('.contents').animate({scrollTop: targetY}, 500, 'swing');
  } else {
    var result = $('.mission-wrap').find('p.past:last');
    var resultA = result[0]
    if (!$(resultA).length) return;
    console.log(resultA);
    console.log($(resultA).offset());
    var targetY = $(resultA).offset().top - 300;
    $('.mission-wrap').animate({scrollTop: targetY}, 500, 'swing');
  };
});