class TimePeriodsController < ApplicationController
  before_action :set_time_period, only: [:show, :update, :destroy]

  # GET /time_periods
  def index
    @time_periods = TimePeriod.all

    render json: @time_periods
  end

  # GET /time_periods/1
  def show
    render json: @time_period
  end

  # POST /time_periods
  def create
    @time_period = TimePeriod.new(time_period_params)

    if @time_period.save
      render json: @time_period, status: :created, location: @time_period
    else
      render json: @time_period.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /time_periods/1
  def update
    if @time_period.update(time_period_params)
      render json: @time_period
    else
      render json: @time_period.errors, status: :unprocessable_entity
    end
  end

  # DELETE /time_periods/1
  def destroy
    @time_period.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_period
      @time_period = TimePeriod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_period_params
      params.require(:time_period).permit(:name)
    end
end
