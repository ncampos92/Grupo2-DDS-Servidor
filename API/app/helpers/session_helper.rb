module SessionHelper

  def log_in(user)
    session[:user_token] = user.user_token
  end

	# Returns the current logged-in user (if any).
  	def current_user
    	@current_user ||= User.find_by(user_token: session[:user_token])
  	end

  	# Returns true if the user is logged in, false otherwise.
  	def logged_in?
    	!current_user.nil? && session[:user_token]
  	end

  	# Logs out the current user.
  	def log_out
      current_user.user_token = nil
      reset_session
  	end
end
