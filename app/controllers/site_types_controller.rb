class SiteTypesController < ApplicationController
  before_action :set_site_type, only: [:show, :update, :destroy]

  # GET /site_types
  def index
    @site_types = SiteType.all

    render json: @site_types
  end

  # GET /site_types/1
  def show
    render json: @site_type
  end

  # POST /site_types
  def create
    @site_type = SiteType.new(site_type_params)

    if @site_type.save
      render json: @site_type, status: :created, location: @site_type
    else
      render json: @site_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /site_types/1
  def update
    if @site_type.update(site_type_params)
      render json: @site_type
    else
      render json: @site_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /site_types/1
  def destroy
    @site_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_type
      @site_type = SiteType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def site_type_params
      params.require(:site_type).permit(:name)
    end
end
