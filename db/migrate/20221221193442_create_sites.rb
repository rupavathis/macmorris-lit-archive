  class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.string :site_id
      t.references :site_type, foreign_key: true
      t.string :name
      t.string :gaelic_name
      t.references :place, foreign_key: true
      t.text :description
      t.text :gaelic_description
      t.string :reference_text
      t.references :bardic_poetry, foreign_key: true

      t.timestamps
    end
  end
end
