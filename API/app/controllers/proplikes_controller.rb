class ProplikesController < ApplicationController
  before_action :restrict_access
  before_action :find_owner
  before_action :set_proplike, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy]

  # GET /proposals/:proposal_id/proplikes
  # GET /proposals/:proposal_id/proplikes.json
  def index
    @proplikes = @proposal.proplikes
  end

  # GET /proposals/:proposal_id/proplikes/1
  # GET /proposals/:proposal_id/proplikes/1.json
  def show
    @proplike = @proposal.proplikes.find(params[:id])
  end

  # GET /proposals/:proposal_id/proplikes/new
  def new
    @proplike = @proposal.proplikes.build
  end

  # GET /proposals/:proposal_id/proplikes/1/edit
  def edit
    @proplike = @proposal.proplikes.find(params[:id])
  end

  # POST /proposals/:proposal_id/proplikes
  # POST /proposals/:proposal_id/proplikes.json
  def create
    @proplike = @proposal.proplikes.create(proplike_params)
    @proplike.user ||= current_user
    @proplike.user ||= current_user_api

    respond_to do |format|
      if @proplike.save
        format.html { redirect_to @proplike.proposal, notice: 'Proplike was successfully created.' }
        format.json { render :show, status: :created, location: [@proplike.proposal, @proplike] }
      else
        format.html { render :new }
        format.json { render json: @proplike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposals/:proposal_id/proplikes/1
  # PATCH/PUT /proposals/:proposal_id/proplikes/1.json
  def update
    @proplike = @proposal.proplikes.find(params[:id])
    respond_to do |format|
      if @proplike.update(proplike_params)
        format.html { redirect_to @proplike.proposal, notice: 'Proplike was successfully updated.' }
        format.json { render :show, status: :ok, location: [@proplike.proposal, @proplike] }
      else
        format.html { render :edit }
        format.json { render json: @proplike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/:proposal_id/proplikes/1
  # DELETE /proposals/:proposal_id/proplikes/1.json
  def destroy
    @proplike = @proposal.proplikes.find(params[:id])
    @proplike.destroy
    respond_to do |format|
      format.html { redirect_to proposal_proplikes_url(@proposal), notice: 'Proplike was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authorize
      respond_to do |format|
        format.html{
          if current_user && (@proplike.user.id == current_user.id || is_admin?)
          else
            flash[:notice] = "Access Denied."
            redirect_to proposal_proplikes_path(@proposal)
          end
        }
        format.json{
          if current_user_api && (@proplike.user.id == current_user_api.id || is_admin?)
          else
            render json: {
              error: "Denied Acces",
              status: :forbidden
            }
          end
        }
      end
    end

    def find_owner
      @proposal = Proposal.find(params[:proposal_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_proplike
      @proplike = Proplike.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def proplike_params
      params.require(:proplike).permit(:score)
    end
end
