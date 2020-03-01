json.content  @message.content
json.image @message.image.url
json.created_at @message.created_at.to_s(:time2)
json.nickname  @message.user.nickname