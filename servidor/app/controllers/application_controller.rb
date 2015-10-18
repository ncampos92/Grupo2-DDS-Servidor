class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  include LoginHelper

  #Verifica la autenticación de los usuarios.
  def check_authenticated(user_id, user_token)
  end

  #Verifica el nivel del usuario para determinar los permisos que tiene.
  def check_user_level(user_id)
  end
end
