require "test_helper"

class WorkSourceLibrariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_source_library = work_source_libraries(:one)
  end

  test "should get index" do
    get work_source_libraries_url, as: :json
    assert_response :success
  end

  test "should create work_source_library" do
    assert_difference('WorkSourceLibrary.count') do
      post work_source_libraries_url, params: { work_source_library: { name: @work_source_library.name } }, as: :json
    end

    assert_response 201
  end

  test "should show work_source_library" do
    get work_source_library_url(@work_source_library), as: :json
    assert_response :success
  end

  test "should update work_source_library" do
    patch work_source_library_url(@work_source_library), params: { work_source_library: { name: @work_source_library.name } }, as: :json
    assert_response 200
  end

  test "should destroy work_source_library" do
    assert_difference('WorkSourceLibrary.count', -1) do
      delete work_source_library_url(@work_source_library), as: :json
    end

    assert_response 204
  end
end
