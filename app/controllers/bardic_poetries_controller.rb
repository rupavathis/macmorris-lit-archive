class BardicPoetriesController < ApplicationController
  before_action :set_bardic_poetry, only: [:show, :update, :destroy]

  # GET /bardic_poetries
  def index
    @bardic_poetries = BardicPoetry.all

    render json: @bardic_poetries
  end

  # GET /bardic_poetries/1
  def show
    render json: @bardic_poetry
  end

  # POST /bardic_poetries
  def create
    @bardic_poetry = BardicPoetry.new(bardic_poetry_params)

    if @bardic_poetry.save
      render json: @bardic_poetry, status: :created, location: @bardic_poetry
    else
      render json: @bardic_poetry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bardic_poetries/1
  def update
    if @bardic_poetry.update(bardic_poetry_params)
      render json: @bardic_poetry
    else
      render json: @bardic_poetry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bardic_poetries/1
  def destroy
    @bardic_poetry.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bardic_poetry
      @bardic_poetry = BardicPoetry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bardic_poetry_params
      params.require(:bardic_poetry).permit(:bardic_id, :url)
    end
end
