require "test_helper"

class TestModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_model = test_models(:one)
  end

  test "should get index" do
    get test_models_url, as: :json
    assert_response :success
  end

  test "should create test_model" do
    assert_difference('TestModel.count') do
      post test_models_url, params: { test_model: { comments: @test_model.comments, name: @test_model.name } }, as: :json
    end

    assert_response 201
  end

  test "should show test_model" do
    get test_model_url(@test_model), as: :json
    assert_response :success
  end

  test "should update test_model" do
    patch test_model_url(@test_model), params: { test_model: { comments: @test_model.comments, name: @test_model.name } }, as: :json
    assert_response 200
  end

  test "should destroy test_model" do
    assert_difference('TestModel.count', -1) do
      delete test_model_url(@test_model), as: :json
    end

    assert_response 204
  end
end
