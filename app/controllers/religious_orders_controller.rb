class ReligiousOrdersController < ApplicationController
  before_action :set_religious_order, only: [:show, :update, :destroy]

  # GET /religious_orders
  def index
    @religious_orders = ReligiousOrder.all

    render json: @religious_orders
  end

  # GET /religious_orders/1
  def show
    render json: @religious_order
  end

  # POST /religious_orders
  def create
    @religious_order = ReligiousOrder.new(religious_order_params)

    if @religious_order.save
      render json: @religious_order, status: :created, location: @religious_order
    else
      render json: @religious_order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /religious_orders/1
  def update
    if @religious_order.update(religious_order_params)
      render json: @religious_order
    else
      render json: @religious_order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /religious_orders/1
  def destroy
    @religious_order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_religious_order
      @religious_order = ReligiousOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def religious_order_params
      params.require(:religious_order).permit(:name)
    end
end
