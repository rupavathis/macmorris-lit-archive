class WorkFormsController < ApplicationController
  before_action :set_work_form, only: [:show, :update, :destroy]

  # GET /work_forms
  def index
    @work_forms = WorkForm.all

    render json: @work_forms
  end

  # GET /work_forms/1
  def show
    render json: @work_form
  end

  # POST /work_forms
  def create
    @work_form = WorkForm.new(work_form_params)

    if @work_form.save
      render json: @work_form, status: :created, location: @work_form
    else
      render json: @work_form.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /work_forms/1
  def update
    if @work_form.update(work_form_params)
      render json: @work_form
    else
      render json: @work_form.errors, status: :unprocessable_entity
    end
  end

  # DELETE /work_forms/1
  def destroy
    @work_form.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_form
      @work_form = WorkForm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_form_params
      params.require(:work_form).permit(:name)
    end
end
