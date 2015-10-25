json.params do
	json.email ""
	json.password ""
end

json.login login_url(format: :json)
json.login_verb "POST"