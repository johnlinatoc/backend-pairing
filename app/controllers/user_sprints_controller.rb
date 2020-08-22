class UserSprintsController < ApplicationController
  before_action :set_user_sprint, only: [:show, :update, :destroy]

  # GET /user_sprints
  def index
    @user_sprints = UserSprint.all

    render json: @user_sprints
  end

  # GET /user_sprints/1
  def show
    render json: @user_sprint
  end

  # POST /user_sprints
  def create
    @user_sprint = UserSprint.new(user_sprint_params)

    if @user_sprint.save
      render json: @user_sprint, status: :created, location: @user_sprint
    else
      render json: @user_sprint.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_sprints/1
  def update
    if @user_sprint.update(user_sprint_params)
      render json: @user_sprint
    else
      render json: @user_sprint.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_sprints/1
  def destroy
    @user_sprint.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_sprint
      @user_sprint = UserSprint.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_sprint_params
      params.fetch(:user_sprint, {})
    end
end
