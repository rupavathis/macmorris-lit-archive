class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :update, :destroy]

  # GET /people
  def index
    @people = Person.all

    render json: @people
  end

  # GET /people/1
  def show
    render json: @person
  end

  # POST /people
  def create
    @person = Person.new(person_params)

    if @person.save
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:macmorris_id, :is_cultural_actor, :first_name, :last_name, :maiden_name, :husbands_name, :aristocratic_title, :pseudonym, :initials, :religious_title, :name_in_religion, :other_names, :display_name, :gender, :birth_date_type_id, :date_of_birth, :place_id, :death_date_type_id, :date_of_death, :florishing_date_type_id, :flourishing_date, :active_in_ireland_start, :active_in_ireland_end, :religious_order_id, :self_described_identity, :quotes, :notes, :reference_text, :odnb_id, :dib_id, :tnop_id, :wikidata_id, :ainm_id, :sdfb)
    end
end
