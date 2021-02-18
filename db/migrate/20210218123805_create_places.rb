class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :name_in_EN
      t.string :name_in_GA
      t.references :place_type, null: false, foreign_key: true
      t.boolean :is_available
      t.string :geo_code
      t.boolean :is_accurate

      t.timestamps
    end
  end
end
