class WorkClassificationsController < ApplicationController
  before_action :set_work_classification, only: [:show, :update, :destroy]

  # GET /work_classifications
  def index
    @work_classifications = WorkClassification.all

    render json: @work_classifications
  end

  # GET /work_classifications/1
  def show
    render json: @work_classification
  end

  # POST /work_classifications
  def create
    @work_classification = WorkClassification.new(work_classification_params)

    if @work_classification.save
      render json: @work_classification, status: :created, location: @work_classification
    else
      render json: @work_classification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /work_classifications/1
  def update
    if @work_classification.update(work_classification_params)
      render json: @work_classification
    else
      render json: @work_classification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /work_classifications/1
  def destroy
    @work_classification.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_classification
      @work_classification = WorkClassification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_classification_params
      params.require(:work_classification).permit(:name)
    end
end
