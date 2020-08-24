class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :update, :destroy, :completed_schedule]

  # GET /schedules
  def index
    @schedules = Schedule.all

    render json: @schedules
  end

  # GET /schedules/1
  def show
    render json: @schedule
  end

  # POST /schedules
  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      @schedule.create_schedule
      render json: @schedule, status: :created, location: @schedule
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schedules/1
  def update
    if @schedule.update(schedule_params)
      render json: @schedule
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /schedules/1
  def destroy
    @schedule.destroy
  end

  #  /schedules/1/completed_schedule
  def completed_schedule
    #show all sprints associated with the specific schedule_id sent in
    @completed_schedule = {}
    @scheduled_sprints = Sprint.where(schedule_id: @schedule.id)

    @scheduled_sprints.each do |sprint|
      @completed_schedule["sprint #{sprint.id}"] = sprint.pairs.map {|pair| pair.users.map {|user| user.name}}
    end

    render json: @completed_schedule
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def schedule_params
      params.require(:schedule).permit(:weeks)
    end
end
