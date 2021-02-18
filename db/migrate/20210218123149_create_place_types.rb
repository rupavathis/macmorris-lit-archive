class CreatePlaceTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :place_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
