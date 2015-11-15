json.array!(@comments) do |comment|
  json.extract! comment, :id, :texto, :appproved, :user_id, :proposal_id
  json.url comment_url(comment, format: :json)
end
