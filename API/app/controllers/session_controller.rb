class SessionController < ApplicationController

	def new
		if current_user
			redirect_to current_user
		end
	end

	def create
		user = User.find_by(email: params[:session][:username])
    	if user && user.authenticate(params[:session][:password])
      		# Log the user in and redirect to the user's show page.
      		tok = User.new_token
      		user.update_attribute(:user_token,tok)
      		log_in user
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

	private
		def session_params
		  params.require(:session).permit(:username, :password)
		end
end
