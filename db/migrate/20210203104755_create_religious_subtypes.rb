class CreateReligiousSubtypes < ActiveRecord::Migration[6.1]
  def change
    create_table :religious_subtypes do |t|
      t.string :name
      t.references :religious_designation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
