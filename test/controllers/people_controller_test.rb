require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get people_url, as: :json
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post people_url, params: { person: { active_in_ireland_end: @person.active_in_ireland_end, active_in_ireland_start: @person.active_in_ireland_start, ainm_id: @person.ainm_id, aristocratic_title: @person.aristocratic_title, birth_date_type_id: @person.birth_date_type_id, date_of_birth: @person.date_of_birth, date_of_death: @person.date_of_death, death_date_type_id: @person.death_date_type_id, dib_id: @person.dib_id, display_name: @person.display_name, first_name: @person.first_name, florishing_date_type_id: @person.florishing_date_type_id, flourishing_date: @person.flourishing_date, gender: @person.gender, husbands_name: @person.husbands_name, initials: @person.initials, is_cultural_actor: @person.is_cultural_actor, last_name: @person.last_name, macmorris_id: @person.macmorris_id, maiden_name: @person.maiden_name, name_in_religion: @person.name_in_religion, notes: @person.notes, odnb_id: @person.odnb_id, other_names: @person.other_names, place_id: @person.place_id, pseudonym: @person.pseudonym, quotes: @person.quotes, reference_text: @person.reference_text, religious_order_id: @person.religious_order_id, religious_title: @person.religious_title, sdfb: @person.sdfb, self_described_identity: @person.self_described_identity, tnop_id: @person.tnop_id, wikidata_id: @person.wikidata_id } }, as: :json
    end

    assert_response 201
  end

  test "should show person" do
    get person_url(@person), as: :json
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { active_in_ireland_end: @person.active_in_ireland_end, active_in_ireland_start: @person.active_in_ireland_start, ainm_id: @person.ainm_id, aristocratic_title: @person.aristocratic_title, birth_date_type_id: @person.birth_date_type_id, date_of_birth: @person.date_of_birth, date_of_death: @person.date_of_death, death_date_type_id: @person.death_date_type_id, dib_id: @person.dib_id, display_name: @person.display_name, first_name: @person.first_name, florishing_date_type_id: @person.florishing_date_type_id, flourishing_date: @person.flourishing_date, gender: @person.gender, husbands_name: @person.husbands_name, initials: @person.initials, is_cultural_actor: @person.is_cultural_actor, last_name: @person.last_name, macmorris_id: @person.macmorris_id, maiden_name: @person.maiden_name, name_in_religion: @person.name_in_religion, notes: @person.notes, odnb_id: @person.odnb_id, other_names: @person.other_names, place_id: @person.place_id, pseudonym: @person.pseudonym, quotes: @person.quotes, reference_text: @person.reference_text, religious_order_id: @person.religious_order_id, religious_title: @person.religious_title, sdfb: @person.sdfb, self_described_identity: @person.self_described_identity, tnop_id: @person.tnop_id, wikidata_id: @person.wikidata_id } }, as: :json
    assert_response 200
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete person_url(@person), as: :json
    end

    assert_response 204
  end
end
