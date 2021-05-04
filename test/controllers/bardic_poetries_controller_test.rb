require "test_helper"

class BardicPoetriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bardic_poetry = bardic_poetries(:one)
  end

  test "should get index" do
    get bardic_poetries_url, as: :json
    assert_response :success
  end

  test "should create bardic_poetry" do
    assert_difference('BardicPoetry.count') do
      post bardic_poetries_url, params: { bardic_poetry: { bardic_id: @bardic_poetry.bardic_id, url: @bardic_poetry.url } }, as: :json
    end

    assert_response 201
  end

  test "should show bardic_poetry" do
    get bardic_poetry_url(@bardic_poetry), as: :json
    assert_response :success
  end

  test "should update bardic_poetry" do
    patch bardic_poetry_url(@bardic_poetry), params: { bardic_poetry: { bardic_id: @bardic_poetry.bardic_id, url: @bardic_poetry.url } }, as: :json
    assert_response 200
  end

  test "should destroy bardic_poetry" do
    assert_difference('BardicPoetry.count', -1) do
      delete bardic_poetry_url(@bardic_poetry), as: :json
    end

    assert_response 204
  end
end
