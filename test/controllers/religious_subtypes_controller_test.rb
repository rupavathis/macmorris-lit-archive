require "test_helper"

class ReligiousSubtypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @religious_subtype = religious_subtypes(:one)
  end

  test "should get index" do
    get religious_subtypes_url, as: :json
    assert_response :success
  end

  test "should create religious_subtype" do
    assert_difference('ReligiousSubtype.count') do
      post religious_subtypes_url, params: { religious_subtype: { name: @religious_subtype.name, religious_designation_id: @religious_subtype.religious_designation_id } }, as: :json
    end

    assert_response 201
  end

  test "should show religious_subtype" do
    get religious_subtype_url(@religious_subtype), as: :json
    assert_response :success
  end

  test "should update religious_subtype" do
    patch religious_subtype_url(@religious_subtype), params: { religious_subtype: { name: @religious_subtype.name, religious_designation_id: @religious_subtype.religious_designation_id } }, as: :json
    assert_response 200
  end

  test "should destroy religious_subtype" do
    assert_difference('ReligiousSubtype.count', -1) do
      delete religious_subtype_url(@religious_subtype), as: :json
    end

    assert_response 204
  end
end
