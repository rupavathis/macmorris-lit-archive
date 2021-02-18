require "test_helper"

class PlaceTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place_type = place_types(:one)
  end

  test "should get index" do
    get place_types_url, as: :json
    assert_response :success
  end

  test "should create place_type" do
    assert_difference('PlaceType.count') do
      post place_types_url, params: { place_type: { name: @place_type.name } }, as: :json
    end

    assert_response 201
  end

  test "should show place_type" do
    get place_type_url(@place_type), as: :json
    assert_response :success
  end

  test "should update place_type" do
    patch place_type_url(@place_type), params: { place_type: { name: @place_type.name } }, as: :json
    assert_response 200
  end

  test "should destroy place_type" do
    assert_difference('PlaceType.count', -1) do
      delete place_type_url(@place_type), as: :json
    end

    assert_response 204
  end
end
