json.array!(@likes) do |like|
  json.extract! like, :id, :user_id, :comment_id
  json.url proposal_comment_like_url(@proposal, like.comment, like, format: :json)
end
