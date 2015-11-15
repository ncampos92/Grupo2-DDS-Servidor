class SessionController < ApplicationController
	before_action :restrict_access, only: :destroy

	def new
		respond_to do |format|
			format.html{
		    if logged_in?
			    redirect_to current_user
		    end
	    }
			format.json {
				if logged_in_api?
					render 'token'
				end
			}
		end
	end

	def create
		user = User.find_by(email: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      respond_to do |format|
        format.html {
		      log_in user
			  	redirect_to home_path
			  }
        format.json {
	        tok = User.new_token
				  user.update_attribute(:user_token, tok)
      	  render json: {user_id: user.id, user_token: user.user_token, profile: users_path(user), status: :ok}
        }
      end
    else
      # Create an error message.
			respond_to do |format|
				format.html {
				  flash[:notice] = "Incorrect username or password"
					redirect_to root_url
				}
	      format.json { render json: {"error": "Usuario o contraseña incorrecta"}}
			end
    end
	end

	def destroy
		respond_to do |format|
			format.html{
				if logged_in?
				  log_out
				end
				redirect_to root_url
			}
			format.json{
				if logged_in_api?
					log_out_api
					render json:{"result":"successfully logged out", status: :ok}
				else
					render json:{"result":"No active session", status: :invalid_request}
				end
			}
		end
	end

	private
		def session_params
		  params.require(:session).permit(:username, :password)
		end
end
