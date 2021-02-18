require "test_helper"

class WorkFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_form = work_forms(:one)
  end

  test "should get index" do
    get work_forms_url, as: :json
    assert_response :success
  end

  test "should create work_form" do
    assert_difference('WorkForm.count') do
      post work_forms_url, params: { work_form: { name: @work_form.name } }, as: :json
    end

    assert_response 201
  end

  test "should show work_form" do
    get work_form_url(@work_form), as: :json
    assert_response :success
  end

  test "should update work_form" do
    patch work_form_url(@work_form), params: { work_form: { name: @work_form.name } }, as: :json
    assert_response 200
  end

  test "should destroy work_form" do
    assert_difference('WorkForm.count', -1) do
      delete work_form_url(@work_form), as: :json
    end

    assert_response 204
  end
end
