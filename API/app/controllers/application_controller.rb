class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null_session
  include SessionHelper
  helper_method :is_admin?, :is_editor?

  #Verifica que el usuario sea válido.
  def restrict_access
    respond_to do |format|
      format.html {
        if !logged_in?
          flash[:notice] = "Unauthorized access - please log in"
          redirect_to root_url
        end
      }
      format.json {
        if !logged_in_api?
          render json: {"error":{"description":"Not logged in - unauthorized access", "login_url":"/login"}}, status: :forbidden
        end
      }
    end
  end

  #Indica si el usuario tiene nivel de acceso 'admin'
  def is_admin?
    if current_user || current_user_api
      respond_to do |format|
        format.html{
          return current_user.nivel_acceso == 'admin'
        }
        format.json{
          return current_user_api.nivel_acceso == 'admin'
        }
      end
    end
  end

  #Indica si el usuario tiene nivel de acceso 'editor'
  def is_editor?
    if current_user || current_user_api
      respond_to do |format|
        format.html{
          return current_user.nivel_acceso == 'editor'
        }
        format.json{
          return current_user_api.nivel_acceso == 'editor'
        }
      end
    end
  end

end
