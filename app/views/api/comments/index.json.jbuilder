json.array! @comments do |comment|
  json.userId comment.user_id
  json.comId comment.id
  json.fullName comment.user_fullname
  json.text comment.body
  json.avatarUrl "https://ui-avatars.com/api/name=#{comment.user_fullname}&background=random"
  json.replies []
end