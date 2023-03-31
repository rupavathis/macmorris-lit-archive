class SitesController < ApplicationController
  before_action :set_site, only: [:show, :update, :destroy]

  # GET /sites
  def index
    @sites = Site.all

    render json: @sites, include: [person_id: {only: [:id, :macmorris_id, :name]}, place: {only: [:name, :location, :id, :latitude, :longitude, :place_type_id ]}]
  end

  # GET /sites/1
  def show
    render json: @site,  include: [:site_type, :place, person_id: {only: [:id, :macmorris_id, :name]}]
  end

  # POST /sites
  def create
    @site = Site.new(site_params)

    if @site.save
      render json: @site, status: :created, location: @site
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sites/1
  def update
    if @site.update(site_params)
      render json: @site
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sites/1
  def destroy
    @site.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def site_params
      params.require(:site).permit(:site_id, :site_type_id, :name, :gaelic_name, :place_id, :description, :gaelic_decription, :reference_text, :bardic_poetry_id)
    end
end
