require "test_helper"

class EventTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_test = event_tests(:one)
  end

  test "should get index" do
    get event_tests_url, as: :json
    assert_response :success
  end

  test "should create event_test" do
    assert_difference('EventTest.count') do
      post event_tests_url, params: { event_test: { birth_death_date_type_id: @event_test.birth_death_date_type_id, end_date: @event_test.end_date, event_id: @event_test.event_id, event_type_id: @event_test.event_type_id, name_in_EN: @event_test.name_in_EN, name_in_GA: @event_test.name_in_GA, notes: @event_test.notes, place_id: @event_test.place_id, start_date: @event_test.start_date } }, as: :json
    end

    assert_response 201
  end

  test "should show event_test" do
    get event_test_url(@event_test), as: :json
    assert_response :success
  end

  test "should update event_test" do
    patch event_test_url(@event_test), params: { event_test: { birth_death_date_type_id: @event_test.birth_death_date_type_id, end_date: @event_test.end_date, event_id: @event_test.event_id, event_type_id: @event_test.event_type_id, name_in_EN: @event_test.name_in_EN, name_in_GA: @event_test.name_in_GA, notes: @event_test.notes, place_id: @event_test.place_id, start_date: @event_test.start_date } }, as: :json
    assert_response 200
  end

  test "should destroy event_test" do
    assert_difference('EventTest.count', -1) do
      delete event_test_url(@event_test), as: :json
    end

    assert_response 204
  end
end
