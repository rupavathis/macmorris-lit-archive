require "test_helper"

class SourceTargetTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source_target_type = source_target_types(:one)
  end

  test "should get index" do
    get source_target_types_url, as: :json
    assert_response :success
  end

  test "should create source_target_type" do
    assert_difference('SourceTargetType.count') do
      post source_target_types_url, params: { source_target_type: { name: @source_target_type.name } }, as: :json
    end

    assert_response 201
  end

  test "should show source_target_type" do
    get source_target_type_url(@source_target_type), as: :json
    assert_response :success
  end

  test "should update source_target_type" do
    patch source_target_type_url(@source_target_type), params: { source_target_type: { name: @source_target_type.name } }, as: :json
    assert_response 200
  end

  test "should destroy source_target_type" do
    assert_difference('SourceTargetType.count', -1) do
      delete source_target_type_url(@source_target_type), as: :json
    end

    assert_response 204
  end
end
