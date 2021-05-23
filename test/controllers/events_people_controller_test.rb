require "test_helper"

class EventsPeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @events_person = events_people(:one)
  end

  test "should get index" do
    get events_people_url, as: :json
    assert_response :success
  end

  test "should create events_person" do
    assert_difference('EventsPerson.count') do
      post events_people_url, params: { events_person: { birth_death_date_type_id: @events_person.birth_death_date_type_id, end_date: @events_person.end_date, event_id: @events_person.event_id, person_id: @events_person.person_id, place_id: @events_person.place_id, reference_text: @events_person.reference_text, relationship_type_id: @events_person.relationship_type_id, source_target_type_id: @events_person.source_target_type_id, start_date: @events_person.start_date, time_period_id: @events_person.time_period_id } }, as: :json
    end

    assert_response 201
  end

  test "should show events_person" do
    get events_person_url(@events_person), as: :json
    assert_response :success
  end

  test "should update events_person" do
    patch events_person_url(@events_person), params: { events_person: { birth_death_date_type_id: @events_person.birth_death_date_type_id, end_date: @events_person.end_date, event_id: @events_person.event_id, person_id: @events_person.person_id, place_id: @events_person.place_id, reference_text: @events_person.reference_text, relationship_type_id: @events_person.relationship_type_id, source_target_type_id: @events_person.source_target_type_id, start_date: @events_person.start_date, time_period_id: @events_person.time_period_id } }, as: :json
    assert_response 200
  end

  test "should destroy events_person" do
    assert_difference('EventsPerson.count', -1) do
      delete events_person_url(@events_person), as: :json
    end

    assert_response 204
  end
end
