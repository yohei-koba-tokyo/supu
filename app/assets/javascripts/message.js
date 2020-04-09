
$(function(){
  function buildHTML(message){
    var image = (message.image)? `<img class="lower-message__image" src=${message.image}>` :"";
    var content = (message.content)? `<p>${message.content}</p>` :"";
    var c_u_id = gon.current_id;
    if (c_u_id == message.user_id) {
      var html =
      `
      <div class="message" data-message-id=${message.id}>
        <p class="me">${message.user_nickname} ${message.created_at}</p>
        <div class="balloonright">
          ${content}
          ${image}
        </div>
      </div>
      `
      return html
    } else {
      var html =
      `
      <div class="message" data-message-id=${message.id}>
        <p class="name">${message.user_nickname} ${message.created_at}</p>
        <div class="balloon">
          ${content}
          ${image}
        </div>
      </div>
      `
      return html
    }
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chatbox__main').append(html);
      $('.chatbox__main').animate({ scrollTop: $('.chatbox__main')[0].scrollHeight});
      $('form')[0].reset();
    })
    .fail(function(){
      alert("メッセージ送信に失敗しました");
    })
    .always(function() {
      $('.form__submit').prop('disabled', false);
    })
  });
  var reloadMessages = function() {
    var last_message_id = $('.message:last').data("message-id");
    var url = document.location.pathname + "/api/messages"
    $.ajax({
      url: url,
      type: 'get',
      dataType: 'json',
      data: {id: last_message_id}
    })
    .done(function(messages) {
      if (messages.length !== 0) {
        var insertHTML = '';
        $.each(messages, function(i, message) {
          insertHTML += buildHTML(message)
        });
        $('.chatbox__main').append(insertHTML);
        $('.chatbox__main').animate({ scrollTop: $('.chatbox__main')[0].scrollHeight});
      }
    })
    .fail(function() {
      alert('JS error');
    });
  };
  if (document.location.href.match(/\/missions\/\d+\#anchor/)) {
    setInterval(reloadMessages, 7000);
  }
});