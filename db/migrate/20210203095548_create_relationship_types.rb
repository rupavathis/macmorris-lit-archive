class CreateRelationshipTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :relationship_types do |t|
      t.string :name
      t.references :relationship_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
