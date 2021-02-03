class CreateRelationshipCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :relationship_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
