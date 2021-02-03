require "test_helper"

class AttribsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attrib = attribs(:one)
  end

  test "should get index" do
    get attribs_url, as: :json
    assert_response :success
  end

  test "should create attrib" do
    assert_difference('Attrib.count') do
      post attribs_url, params: { attrib: { name: @attrib.name, role_id: @attrib.role_id } }, as: :json
    end

    assert_response 201
  end

  test "should show attrib" do
    get attrib_url(@attrib), as: :json
    assert_response :success
  end

  test "should update attrib" do
    patch attrib_url(@attrib), params: { attrib: { name: @attrib.name, role_id: @attrib.role_id } }, as: :json
    assert_response 200
  end

  test "should destroy attrib" do
    assert_difference('Attrib.count', -1) do
      delete attrib_url(@attrib), as: :json
    end

    assert_response 204
  end
end
