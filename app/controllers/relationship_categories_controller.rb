class RelationshipCategoriesController < ApplicationController
  before_action :set_relationship_category, only: [:show, :update, :destroy]

  # GET /relationship_categories
  def index
    @relationship_categories = RelationshipCategory.all

    render json: @relationship_categories
  end

  # GET /relationship_categories/1
  def show
    render json: @relationship_category
  end

  # POST /relationship_categories
  def create
    @relationship_category = RelationshipCategory.new(relationship_category_params)

    if @relationship_category.save
      render json: @relationship_category, status: :created, location: @relationship_category
    else
      render json: @relationship_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /relationship_categories/1
  def update
    if @relationship_category.update(relationship_category_params)
      render json: @relationship_category
    else
      render json: @relationship_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /relationship_categories/1
  def destroy
    @relationship_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relationship_category
      @relationship_category = RelationshipCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def relationship_category_params
      params.require(:relationship_category).permit(:name)
    end
end
