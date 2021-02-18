class CreateSiteTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :site_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
