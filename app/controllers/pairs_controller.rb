class PairsController < ApplicationController
  before_action :set_pair, only: [:show, :update, :destroy]

  # GET /pairs
  def index
    @pairs = Pair.all

    render json: @pairs
  end

  # GET /pairs/1
  def show
    render json: @pair
  end

  # POST /pairs
  def create
    @pair = Pair.new(pair_params)

    if @pair.save
      render json: @pair, status: :created, location: @pair
    else
      render json: @pair.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pairs/1
  def update
    if @pair.update(pair_params)
      render json: @pair
    else
      render json: @pair.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pairs/1
  def destroy
    @pair.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pair
      @pair = Pair.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pair_params
      params.require(:pair).permit(:sprint_id)
    end
end
