class SessionController < ApplicationController
	before_action :translate_standard, only: :create

	def new
		
	end

	def create
		user = User.find_by(email: params[:email].downcase)
    	if user && user.authenticate(params[:password])
      		# Log the user in and redirect to the user's show page.
      		log_in user
      		redirect_to user
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
		params[:email] = params[:username]
	end
end
