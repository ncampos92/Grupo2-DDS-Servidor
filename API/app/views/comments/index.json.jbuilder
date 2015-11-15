json.array!(@comments) do |comment|
  json.extract! comment, :id, :texto, :approved, :user_id, :proposal_id
  json.url comment_url([comment.proposal, comment], format: :json)
end
