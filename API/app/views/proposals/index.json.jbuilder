json.array!(@proposals) do |proposal|
  json.extract! proposal, :id, :titulo,:texto, :user_id
  json.url proposal_url(proposal, format: :json)
  json.likes proposal.upvotes
  json.dislikes proposal.downvotes
  json.comments proposal.comments.count
  json.user_likes proposal.user_likes(current_user_api)
  json.user_dislikes proposal.user_dislikes(current_user_api)
end
