class PeopleSitesController < ApplicationController
  before_action :set_people_site, only: [:show, :update, :destroy]

  # GET /people_sites
  def index
    @people_sites = PeopleSite.all

    render json: @people_sites
  end

  # GET /people_sites/1
  def show
    render json: @people_site
  end

  # POST /people_sites
  def create
    @people_site = PeopleSite.new(people_site_params)

    if @people_site.save
      render json: @people_site, status: :created, location: @people_site
    else
      render json: @people_site.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people_sites/1
  def update
    if @people_site.update(people_site_params)
      render json: @people_site
    else
      render json: @people_site.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people_sites/1
  def destroy
    @people_site.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_people_site
      @people_site = PeopleSite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def people_site_params
      params.require(:people_site).permit(:source_target_type_id, :person_id, :site_id, :birth_death_date_type_id, :start_date, :end_date, :time_period_id, :place_id, :reference_text)
    end
end
