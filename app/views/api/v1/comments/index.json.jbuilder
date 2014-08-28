json.array! @comments do |comment|
  json.text comment.text
  json.username comment.user.username
end