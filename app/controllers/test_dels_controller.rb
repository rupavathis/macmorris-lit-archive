class TestDelsController < ApplicationController
  before_action :set_test_del, only: [:show, :update, :destroy]

  # GET /test_dels
  def index
    @test_dels = TestDel.all

    render json: @test_dels
  end

  # GET /test_dels/1
  def show
    render json: @test_del
  end

  # POST /test_dels
  def create
    @test_del = TestDel.new(test_del_params)

    if @test_del.save
      render json: @test_del, status: :created, location: @test_del
    else
      render json: @test_del.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /test_dels/1
  def update
    if @test_del.update(test_del_params)
      render json: @test_del
    else
      render json: @test_del.errors, status: :unprocessable_entity
    end
  end

  # DELETE /test_dels/1
  def destroy
    @test_del.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_del
      @test_del = TestDel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_del_params
      params.require(:test_del).permit(:date_type_id)
    end
end
