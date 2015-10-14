json.array!(@likes) do |like|
  json.extract! like, :id, :type
  json.url like_url(like, format: :json)
end
