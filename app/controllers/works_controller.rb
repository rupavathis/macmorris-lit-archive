class WorksController < ApplicationController
  before_action :set_work, only: [:show, :update, :destroy]

  # GET /works
  def index
    @works = Work.all

    render json: @works
  end

  # GET /works/1
  def show
    render json: @work, include:  [place: {only: :name}, language: {only: :name}, work_classification: {only: :name}, patron_id: {only: [:id, :display_name]},
    author_id: {only: :display_name}, printer_id: {only: [:id, :display_name]},publisher_id: {only: [:id, :display_name]},bookseller_id: {only: [:id, :display_name]}
  ]
  end

  # POST /works
  def create
    @work = Work.new(work_params)

    if @work.save
      render json: @work, status: :created, location: @work
    else
      render json: @work.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /works/1
  def update
    if @work.update(work_params)
      render json: @work
    else
      render json: @work.errors, status: :unprocessable_entity
    end
  end

  # DELETE /works/1
  def destroy
    @work.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_params
      params.require(:work).permit(:work_id, :person_id, :authorship_id, :work_form_id, :title, :display_title, :language_id, :work_date, :place_id, :visualisation_location, :shelfmark, :work_source_library_id, :marc_id, :bardic_id, :link_uri, :description)
    end
end
