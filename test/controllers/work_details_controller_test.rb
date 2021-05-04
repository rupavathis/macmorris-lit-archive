require "test_helper"

class WorkDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_detail = work_details(:one)
  end

  test "should get index" do
    get work_details_url, as: :json
    assert_response :success
  end

  test "should create work_detail" do
    assert_difference('WorkDetail.count') do
      post work_details_url, params: { work_detail: { authorship_id: @work_detail.authorship_id, bardic_id: @work_detail.bardic_id, desc: @work_detail.desc, display_title: @work_detail.display_title, marc_id: @work_detail.marc_id, person_id: @work_detail.person_id, place_id: @work_detail.place_id, shelfmark: @work_detail.shelfmark, title: @work_detail.title, visualisation_location: @work_detail.visualisation_location, work_classification_id: @work_detail.work_classification_id, work_date: @work_detail.work_date, work_form_id: @work_detail.work_form_id, work_id: @work_detail.work_id, work_link: @work_detail.work_link, work_source_library_id: @work_detail.work_source_library_id } }, as: :json
    end

    assert_response 201
  end

  test "should show work_detail" do
    get work_detail_url(@work_detail), as: :json
    assert_response :success
  end

  test "should update work_detail" do
    patch work_detail_url(@work_detail), params: { work_detail: { authorship_id: @work_detail.authorship_id, bardic_id: @work_detail.bardic_id, desc: @work_detail.desc, display_title: @work_detail.display_title, marc_id: @work_detail.marc_id, person_id: @work_detail.person_id, place_id: @work_detail.place_id, shelfmark: @work_detail.shelfmark, title: @work_detail.title, visualisation_location: @work_detail.visualisation_location, work_classification_id: @work_detail.work_classification_id, work_date: @work_detail.work_date, work_form_id: @work_detail.work_form_id, work_id: @work_detail.work_id, work_link: @work_detail.work_link, work_source_library_id: @work_detail.work_source_library_id } }, as: :json
    assert_response 200
  end

  test "should destroy work_detail" do
    assert_difference('WorkDetail.count', -1) do
      delete work_detail_url(@work_detail), as: :json
    end

    assert_response 204
  end
end
