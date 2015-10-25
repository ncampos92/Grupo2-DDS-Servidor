json.status "OK"
json.user_id current_user.id
json.token current_user.user_token
json.profile user_url(current_user)