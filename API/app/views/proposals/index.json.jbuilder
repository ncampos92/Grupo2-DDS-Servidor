json.array!(@proposals) do |proposal|
  json.extract! proposal, :id, :texto, :user_id
  json.url proposal_url(proposal, format: :json)
  json.score proposal.proplikes.sum(:score)
  json.comments proposal.comments.count
end
