require "test_helper"

class AuthorshipTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @authorship_type = authorship_types(:one)
  end

  test "should get index" do
    get authorship_types_url, as: :json
    assert_response :success
  end

  test "should create authorship_type" do
    assert_difference('AuthorshipType.count') do
      post authorship_types_url, params: { authorship_type: { name: @authorship_type.name } }, as: :json
    end

    assert_response 201
  end

  test "should show authorship_type" do
    get authorship_type_url(@authorship_type), as: :json
    assert_response :success
  end

  test "should update authorship_type" do
    patch authorship_type_url(@authorship_type), params: { authorship_type: { name: @authorship_type.name } }, as: :json
    assert_response 200
  end

  test "should destroy authorship_type" do
    assert_difference('AuthorshipType.count', -1) do
      delete authorship_type_url(@authorship_type), as: :json
    end

    assert_response 204
  end
end
