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

ActiveRecord::Schema.define(version: 2021_02_18_165102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attribs", force: :cascade do |t|
    t.string "name"
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_attribs_on_role_id"
  end

  create_table "authorships", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "birth_death_date_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "event_id"
    t.bigint "event_type_id", null: false
    t.string "name_in_EN"
    t.string "name_in_GA"
    t.bigint "start_date_type_id"
    t.date "start_date"
    t.bigint "end_date_type_id"
    t.date "end_date"
    t.bigint "place_id", null: false
    t.string "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["end_date_type_id"], name: "index_events_on_end_date_type_id"
    t.index ["event_type_id"], name: "index_events_on_event_type_id"
    t.index ["place_id"], name: "index_events_on_place_id"
    t.index ["start_date_type_id"], name: "index_events_on_start_date_type_id"
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

  create_table "people", force: :cascade do |t|
    t.string "macmorris_id"
    t.boolean "is_cultural_actor"
    t.string "first_name"
    t.string "last_name"
    t.string "maidan_name"
    t.string "husbands_name"
    t.string "aristocratic_title"
    t.string "pseudonym"
    t.string "initials"
    t.string "religious_title"
    t.string "name_in_religion"
    t.string "other_names"
    t.string "display_name"
    t.string "gender"
    t.bigint "birth_date_type_id"
    t.date "date_of_birth"
    t.bigint "death_date_type_id"
    t.date "date_of_death"
    t.bigint "flourishing_date_type_id"
    t.date "flourishing_date"
    t.date "active_in_ireland_start"
    t.date "active_in_ireland_end"
    t.bigint "religious_subtype_id", null: false
    t.bigint "religious_order_id", null: false
    t.string "self_described_identity"
    t.string "quotes"
    t.string "notes"
    t.string "reference_text"
    t.string "odnb_id"
    t.string "dib_id"
    t.string "tnop_id"
    t.string "wikidata_id"
    t.string "ainm_id"
    t.string "patron_id"
    t.string "bardic_id"
    t.string "sdfb"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["birth_date_type_id"], name: "index_people_on_birth_date_type_id"
    t.index ["death_date_type_id"], name: "index_people_on_death_date_type_id"
    t.index ["flourishing_date_type_id"], name: "index_people_on_flourishing_date_type_id"
    t.index ["religious_order_id"], name: "index_people_on_religious_order_id"
    t.index ["religious_subtype_id"], name: "index_people_on_religious_subtype_id"
  end

  create_table "place_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "name_in_EN"
    t.string "name_in_GA"
    t.bigint "place_type_id", null: false
    t.boolean "is_available"
    t.string "geo_code"
    t.boolean "is_accurate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_type_id"], name: "index_places_on_place_type_id"
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
    t.string "name_in_EN"
    t.string "name_in_GA"
    t.bigint "place_id"
    t.string "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_sites_on_place_id"
    t.index ["site_type_id"], name: "index_sites_on_site_type_id"
  end

  create_table "test_models", force: :cascade do |t|
    t.string "name"
    t.string "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_classifications", force: :cascade do |t|
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
    t.bigint "authorship_id", null: false
    t.bigint "patron_id_id"
    t.bigint "work_form_id", null: false
    t.string "title"
    t.string "display_title", null: false
    t.bigint "work_classification_id", null: false
    t.date "work_date"
    t.bigint "place_id", null: false
    t.string "visualisation_location"
    t.string "shelfmark"
    t.bigint "work_source_library_id", null: false
    t.string "marc_id"
    t.string "bardic_id"
    t.string "work_link"
    t.string "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id_id"], name: "index_works_on_author_id_id"
    t.index ["authorship_id"], name: "index_works_on_authorship_id"
    t.index ["patron_id_id"], name: "index_works_on_patron_id_id"
    t.index ["place_id"], name: "index_works_on_place_id"
    t.index ["work_classification_id"], name: "index_works_on_work_classification_id"
    t.index ["work_form_id"], name: "index_works_on_work_form_id"
    t.index ["work_source_library_id"], name: "index_works_on_work_source_library_id"
  end

  add_foreign_key "attribs", "roles"
  add_foreign_key "events", "event_types"
  add_foreign_key "events", "places"
  add_foreign_key "people", "religious_orders"
  add_foreign_key "people", "religious_subtypes"
  add_foreign_key "places", "place_types"
  add_foreign_key "relationship_types", "relationship_categories"
  add_foreign_key "religious_subtypes", "religious_designations"
  add_foreign_key "sites", "places"
  add_foreign_key "sites", "site_types"
  add_foreign_key "works", "authorships"
  add_foreign_key "works", "places"
  add_foreign_key "works", "work_classifications"
  add_foreign_key "works", "work_forms"
  add_foreign_key "works", "work_source_libraries"
end
