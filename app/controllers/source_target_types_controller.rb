class SourceTargetTypesController < ApplicationController
  before_action :set_source_target_type, only: [:show, :update, :destroy]

  # GET /source_target_types
  def index
    @source_target_types = SourceTargetType.all

    render json: @source_target_types
  end

  # GET /source_target_types/1
  def show
    render json: @source_target_type
  end

  # POST /source_target_types
  def create
    @source_target_type = SourceTargetType.new(source_target_type_params)

    if @source_target_type.save
      render json: @source_target_type, status: :created, location: @source_target_type
    else
      render json: @source_target_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /source_target_types/1
  def update
    if @source_target_type.update(source_target_type_params)
      render json: @source_target_type
    else
      render json: @source_target_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /source_target_types/1
  def destroy
    @source_target_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source_target_type
      @source_target_type = SourceTargetType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def source_target_type_params
      params.require(:source_target_type).permit(:name)
    end
end
