class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]
  before_action :restrict_access
  before_action :set_owner, only: :show
  before_action :authorize_create, only: [:new, :create]
  before_action :authorize, only: [:edit, :update, :destroy]

  # GET /proposals
  # GET /proposals.json
  def index
    @proposals = Proposal.all
  end

  #Autoriza la edición y eliminación según el nivel de usuario y creador
  def authorize
    if current_user && (@proposal.user.id == current_user.id || is_admin?)
    else
      flash[:notice] = "Access Denied."
      redirect_to proposals_path
    end
  end

  #Autoriza la creación de propuestas según nivel de usuario
  def authorize_create
    if current_user && (is_editor? || is_admin?)
    else
      flash[:notice] = "Access Denied."
      redirect_to proposals_path
    end
  end


  # GET /proposals/1
  # GET /proposals/1.json
  def show
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /proposals/1/edit
  def edit
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new(proposal_params)
    print @proposal.user
    @proposal.user = current_user
    respond_to do |format|
      if @proposal.save
        format.html { redirect_to @proposal, notice: 'Proposal was successfully created.' }
        format.json { render :show, status: :created, location: @proposal }
      else
        format.html { render :new }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposals/1
  # PATCH/PUT /proposals/1.json
  def update
    respond_to do |format|
      if @proposal.update(proposal_params)
        format.html { redirect_to @proposal, notice: 'Proposal was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposal }
      else
        format.html { render :edit }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal.destroy
    respond_to do |format|
      format.html { redirect_to proposals_url, notice: 'Proposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    def set_owner
      @user = User.find_by(id: @proposal.user_id)
      if @user
        @dueno = @user.first_name + " " + @user.last_name
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_params
      params.require(:proposal).permit(:texto)
    end
end
