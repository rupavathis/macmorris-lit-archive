class WorkSourceLibrariesController < ApplicationController
  before_action :set_work_source_library, only: [:show, :update, :destroy]

  # GET /work_source_libraries
  def index
    @work_source_libraries = WorkSourceLibrary.all

    render json: @work_source_libraries
  end

  # GET /work_source_libraries/1
  def show
    render json: @work_source_library
  end

  # POST /work_source_libraries
  def create
    @work_source_library = WorkSourceLibrary.new(work_source_library_params)

    if @work_source_library.save
      render json: @work_source_library, status: :created, location: @work_source_library
    else
      render json: @work_source_library.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /work_source_libraries/1
  def update
    if @work_source_library.update(work_source_library_params)
      render json: @work_source_library
    else
      render json: @work_source_library.errors, status: :unprocessable_entity
    end
  end

  # DELETE /work_source_libraries/1
  def destroy
    @work_source_library.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_source_library
      @work_source_library = WorkSourceLibrary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_source_library_params
      params.require(:work_source_library).permit(:name)
    end
end
