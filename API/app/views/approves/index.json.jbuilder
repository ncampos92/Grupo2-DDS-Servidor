json.array!(@approves) do |approfe|
  json.extract! approfe, :id, :user, :proposal_id, :score
  json.url approfe_url(approfe, format: :json)
end
