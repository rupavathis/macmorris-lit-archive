require "test_helper"

class SiteTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site_type = site_types(:one)
  end

  test "should get index" do
    get site_types_url, as: :json
    assert_response :success
  end

  test "should create site_type" do
    assert_difference('SiteType.count') do
      post site_types_url, params: { site_type: { name: @site_type.name } }, as: :json
    end

    assert_response 201
  end

  test "should show site_type" do
    get site_type_url(@site_type), as: :json
    assert_response :success
  end

  test "should update site_type" do
    patch site_type_url(@site_type), params: { site_type: { name: @site_type.name } }, as: :json
    assert_response 200
  end

  test "should destroy site_type" do
    assert_difference('SiteType.count', -1) do
      delete site_type_url(@site_type), as: :json
    end

    assert_response 204
  end
end
