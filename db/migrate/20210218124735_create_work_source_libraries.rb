class CreateWorkSourceLibraries < ActiveRecord::Migration[6.1]
  def change
    create_table :work_source_libraries do |t|
      t.string :name

      t.timestamps
    end
  end
end
