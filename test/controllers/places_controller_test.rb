require "test_helper"

class PlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place = places(:one)
  end

  test "should get index" do
    get places_url, as: :json
    assert_response :success
  end

  test "should create place" do
    assert_difference('Place.count') do
      post places_url, params: { place: { geo_code: @place.geo_code, is_accurate: @place.is_accurate, is_available: @place.is_available, name_in_EN: @place.name_in_EN, name_in_GA: @place.name_in_GA, place_type_id: @place.place_type_id } }, as: :json
    end

    assert_response 201
  end

  test "should show place" do
    get place_url(@place), as: :json
    assert_response :success
  end

  test "should update place" do
    patch place_url(@place), params: { place: { geo_code: @place.geo_code, is_accurate: @place.is_accurate, is_available: @place.is_available, name_in_EN: @place.name_in_EN, name_in_GA: @place.name_in_GA, place_type_id: @place.place_type_id } }, as: :json
    assert_response 200
  end

  test "should destroy place" do
    assert_difference('Place.count', -1) do
      delete place_url(@place), as: :json
    end

    assert_response 204
  end
end
