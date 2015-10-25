json.array!(@users) do |user|
  json.extract! user, :id, :recover, :email, :gender, :birth_date, :region, :city, :nivel_acceso, :user_token, :first_name, :last_name
  json.url user_url(user, format: :json)
end
