json.array!(@proposals) do |proposal|
  json.extract! proposal, :id, :text
  json.url proposal_url(proposal, format: :json)
end
