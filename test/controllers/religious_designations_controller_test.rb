require "test_helper"

class ReligiousDesignationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @religious_designation = religious_designations(:one)
  end

  test "should get index" do
    get religious_designations_url, as: :json
    assert_response :success
  end

  test "should create religious_designation" do
    assert_difference('ReligiousDesignation.count') do
      post religious_designations_url, params: { religious_designation: { name: @religious_designation.name } }, as: :json
    end

    assert_response 201
  end

  test "should show religious_designation" do
    get religious_designation_url(@religious_designation), as: :json
    assert_response :success
  end

  test "should update religious_designation" do
    patch religious_designation_url(@religious_designation), params: { religious_designation: { name: @religious_designation.name } }, as: :json
    assert_response 200
  end

  test "should destroy religious_designation" do
    assert_difference('ReligiousDesignation.count', -1) do
      delete religious_designation_url(@religious_designation), as: :json
    end

    assert_response 204
  end
end
