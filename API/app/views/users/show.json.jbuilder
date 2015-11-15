if @user.id == current_user_api.id
  json.extract! @user, :id, :email, :gender, :birth_date, :region, :city, :nivel_acceso, :user_token, :first_name, :last_name, :created_at, :updated_at
else
  json.extract! @user, :id, :email, :gender, :birth_date, :region, :city, :first_name, :last_name
end
