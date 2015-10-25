module SessionHelper
	#Verifica la autenticación de los usuarios.
  def check_authenticated(user_id, user_token)
  	if not logged_in? and current_user.id != user_id
  		redirect_to login_url
  	end
  end

  #Verifica el nivel del usuario para determinar los permisos que tiene.
  def check_user_level(user_id)
  	user = User.find_by(user_id)
  	if user.type != 'admin' || user.type != 'politic'
  		redirect_to login_url
  	end
  end

  def check_authenticated_local
      check_authenticated session[:user_id], nil
  end

    def check_user_level_local
      check_user_level session[:user_id]
    end
end
