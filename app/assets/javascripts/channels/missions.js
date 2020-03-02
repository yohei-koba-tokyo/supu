$(function(){
  // 設定
  var $width =520; // 横幅
  var $height =310; // 高さ
  var $interval = 4000; // 切り替わりの間隔（ミリ秒）
  var $fade_speed = 1500; // フェード処理の早さ（ミリ秒）
  $("#slide ul li").css({"position":"relative","overflow":"hidden","width":$width,"height":$height});
  $("#slide ul li").hide().css({"position":"absolute","top":0,"left":0});
  $("#slide ul li:first").addClass("active").show();
  setInterval(function(){
  var $active = $("#slide ul li.active");
  var $next = $active.next("li").length?$active.next("li"):$("#slide ul li:first");
  $active.fadeOut($fade_speed).removeClass("active");
  $next.fadeIn($fade_speed).addClass("active");
  },$interval);
  });