json.content  @message.content
json.image @message.image.url
json.created_at I18n.l(@message.created_at)
json.nickname  @message.user.nickname