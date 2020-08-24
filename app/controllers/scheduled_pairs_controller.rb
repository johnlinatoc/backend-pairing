class ScheduledPairsController < ApplicationController
  before_action :set_scheduled_pair, only: [:show, :update, :destroy]

  # GET /scheduled_pairs
  def index
    @scheduled_pairs = ScheduledPair.all

    render json: @scheduled_pairs
  end

  # GET /scheduled_pairs/1
  def show
    render json: @scheduled_pair
  end

  # POST /scheduled_pairs
  def create
    @scheduled_pair = ScheduledPair.new(scheduled_pair_params)

    if @scheduled_pair.save
      render json: @scheduled_pair, status: :created, location: @scheduled_pair
    else
      render json: @scheduled_pair.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scheduled_pairs/1
  def update
    if @scheduled_pair.update(scheduled_pair_params)
      render json: @scheduled_pair
    else
      render json: @scheduled_pair.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scheduled_pairs/1
  def destroy
    @scheduled_pair.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_pair
      @scheduled_pair = ScheduledPair.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scheduled_pair_params
      params.require(:scheduled_pair).permit(:pair_id, :user_id)
    end
end
