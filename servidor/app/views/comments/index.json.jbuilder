json.array!(@comments) do |comment|
  json.extract! comment, :id, :text, :approved
  json.url comment_url(comment, format: :json)
end
