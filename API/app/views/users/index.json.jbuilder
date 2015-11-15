json.array!(@users) do |user|
  json.extract! user, :id, :email, :gender, :birth_date, :region, :city, :first_name, :last_name
  json.url user_url(user, format: :json)
end
