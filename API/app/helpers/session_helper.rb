module SessionHelper

  def log_in(user)
    session[:user_id] = user.id
  end

	# Returns the current logged-in user (if any).
	def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user_api
    @current_user ||= User.find_by(user_token: request.headers["token"])
  end

	# Returns true if the user is logged in, false otherwise.
	def logged_in?
  	!current_user.nil? && session[:user_id]
	end

  def logged_in_api?
    print request.headers[:user_token]
    !current_user_api.nil? && request.headers["token"]
  end

  # Logs out the current user.
  def log_out_api
    current_user_api.update_attribute(:user_token, nil)
  end

	def log_out
    reset_session
	end
end
