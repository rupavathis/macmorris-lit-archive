class WorkFormatsController < ApplicationController
  before_action :set_work_format, only: [:show, :update, :destroy]

  # GET /work_formats
  def index
    @work_formats = WorkFormat.all

    render json: @work_formats
  end

  # GET /work_formats/1
  def show
    render json: @work_format
  end

  # POST /work_formats
  def create
    @work_format = WorkFormat.new(work_format_params)

    if @work_format.save
      render json: @work_format, status: :created, location: @work_format
    else
      render json: @work_format.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /work_formats/1
  def update
    if @work_format.update(work_format_params)
      render json: @work_format
    else
      render json: @work_format.errors, status: :unprocessable_entity
    end
  end

  # DELETE /work_formats/1
  def destroy
    @work_format.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_format
      @work_format = WorkFormat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_format_params
      params.require(:work_format).permit(:name)
    end
end
