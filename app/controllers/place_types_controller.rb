class PlaceTypesController < ApplicationController
  before_action :set_place_type, only: [:show, :update, :destroy]

  # GET /place_types
  def index
    @place_types = PlaceType.all

    render json: @place_types
  end

  # GET /place_types/1
  def show
    render json: @place_type
  end

  # POST /place_types
  def create
    @place_type = PlaceType.new(place_type_params)

    if @place_type.save
      render json: @place_type, status: :created, location: @place_type
    else
      render json: @place_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /place_types/1
  def update
    if @place_type.update(place_type_params)
      render json: @place_type
    else
      render json: @place_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /place_types/1
  def destroy
    @place_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place_type
      @place_type = PlaceType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_type_params
      params.require(:place_type).permit(:name)
    end
end
