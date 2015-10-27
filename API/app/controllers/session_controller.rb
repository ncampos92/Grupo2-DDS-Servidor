class SessionController < ApplicationController
	before_action :translate_standard, only: :create

	def new
		
	end

	def create
		print params
		fkey = params[:email].downcase
		user = User.find_by(email: fkey)
    	if user && user.authenticate(params[:password])
      		# Log the user in and redirect to the user's show page.
      		log_in user
      		tok = User.new_token
      		tok = User.digest tok
      		user.update_attribute(:user_token,tok)
      		respond_to do |format|
      			format.html {redirect_to user}
      			format.json {
      				render 'token'
      			}
      		end
    	else
      		# Create an error message.
      		render 'new'
    	end
	end

	def destroy
		log_out
    	redirect_to root_url
	end

	def translate_standard
		if params[:username] 
			params[:email] = params[:username]
		end
	end
end
