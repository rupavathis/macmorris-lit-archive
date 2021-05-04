class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.string :site_id
      t.references :site_type, foreign_key: true
      # , null: false,
      t.string :name
      t.string :gaelic_name
      t.references :place, foreign_key: true
      # null: false,
      t.string :description

      t.timestamps
    end
  end
end
