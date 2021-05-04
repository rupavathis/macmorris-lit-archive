class WorkDetailsController < ApplicationController
  before_action :set_work_detail, only: [:show, :update, :destroy]

  # GET /work_details
  def index
    @work_details = WorkDetail.all

    render json: @work_details
  end

  # GET /work_details/1
  def show
    render json: @work_detail
  end

  # POST /work_details
  def create
    @work_detail = WorkDetail.new(work_detail_params)

    if @work_detail.save
      render json: @work_detail, status: :created, location: @work_detail
    else
      render json: @work_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /work_details/1
  def update
    if @work_detail.update(work_detail_params)
      render json: @work_detail
    else
      render json: @work_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /work_details/1
  def destroy
    @work_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_detail
      @work_detail = WorkDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_detail_params
      params.require(:work_detail).permit(:work_id, :person_id, :authorship_id, :work_form_id, :title, :display_title, :work_classification_id, :work_date, :place_id, :visualisation_location, :shelfmark, :work_source_library_id, :marc_id, :bardic_id, :work_link, :desc)
    end
end
