class ProplikesController < ApplicationController
  before_action :set_proplike, only: [:show, :edit, :update, :destroy]

  # GET /proplikes
  # GET /proplikes.json
  def index
    @proplikes = Proplike.all
  end

  # GET /proplikes/1
  # GET /proplikes/1.json
  def show
  end

  # GET /proplikes/new
  def new
    @proplike = Proplike.new
  end

  # GET /proplikes/1/edit
  def edit
  end

  # POST /proplikes
  # POST /proplikes.json
  def create
    @proplike = Proplike.new(proplike_params)

    respond_to do |format|
      if @proplike.save
        format.html { redirect_to @proplike, notice: 'Proplike was successfully created.' }
        format.json { render :show, status: :created, location: @proplike }
      else
        format.html { render :new }
        format.json { render json: @proplike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proplikes/1
  # PATCH/PUT /proplikes/1.json
  def update
    respond_to do |format|
      if @proplike.update(proplike_params)
        format.html { redirect_to @proplike, notice: 'Proplike was successfully updated.' }
        format.json { render :show, status: :ok, location: @proplike }
      else
        format.html { render :edit }
        format.json { render json: @proplike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proplikes/1
  # DELETE /proplikes/1.json
  def destroy
    @proplike.destroy
    respond_to do |format|
      format.html { redirect_to proplikes_url, notice: 'Proplike was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proplike
      @proplike = Proplike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proplike_params
      params.require(:proplike).permit(:user_id, :proposal_id, :score)
    end
end
