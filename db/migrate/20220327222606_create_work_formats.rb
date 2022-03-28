class CreateWorkFormats < ActiveRecord::Migration[6.1]
  def change
    create_table :work_formats do |t|
      t.string :name

      t.timestamps
    end
  end
end
