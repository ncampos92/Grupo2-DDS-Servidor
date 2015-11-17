json.extract! @comment, :id, :texto, :approved, :user_id, :proposal_id, :created_at, :updated_at
json.user_likes @comment.user_likes(current_user_api)
json.user_dislikes @comment.user_dislikes(current_user_api)
