class ReligiousSubtypesController < ApplicationController
  before_action :set_religious_subtype, only: [:show, :update, :destroy]

  # GET /religious_subtypes
  def index
    @religious_subtypes = ReligiousSubtype.all

    render json: @religious_subtypes
  end

  # GET /religious_subtypes/1
  def show
    render json: @religious_subtype
  end

  # POST /religious_subtypes
  def create
    @religious_subtype = ReligiousSubtype.new(religious_subtype_params)

    if @religious_subtype.save
      render json: @religious_subtype, status: :created, location: @religious_subtype
    else
      render json: @religious_subtype.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /religious_subtypes/1
  def update
    if @religious_subtype.update(religious_subtype_params)
      render json: @religious_subtype
    else
      render json: @religious_subtype.errors, status: :unprocessable_entity
    end
  end

  # DELETE /religious_subtypes/1
  def destroy
    @religious_subtype.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_religious_subtype
      @religious_subtype = ReligiousSubtype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def religious_subtype_params
      params.require(:religious_subtype).permit(:name, :religious_designation_id)
    end
end
