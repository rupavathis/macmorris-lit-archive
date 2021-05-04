class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :location
      t.string :name
      t.string :gaelic_name
      t.references :place_type, null: false, foreign_key: true
      t.boolean :is_available
      t.float :latitude
      t.float :longitude
      t.boolean :is_accurate
      t.string :wikidata

      t.timestamps
    end
  end
end
