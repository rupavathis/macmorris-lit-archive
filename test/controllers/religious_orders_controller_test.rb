require "test_helper"

class ReligiousOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @religious_order = religious_orders(:one)
  end

  test "should get index" do
    get religious_orders_url, as: :json
    assert_response :success
  end

  test "should create religious_order" do
    assert_difference('ReligiousOrder.count') do
      post religious_orders_url, params: { religious_order: { name: @religious_order.name } }, as: :json
    end

    assert_response 201
  end

  test "should show religious_order" do
    get religious_order_url(@religious_order), as: :json
    assert_response :success
  end

  test "should update religious_order" do
    patch religious_order_url(@religious_order), params: { religious_order: { name: @religious_order.name } }, as: :json
    assert_response 200
  end

  test "should destroy religious_order" do
    assert_difference('ReligiousOrder.count', -1) do
      delete religious_order_url(@religious_order), as: :json
    end

    assert_response 204
  end
end
