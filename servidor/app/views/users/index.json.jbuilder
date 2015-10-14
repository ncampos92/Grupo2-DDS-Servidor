json.array!(@users) do |user|
  json.extract! user, :id, :password, :recover_digest, :email, :gender, :birth_date, :region, :city, :type, :user_token, :first_name, :last_name
  json.url user_url(user, format: :json)
end
