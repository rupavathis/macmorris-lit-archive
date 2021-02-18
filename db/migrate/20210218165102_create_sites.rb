class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.string :site_id
      t.references :site_type, null: false, foreign_key: true
      t.string :name_in_EN
      t.string :name_in_GA
      t.references :place, null: false, foreign_key: true
      t.string :desc

      t.timestamps
    end
  end
end
