json.array!(@comments) do |comment|
  json.extract! comment, :id, :texto, :appproved, :User_id, :Proposal_id
  json.url comment_url(comment, format: :json)
end
