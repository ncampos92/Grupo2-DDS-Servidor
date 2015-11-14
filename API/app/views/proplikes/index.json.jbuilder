json.array!(@proplikes) do |proplike|
  json.extract! proplike, :id, :user_id, :proposal_id, :score
  json.url proplike_url(proplike, format: :json)
end
