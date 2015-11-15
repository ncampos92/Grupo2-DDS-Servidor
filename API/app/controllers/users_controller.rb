class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :restrict_access, except: [:new, :create]
  before_action :authorize, only: [:edit, :update, :destroy]
  before_action :user_level_authorization, only: [:create, :update]
  before_action :restrict_register, only: [:new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        tok = User.new_token
        @user.update_attribute(:user_token,tok)
	      log_in @user
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def restrict_register
      if (!is_admin? && (current_user || current_user_api))
        redirect_to @user
      end
    end


    def authorize
      respond_to do |format|
        format.html{
          if current_user && (@user.id == current_user.id || is_admin?)
          else
            flash[:notice] = "Access Denied."
            redirect_to users_path
          end
        }
        format.json{
          if current_user_api && (@user.id == current_user_api.id || is_admin?)
          else
            render json: {
              error: "Denied Acces",
              status: :forbidden
            }
          end
        }
      end
    end

    def user_level_authorization
      if !is_admin?
        params[:user][:nivel_acceso] = 'usuario'
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:password, :password_confirmation, :recover_digest, :email, :gender, :birth_date, :region, :city, :nivel_acceso, :user_token, :first_name, :last_name)
    end
end
