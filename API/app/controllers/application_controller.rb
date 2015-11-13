class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null_session
  include SessionHelper

  #Verifica la autenticación de los usuarios.
  def check_authenticated(user_id, user_token)
  	if not logged_in? or current_user.id != user_id
  		respond_to do |format|
        format.html {redirect_to login_url}
        #format.json {render json: {"status":"error","login_url" : "/login"}, status: :forbidden}
      end
  	end
  end

  def restrict_access
    @user = User.find_by_user_token(session[:user_token])
    head :unauthorized unless @user && session[:user_token]
  end

  def is_admin?
    return current_user.nivel_acceso == 'admin'
  end

  def is_editor?
    return current_user.nivel_acceso == 'editor'
  end

  #Verifica el nivel del usuario para determinar los permisos que tiene.
  def check_user_level(user_id)
  	user = User.find_by(user_id)
    print user.nivel_acceso
    print ''
    puede = false
  	if user.nivel_acceso == 'admin'
      print 'is admin'
      puede = true
    end
    if user.nivel_acceso == 'politic'
  		print 'is politic'
      puede = true
  	end
    if !puede
      respond_to do |format|
        format.html {redirect_to login_url}
        #format.json {render json: {"status":"error","login_url" : "/login"}, status: :forbidden}
      end
    end
  end

  def check_authenticated_local
      check_authenticated session[:user_id], session[:user_token]
  end

  def check_user_level_local
    check_user_level session[:user_id]
  end
end
