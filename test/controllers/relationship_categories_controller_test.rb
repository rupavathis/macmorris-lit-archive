require "test_helper"

class RelationshipCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relationship_category = relationship_categories(:one)
  end

  test "should get index" do
    get relationship_categories_url, as: :json
    assert_response :success
  end

  test "should create relationship_category" do
    assert_difference('RelationshipCategory.count') do
      post relationship_categories_url, params: { relationship_category: { name: @relationship_category.name } }, as: :json
    end

    assert_response 201
  end

  test "should show relationship_category" do
    get relationship_category_url(@relationship_category), as: :json
    assert_response :success
  end

  test "should update relationship_category" do
    patch relationship_category_url(@relationship_category), params: { relationship_category: { name: @relationship_category.name } }, as: :json
    assert_response 200
  end

  test "should destroy relationship_category" do
    assert_difference('RelationshipCategory.count', -1) do
      delete relationship_category_url(@relationship_category), as: :json
    end

    assert_response 204
  end
end
