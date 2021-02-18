require "test_helper"

class SitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site = sites(:one)
  end

  test "should get index" do
    get sites_url, as: :json
    assert_response :success
  end

  test "should create site" do
    assert_difference('Site.count') do
      post sites_url, params: { site: { desc: @site.desc, name_in_EN: @site.name_in_EN, name_in_GA: @site.name_in_GA, place_id: @site.place_id, site_id: @site.site_id, site_type_id: @site.site_type_id } }, as: :json
    end

    assert_response 201
  end

  test "should show site" do
    get site_url(@site), as: :json
    assert_response :success
  end

  test "should update site" do
    patch site_url(@site), params: { site: { desc: @site.desc, name_in_EN: @site.name_in_EN, name_in_GA: @site.name_in_GA, place_id: @site.place_id, site_id: @site.site_id, site_type_id: @site.site_type_id } }, as: :json
    assert_response 200
  end

  test "should destroy site" do
    assert_difference('Site.count', -1) do
      delete site_url(@site), as: :json
    end

    assert_response 204
  end
end
