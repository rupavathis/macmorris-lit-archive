require "test_helper"

class WorkClassificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_classification = work_classifications(:one)
  end

  test "should get index" do
    get work_classifications_url, as: :json
    assert_response :success
  end

  test "should create work_classification" do
    assert_difference('WorkClassification.count') do
      post work_classifications_url, params: { work_classification: { name: @work_classification.name } }, as: :json
    end

    assert_response 201
  end

  test "should show work_classification" do
    get work_classification_url(@work_classification), as: :json
    assert_response :success
  end

  test "should update work_classification" do
    patch work_classification_url(@work_classification), params: { work_classification: { name: @work_classification.name } }, as: :json
    assert_response 200
  end

  test "should destroy work_classification" do
    assert_difference('WorkClassification.count', -1) do
      delete work_classification_url(@work_classification), as: :json
    end

    assert_response 204
  end
end
