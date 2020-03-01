
$(function(){
  function buildHTML(message){
    var image = (message.image)? `<img class="lower-message__image" src=${message.image}>` :"";
    var content = (message.content)? `<p>${message.content}</p>` :"";
    var c_u_id = gon.current_user_id;
    if (c_u_id == message.user_id) {
      var html =
      `
      <p class="me">${message.nickname} ${message.created_at}</p>
      <div class="balloonright">
        ${content}
        ${image}
      </div>
      `
      return html
    } else {
      var html =
      `
      <p class="name">${message.nickname} ${message.created_at}</p>
      <div class="balloon">
        ${content}
        ${image}
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
  })
})