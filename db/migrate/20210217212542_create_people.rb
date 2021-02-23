class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :macmorris_id
      t.boolean :is_cultural_actor
      t.string :first_name
      t.string :last_name
      t.string :maidan_name
      t.string :husbands_name
      t.string :aristocratic_title
      t.string :pseudonym
      t.string :initials
      t.string :religious_title
      t.string :name_in_religion
      t.string :other_names
      t.string :display_name
      t.string :gender
      t.references :birth_date_type
      t.date :date_of_birth
      t.references :death_date_type
      t.date :date_of_death
      t.references :flourishing_date_type
      t.date :flourishing_date
      t.date :active_in_ireland_start
      t.date :active_in_ireland_end
      t.references :religious_subtype, null: false, foreign_key: true
      t.references :religious_order, null: false, foreign_key: true
      # t.references :attrib, null: false, foreign_key: true
      t.string :self_described_identity
      t.string :quotes
      t.string :notes
      t.string :reference_text
      t.string :odnb_id
      t.string :dib_id
      t.string :tnop_id
      t.string :wikidata_id
      t.string :ainm_id
      t.string :patron_id
      t.string :bardic_id
      t.string :sdfb

      t.timestamps
    end
  end
end
