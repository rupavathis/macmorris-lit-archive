# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_12_21_204129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attribs", force: :cascade do |t|
    t.string "name"
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_attribs_on_role_id"
  end

  create_table "attribs_people", id: false, force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "attrib_id", null: false
  end

  create_table "authorships", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bardic_poetries", force: :cascade do |t|
    t.string "bardic_id"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "birth_death_date_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "connections", force: :cascade do |t|
    t.string "connection_id"
    t.bigint "source_type_id"
    t.bigint "target_type_id"
    t.bigint "source_id_id"
    t.bigint "target_id_id"
    t.bigint "start_date_type_id"
    t.string "start_date"
    t.bigint "end_date_type_id"
    t.string "end_date"
    t.bigint "time_period_id"
    t.bigint "place_id"
    t.string "reference"
    t.boolean "connection_verified"
    t.bigint "bardic_poetry_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bardic_poetry_id"], name: "index_connections_on_bardic_poetry_id"
    t.index ["end_date_type_id"], name: "index_connections_on_end_date_type_id"
    t.index ["place_id"], name: "index_connections_on_place_id"
    t.index ["source_id_id"], name: "index_connections_on_source_id_id"
    t.index ["source_type_id"], name: "index_connections_on_source_type_id"
    t.index ["start_date_type_id"], name: "index_connections_on_start_date_type_id"
    t.index ["target_id_id"], name: "index_connections_on_target_id_id"
    t.index ["target_type_id"], name: "index_connections_on_target_type_id"
    t.index ["time_period_id"], name: "index_connections_on_time_period_id"
  end

  create_table "connections_relationship_types", id: false, force: :cascade do |t|
    t.bigint "connection_id", null: false
    t.bigint "relationship_type_id", null: false
  end

  create_table "events_people_relationship_types", id: false, force: :cascade do |t|
    t.bigint "events_person_id", null: false
    t.bigint "relationship_type_id", null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages_people", id: false, force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "language_id", null: false
  end

  create_table "languages_works", id: false, force: :cascade do |t|
    t.bigint "work_id", null: false
    t.bigint "language_id", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "macmorris_id"
    t.boolean "is_cultural_actor"
    t.string "first_name"
    t.string "last_name"
    t.string "maiden_name"
    t.string "husbands_name"
    t.string "aristocratic_title"
    t.string "pseudonym"
    t.string "initials"
    t.string "religious_title"
    t.string "name_in_religion"
    t.string "other_names"
    t.string "display_name", null: false
    t.bigint "gender_id"
    t.bigint "birth_date_type_id"
    t.string "date_of_birth"
    t.bigint "place_of_birth_id"
    t.bigint "death_date_type_id"
    t.string "date_of_death"
    t.bigint "place_of_death_id"
    t.bigint "flourishing_date_type_id"
    t.string "flourishing_date"
    t.bigint "place_of_flourishing_id"
    t.string "active_in_ireland_start"
    t.string "active_in_ireland_end"
    t.bigint "religious_order_id"
    t.string "self_described_identity"
    t.string "nationality"
    t.string "quotes"
    t.string "notes"
    t.string "reference_text"
    t.string "odnb_id"
    t.string "dib_id"
    t.string "tnop_id"
    t.string "wikidata_id"
    t.string "ainm_id"
    t.string "sdfb"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["birth_date_type_id"], name: "index_people_on_birth_date_type_id"
    t.index ["death_date_type_id"], name: "index_people_on_death_date_type_id"
    t.index ["flourishing_date_type_id"], name: "index_people_on_flourishing_date_type_id"
    t.index ["gender_id"], name: "index_people_on_gender_id"
    t.index ["place_of_birth_id"], name: "index_people_on_place_of_birth_id"
    t.index ["place_of_death_id"], name: "index_people_on_place_of_death_id"
    t.index ["place_of_flourishing_id"], name: "index_people_on_place_of_flourishing_id"
    t.index ["religious_order_id"], name: "index_people_on_religious_order_id"
  end

  create_table "people_religious_designations", id: false, force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "religious_designation_id", null: false
  end

  create_table "people_religious_subtypes", id: false, force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "religious_subtype_id", null: false
  end

  create_table "people_sites", id: false, force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "site_id", null: false
  end

  create_table "people_works", id: false, force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "work_id", null: false
  end

  create_table "place_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "location"
    t.string "name"
    t.string "gaelic_name"
    t.bigint "place_type_id", null: false
    t.boolean "is_available"
    t.float "latitude"
    t.float "longitude"
    t.boolean "is_accurate"
    t.string "wikidata"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_type_id"], name: "index_places_on_place_type_id"
  end

  create_table "places_works", id: false, force: :cascade do |t|
    t.bigint "work_id", null: false
    t.bigint "place_id", null: false
  end

  create_table "relationship_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relationship_types", force: :cascade do |t|
    t.string "name"
    t.bigint "relationship_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["relationship_category_id"], name: "index_relationship_types_on_relationship_category_id"
  end

  create_table "religious_designations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "religious_orders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "religious_subtypes", force: :cascade do |t|
    t.string "name"
    t.bigint "religious_designation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["religious_designation_id"], name: "index_religious_subtypes_on_religious_designation_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "site_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string "site_id"
    t.bigint "site_type_id"
    t.string "name"
    t.string "gaelic_name"
    t.bigint "place_id"
    t.text "description"
    t.text "gaelic_decription"
    t.string "reference_text"
    t.bigint "bardic_poetry_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bardic_poetry_id"], name: "index_sites_on_bardic_poetry_id"
    t.index ["place_id"], name: "index_sites_on_place_id"
    t.index ["site_type_id"], name: "index_sites_on_site_type_id"
  end

  create_table "source_target_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "time_periods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_classifications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_classifications_works", id: false, force: :cascade do |t|
    t.bigint "work_id", null: false
    t.bigint "work_classification_id", null: false
  end

  create_table "work_formats", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_forms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_source_libraries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "works", force: :cascade do |t|
    t.string "work_id"
    t.bigint "author_id_id"
    t.bigint "authorship_id"
    t.bigint "work_form_id"
    t.text "title"
    t.string "display_title"
    t.string "work_date"
    t.string "visualisation_location"
    t.string "shelfmark"
    t.bigint "work_source_library_id"
    t.bigint "work_format_id"
    t.string "marc_id"
    t.bigint "bardic_poetry_id"
    t.string "link_uri"
    t.string "description"
    t.text "reference"
    t.boolean "by_irish"
    t.boolean "while_ireland"
    t.boolean "about_ireland"
    t.boolean "printed_in_ireland"
    t.boolean "bf_af_ireland"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id_id"], name: "index_works_on_author_id_id"
    t.index ["authorship_id"], name: "index_works_on_authorship_id"
    t.index ["bardic_poetry_id"], name: "index_works_on_bardic_poetry_id"
    t.index ["work_form_id"], name: "index_works_on_work_form_id"
    t.index ["work_format_id"], name: "index_works_on_work_format_id"
    t.index ["work_source_library_id"], name: "index_works_on_work_source_library_id"
  end

  add_foreign_key "attribs", "roles"
  add_foreign_key "places", "place_types"
  add_foreign_key "relationship_types", "relationship_categories"
  add_foreign_key "religious_subtypes", "religious_designations"
  add_foreign_key "sites", "bardic_poetries"
  add_foreign_key "sites", "places"
  add_foreign_key "sites", "site_types"
end
