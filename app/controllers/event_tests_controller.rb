class EventTestsController < ApplicationController
  before_action :set_event_test, only: [:show, :update, :destroy]

  # GET /event_tests
  def index
    @event_tests = EventTest.all

    render json: @event_tests
  end

  # GET /event_tests/1
  def show
    render json: @event_test
  end

  # POST /event_tests
  def create
    @event_test = EventTest.new(event_test_params)

    if @event_test.save
      render json: @event_test, status: :created, location: @event_test
    else
      render json: @event_test.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /event_tests/1
  def update
    if @event_test.update(event_test_params)
      render json: @event_test
    else
      render json: @event_test.errors, status: :unprocessable_entity
    end
  end

  # DELETE /event_tests/1
  def destroy
    @event_test.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_test
      @event_test = EventTest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_test_params
      params.require(:event_test).permit(:event_id, :event_type_id, :name_in_EN, :name_in_GA, :birth_death_date_type_id, :start_date, :end_date, :place_id, :notes)
    end
end
