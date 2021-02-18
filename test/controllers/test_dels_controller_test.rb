require "test_helper"

class TestDelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_del = test_dels(:one)
  end

  test "should get index" do
    get test_dels_url, as: :json
    assert_response :success
  end

  test "should create test_del" do
    assert_difference('TestDel.count') do
      post test_dels_url, params: { test_del: { date_type_id: @test_del.date_type_id } }, as: :json
    end

    assert_response 201
  end

  test "should show test_del" do
    get test_del_url(@test_del), as: :json
    assert_response :success
  end

  test "should update test_del" do
    patch test_del_url(@test_del), params: { test_del: { date_type_id: @test_del.date_type_id } }, as: :json
    assert_response 200
  end

  test "should destroy test_del" do
    assert_difference('TestDel.count', -1) do
      delete test_del_url(@test_del), as: :json
    end

    assert_response 204
  end
end
