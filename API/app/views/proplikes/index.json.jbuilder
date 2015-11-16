json.array!(@proplikes) do |proplike|
  json.extract! proplike, :id, :user_id, :proposal_id, :score
  json.url proposal_proplike_url(proplike.proposal, proplike, format: :json)
end
