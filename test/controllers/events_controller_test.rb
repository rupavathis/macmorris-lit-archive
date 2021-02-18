require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url, as: :json
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_url, params: { event: { birth_death_date_type_id: @event.birth_death_date_type_id, end_date: @event.end_date, event_id: @event.event_id, event_type_id: @event.event_type_id, name_in_EN: @event.name_in_EN, name_in_GA: @event.name_in_GA, notes: @event.notes, place_id: @event.place_id, start_date: @event.start_date } }, as: :json
    end

    assert_response 201
  end

  test "should show event" do
    get event_url(@event), as: :json
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { birth_death_date_type_id: @event.birth_death_date_type_id, end_date: @event.end_date, event_id: @event.event_id, event_type_id: @event.event_type_id, name_in_EN: @event.name_in_EN, name_in_GA: @event.name_in_GA, notes: @event.notes, place_id: @event.place_id, start_date: @event.start_date } }, as: :json
    assert_response 200
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event), as: :json
    end

    assert_response 204
  end
end
