require "test_helper"

class PeopleSitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @people_site = people_sites(:one)
  end

  test "should get index" do
    get people_sites_url, as: :json
    assert_response :success
  end

  test "should create people_site" do
    assert_difference('PeopleSite.count') do
      post people_sites_url, params: { people_site: { birth_death_date_type_id: @people_site.birth_death_date_type_id, end_date: @people_site.end_date, person_id: @people_site.person_id, place_id: @people_site.place_id, reference_text: @people_site.reference_text, site_id: @people_site.site_id, source_target_type_id: @people_site.source_target_type_id, start_date: @people_site.start_date, time_period_id: @people_site.time_period_id } }, as: :json
    end

    assert_response 201
  end

  test "should show people_site" do
    get people_site_url(@people_site), as: :json
    assert_response :success
  end

  test "should update people_site" do
    patch people_site_url(@people_site), params: { people_site: { birth_death_date_type_id: @people_site.birth_death_date_type_id, end_date: @people_site.end_date, person_id: @people_site.person_id, place_id: @people_site.place_id, reference_text: @people_site.reference_text, site_id: @people_site.site_id, source_target_type_id: @people_site.source_target_type_id, start_date: @people_site.start_date, time_period_id: @people_site.time_period_id } }, as: :json
    assert_response 200
  end

  test "should destroy people_site" do
    assert_difference('PeopleSite.count', -1) do
      delete people_site_url(@people_site), as: :json
    end

    assert_response 204
  end
end
