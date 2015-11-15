class CommentsController < ApplicationController
  before_action :find_owner
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :restrict_access
  before_action :authorize, only: [:edit, :update, :destroy]

  def authorize
    respond_to do |format|
      format.html{
        if current_user && (@comment.user.id == current_user.id || is_admin?)
        else
          flash[:notice] = "Access Denied."
          redirect_to proposal_comments_path(@proposal)
        end
      }
      format.json{
        if current_user_api && (@comment.user.id == current_user_api.id || is_admin?)
        else
          render json: {
            error: "Denied Acces",
            status: :forbidden
          }
        end
      }
    end
  end
  # GET /proposals/:proposal_id/comments
  # GET /proposals/:proposal_id/comments.json
  def index
    @comments = @proposal.comments
  end

  # GET /proposals/:proposal_id/comments/1
  # GET /proposals/:proposal_id/comments/1.json
  def show
    @comment = @proposal.comments.find(params[:id])
  end

  # GET /proposals/:proposal_id/comments/new
  def new
    @comment = @proposal.comments.build
  end

  # GET /proposals/:proposal_id/comments/1/edit
  def edit
    @comment = @proposal.comments.find(params[:id])
  end

  # POST /proposals/:proposal_id/comments
  # POST /proposals/:proposal_id/comments.json
  def create
    @comment = @proposal.comments.create(proposal_comment_params)
    @comment.user ||= current_user
    @comment.user ||= current_user_api

    respond_to do |format|
      if @comment.save
        format.html { redirect_to([@comment.proposal, @comment] , notice: 'Comment was successfully created.') }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposals/:proposal_id/comments/1
  # PATCH/PUT /proposals/:proposal_id/comments/1.json
  def update
    @comment = @proposal.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(proposal_comment_params)
        format.html { redirect_to([@comment.proposal, @comment] , notice: 'Comment was successfully updated.') }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/:proposal_id/comments/1
  # DELETE /proposals/:proposal_id/comments/1.json
  def destroy
    @comment = @proposal.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to proposal_comments_path(@proposal) , notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_owner
      @proposal = Proposal.find(params[:proposal_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_comment_params
      params.require(:comment).permit(:texto, :appproved)
    end
end
