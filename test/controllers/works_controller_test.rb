require "test_helper"

class WorksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work = works(:one)
  end

  test "should get index" do
    get works_url, as: :json
    assert_response :success
  end

  test "should create work" do
    assert_difference('Work.count') do
      post works_url, params: { work: { authorship_id: @work.authorship_id, bardic_id: @work.bardic_id, description: @work.description, display_title: @work.display_title, language_id: @work.language_id, link_uri: @work.link_uri, marc_id: @work.marc_id, person_id: @work.person_id, place_id: @work.place_id, shelfmark: @work.shelfmark, title: @work.title, visualisation_location: @work.visualisation_location, work_date: @work.work_date, work_form_id: @work.work_form_id, work_id: @work.work_id, work_source_library_id: @work.work_source_library_id } }, as: :json
    end

    assert_response 201
  end

  test "should show work" do
    get work_url(@work), as: :json
    assert_response :success
  end

  test "should update work" do
    patch work_url(@work), params: { work: { authorship_id: @work.authorship_id, bardic_id: @work.bardic_id, description: @work.description, display_title: @work.display_title, language_id: @work.language_id, link_uri: @work.link_uri, marc_id: @work.marc_id, person_id: @work.person_id, place_id: @work.place_id, shelfmark: @work.shelfmark, title: @work.title, visualisation_location: @work.visualisation_location, work_date: @work.work_date, work_form_id: @work.work_form_id, work_id: @work.work_id, work_source_library_id: @work.work_source_library_id } }, as: :json
    assert_response 200
  end

  test "should destroy work" do
    assert_difference('Work.count', -1) do
      delete work_url(@work), as: :json
    end

    assert_response 204
  end
end
