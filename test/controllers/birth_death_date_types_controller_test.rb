require "test_helper"

class BirthDeathDateTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @birth_death_date_type = birth_death_date_types(:one)
  end

  test "should get index" do
    get birth_death_date_types_url, as: :json
    assert_response :success
  end

  test "should create birth_death_date_type" do
    assert_difference('BirthDeathDateType.count') do
      post birth_death_date_types_url, params: { birth_death_date_type: { name: @birth_death_date_type.name } }, as: :json
    end

    assert_response 201
  end

  test "should show birth_death_date_type" do
    get birth_death_date_type_url(@birth_death_date_type), as: :json
    assert_response :success
  end

  test "should update birth_death_date_type" do
    patch birth_death_date_type_url(@birth_death_date_type), params: { birth_death_date_type: { name: @birth_death_date_type.name } }, as: :json
    assert_response 200
  end

  test "should destroy birth_death_date_type" do
    assert_difference('BirthDeathDateType.count', -1) do
      delete birth_death_date_type_url(@birth_death_date_type), as: :json
    end

    assert_response 204
  end
end
