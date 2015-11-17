json.array!(@proposals) do |proposal|
  json.extract! proposal, :id, :titulo,:texto, :user_id
  json.url proposal_url(proposal, format: :json)
  json.likes proposal.upvotes
  json.dislikes proposal.downvotes
  json.comments proposal.comments.count
end
