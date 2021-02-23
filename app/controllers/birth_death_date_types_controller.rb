class BirthDeathDateTypesController < ApplicationController
  before_action :set_birth_death_date_type, only: [:show, :update, :destroy]

  # GET /birth_death_date_types
  def index
    @birth_death_date_types = BirthDeathDateType.all

    render json: @birth_death_date_types
  end

  # GET /birth_death_date_types/1
  def show
    render json: @birth_death_date_type
  end

  # POST /birth_death_date_types
  def create
    @birth_death_date_type = BirthDeathDateType.new(birth_death_date_type_params)

    if @birth_death_date_type.save
      render json: @birth_death_date_type, status: :created, location: @birth_death_date_type
    else
      render json: @birth_death_date_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /birth_death_date_types/1
  def update
    if @birth_death_date_type.update(birth_death_date_type_params)
      render json: @birth_death_date_type
    else
      render json: @birth_death_date_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /birth_death_date_types/1
  def destroy
    @birth_death_date_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_birth_death_date_type
      @birth_death_date_type = BirthDeathDateType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def birth_death_date_type_params
      params.require(:birth_death_date_type).permit(:name)
    end
end
