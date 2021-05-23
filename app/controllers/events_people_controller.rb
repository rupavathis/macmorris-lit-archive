class EventsPeopleController < ApplicationController
  before_action :set_events_person, only: [:show, :update, :destroy]

  # GET /events_people
  def index
    @events_people = EventsPerson.all

    render json: @events_people
  end

  # GET /events_people/1
  def show
    render json: @events_person
  end

  # POST /events_people
  def create
    @events_person = EventsPerson.new(events_person_params)

    if @events_person.save
      render json: @events_person, status: :created, location: @events_person
    else
      render json: @events_person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events_people/1
  def update
    if @events_person.update(events_person_params)
      render json: @events_person
    else
      render json: @events_person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events_people/1
  def destroy
    @events_person.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_events_person
      @events_person = EventsPerson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def events_person_params
      params.require(:events_person).permit(:source_target_type_id, :person_id, :event_id, :relationship_type_id, :birth_death_date_type_id, :start_date, :end_date, :time_period_id, :place_id, :reference_text)
    end
end
