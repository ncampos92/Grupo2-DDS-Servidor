json.array!(@comments) do |comment|
  json.extract! comment, :id, :texto, :approved, :user_id, :proposal_id
  json.url proposal_comment_url(comment.proposal, comment, format: :json)
  json.likes comment.upvotes
  json.dislikes comment.downvotes
  json.user_likes comment.user_likes(current_user_api)
  json.user_dislikes comment.user_dislikes(current_user_api)
end
