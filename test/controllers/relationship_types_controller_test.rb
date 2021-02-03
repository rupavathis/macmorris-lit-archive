require "test_helper"

class RelationshipTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relationship_type = relationship_types(:one)
  end

  test "should get index" do
    get relationship_types_url, as: :json
    assert_response :success
  end

  test "should create relationship_type" do
    assert_difference('RelationshipType.count') do
      post relationship_types_url, params: { relationship_type: { name: @relationship_type.name, relationship_category_id: @relationship_type.relationship_category_id } }, as: :json
    end

    assert_response 201
  end

  test "should show relationship_type" do
    get relationship_type_url(@relationship_type), as: :json
    assert_response :success
  end

  test "should update relationship_type" do
    patch relationship_type_url(@relationship_type), params: { relationship_type: { name: @relationship_type.name, relationship_category_id: @relationship_type.relationship_category_id } }, as: :json
    assert_response 200
  end

  test "should destroy relationship_type" do
    assert_difference('RelationshipType.count', -1) do
      delete relationship_type_url(@relationship_type), as: :json
    end

    assert_response 204
  end
end
