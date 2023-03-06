class AttribsController < ApplicationController
  before_action :set_attrib, only: [:show, :update, :destroy]

  # GET /attribs
  def index
    @attribs = Attrib.all

    render json: @attribs, only: [:id, :name, :role_id]
  end
  # GET /attribs/1
  def show
    render json: @attrib, include: [role: {only: :name}]
  end

   # GET /attribs/roles/1
   def showRoles
    r = Attrib.where(role_id: (params[:id]))
    render json: r, only: [:id, :name]
  end

  # POST /attribs
  def create
    @attrib = Attrib.new(attrib_params)

    if @attrib.save
      render json: @attrib, status: :created, location: @attrib
    else
      render json: @attrib.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attribs/1
  def update
    if @attrib.update(attrib_params)
      render json: @attrib
    else
      render json: @attrib.errors, status: :unprocessable_entity
    end
  end

  # DELETE /attribs/1
  def destroy
    @attrib.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attrib
      @attrib = Attrib.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attrib_params
      params.require(:attrib).permit(:name, :role_id)
    end
end
