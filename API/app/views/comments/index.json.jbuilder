json.array!(@comments) do |comment|
  json.extract! comment, :id, :texto, :approved, :user_id, :proposal_id
  json.url proposal_comment_url(comment.proposal, comment, format: :json)
  json.likes comment.upvotes
  json.dislikes comment.downvotes
  if comment.likes.find_by(user_id: current_user_api)
    json.user_likes true
  else
    json.user_likes false
  end
end
