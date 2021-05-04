require "test_helper"

class ConnectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @connection = connections(:one)
  end

  test "should get index" do
    get connections_url, as: :json
    assert_response :success
  end

  test "should create connection" do
    assert_difference('Connection.count') do
      post connections_url, params: { connection: { birth_death_date_type_id: @connection.birth_death_date_type_id, connection_verified: @connection.connection_verified, end_date: @connection.end_date, place_id: @connection.place_id, reference: @connection.reference, source: @connection.source, source_target_type_id: @connection.source_target_type_id, start_date: @connection.start_date, target: @connection.target, time_period_id: @connection.time_period_id } }, as: :json
    end

    assert_response 201
  end

  test "should show connection" do
    get connection_url(@connection), as: :json
    assert_response :success
  end

  test "should update connection" do
    patch connection_url(@connection), params: { connection: { birth_death_date_type_id: @connection.birth_death_date_type_id, connection_verified: @connection.connection_verified, end_date: @connection.end_date, place_id: @connection.place_id, reference: @connection.reference, source: @connection.source, source_target_type_id: @connection.source_target_type_id, start_date: @connection.start_date, target: @connection.target, time_period_id: @connection.time_period_id } }, as: :json
    assert_response 200
  end

  test "should destroy connection" do
    assert_difference('Connection.count', -1) do
      delete connection_url(@connection), as: :json
    end

    assert_response 204
  end
end
