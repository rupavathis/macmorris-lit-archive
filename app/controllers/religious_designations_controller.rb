class ReligiousDesignationsController < ApplicationController
  before_action :set_religious_designation, only: [:show, :update, :destroy]

  # GET /religious_designations
  def index
    @religious_designations = ReligiousDesignation.all

    render json: @religious_designations
  end

  # GET /religious_designations/1
  def show
    render json: @religious_designation
  end

  # POST /religious_designations
  def create
    @religious_designation = ReligiousDesignation.new(religious_designation_params)

    if @religious_designation.save
      render json: @religious_designation, status: :created, location: @religious_designation
    else
      render json: @religious_designation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /religious_designations/1
  def update
    if @religious_designation.update(religious_designation_params)
      render json: @religious_designation
    else
      render json: @religious_designation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /religious_designations/1
  def destroy
    @religious_designation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_religious_designation
      @religious_designation = ReligiousDesignation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def religious_designation_params
      params.require(:religious_designation).permit(:name)
    end
end
