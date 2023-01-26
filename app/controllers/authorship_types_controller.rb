class AuthorshipTypesController < ApplicationController
  before_action :set_authorship_type, only: [:show, :update, :destroy]

  # GET /authorship_types
  def index
    @authorship_types = AuthorshipType.all

    render json: @authorship_types, only: [:id, :name], include: [:people]
  end

  # GET /authorship_types/1
  def show
    render json: @authorship_type
  end

  # POST /authorship_types
  def create
    @authorship_type = AuthorshipType.new(authorship_type_params)

    if @authorship_type.save
      render json: @authorship_type, status: :created, location: @authorship_type
    else
      render json: @authorship_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /authorship_types/1
  def update
    if @authorship_type.update(authorship_type_params)
      render json: @authorship_type
    else
      render json: @authorship_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /authorship_types/1
  def destroy
    @authorship_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authorship_type
      @authorship_type = AuthorshipType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def authorship_type_params
      params.require(:authorship_type).permit(:name)
    end
end
