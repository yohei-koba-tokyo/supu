json.array! @messages do |message|
  json.content message.content
  json.image message.image.url
  json.created_at I18n.l(message.created_at)
  json.user_nickname message.user.nickname
  json.id message.id
  json.user_id message.user_id
end
