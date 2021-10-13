class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :macmorris_id
      t.boolean :is_cultural_actor
      t.string :first_name
      t.string :last_name
      t.string :maiden_name
      t.string :husbands_name
      t.string :aristocratic_title
      t.string :pseudonym
      t.string :initials
      t.string :religious_title
      t.string :name_in_religion
      t.string :other_names
      t.string :display_name, null: false
      t.references :gender, null: true
      t.references :birth_date_type, null: true
      t.string :date_of_birth
      t.references :place_of_birth
      t.references :death_date_type, null: true
      t.string :date_of_death
      t.references :place_of_death
      t.references :flourishing_date_type, null: true
      t.string :flourishing_date
      t.references :place_of_flourishing
      t.string :active_in_ireland_start
      t.string :active_in_ireland_end
      t.references :religious_order
      t.string :self_described_identity
      t.string :nationality
      t.string :quotes
      t.string :notes
      t.string :reference_text
      t.string :odnb_id
      t.string :dib_id
      t.string :tnop_id
      t.string :wikidata_id
      t.string :ainm_id
      t.string :sdfb

      t.timestamps
    end
  end
end
