require "test_helper"

class WorkFormatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_format = work_formats(:one)
  end

  test "should get index" do
    get work_formats_url, as: :json
    assert_response :success
  end

  test "should create work_format" do
    assert_difference('WorkFormat.count') do
      post work_formats_url, params: { work_format: { name: @work_format.name } }, as: :json
    end

    assert_response 201
  end

  test "should show work_format" do
    get work_format_url(@work_format), as: :json
    assert_response :success
  end

  test "should update work_format" do
    patch work_format_url(@work_format), params: { work_format: { name: @work_format.name } }, as: :json
    assert_response 200
  end

  test "should destroy work_format" do
    assert_difference('WorkFormat.count', -1) do
      delete work_format_url(@work_format), as: :json
    end

    assert_response 204
  end
end
