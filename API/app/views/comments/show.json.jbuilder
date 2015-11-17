json.extract! @comment, :id, :texto, :approved, :user_id, :proposal_id, :created_at, :updated_at
if @comment.likes.find_by(user_id: current_user_api)
  json.user_likes true
else
  json.user_likes false
end
