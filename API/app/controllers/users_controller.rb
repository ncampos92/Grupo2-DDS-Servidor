class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_authenticated_local, only: [:update, :destroy]

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
    @user = User.new(user_params_shenanigans)
    respond_to do |format|
      if @user.save
	tok = User.new_token
    	tok = User.digest tok
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
      if @user.update(user_params_shenanigans)
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
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:password, :password_confirmation, :recover_digest, :email, :gender, :birth_date, :region, :city, :nivel_acceso, :user_token, :first_name, :last_name)
    end
    
    def user_params_shenanigans
        {
        :first_name             => params[:user][:first_name],
        :last_name              => params[:user][:last_name],
        :password               => params[:user][:password],
        :password_confirmation  => params[:user][:password_confirmation],
        :recover_digest         => params[:user][:recover_digest],
        :email                  => params[:user][:email],
        :gender                 => params[:user][:gender],
        :birth_date             => params[:user][:birth_date],
        :region                 => params[:user][:region],
        :city                   => params[:user][:city],
        :nivel_acceso           => params[:user][:nivel_acceso],
        :user_token             => params[:user][:user_token]
        }
      
    end
end
