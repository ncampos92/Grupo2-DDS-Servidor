class LikesController < ApplicationController
  before_action :restrict_access
  before_action :find_owner
  before_action :set_like, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy]

  # GET  /proposals/:proposal_id/comments/:comment_id/likes
  # GET /proposals/:proposal_id/comments/:comment_id/likes.json
  def index
    @likes = @comment.likes
  end

  # GET /proposals/:proposal_id/comments/:comment_id/likes/1
  # GET /proposals/:proposal_id/comments/:comment_id/likes/1.json
  def show
    @like = @comment.likes.find(params[:id])
  end

  # GET /proposals/:proposal_id/comments/:comment_id/likes/new
  def new
    @like = @comment.likes.build
  end

  # GET /proposals/:proposal_id/comments/:comment_id/likes/1/edit
  def edit
    @like = @comment.likes.find(params[:id])
  end

  # POST /proposals/:proposal_id/comments/:comment_id/likes
  # POST /proposals/:proposal_id/comments/:comment_id/likes.json
  def create
    @like = @comment.likes.create(like_params)
    @like.user ||= current_user
    @like.user ||= current_user_api

    respond_to do |format|
      if @like.save
        format.html { redirect_to [@proposal, @like.comment], notice: 'Like was successfully created.' }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposals/:proposal_id/comments/:comment_id/likes/1
  # PATCH/PUT /proposals/:proposal_id/comments/:comment_id/likes/1.json
  def update
    @like = @comment.likes.find(params[:id])
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to [@proposal, @like.comment], notice: 'Like was successfully updated.' }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :edit }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/:proposal_id/comments/:comment_id/likes/1
  # DELETE /proposals/:proposal_id/comments/:comment_id/likes/1.json
  def destroy
    @like = @comment.likes.find(params[:id])
    @like.destroy
    respond_to do |format|
      format.html { redirect_to proposal_comment_likes_path(@proposal, @comment), notice: 'Like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authorize
      respond_to do |format|
        format.html{
          if current_user && (@like.user.id == current_user.id || is_admin?)
          else
            flash[:notice] = "Access Denied."
            redirect_to proposal_comment_likes_path(@comment)
          end
        }
        format.json{
          if current_user_api && (@like.user.id == current_user_api.id || is_admin?)
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
      @comment = @proposal.comments.find(params[:comment_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:score)
    end
end
