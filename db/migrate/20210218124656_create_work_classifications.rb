class CreateWorkClassifications < ActiveRecord::Migration[6.1]
  def change
    create_table :work_classifications do |t|
      t.string :name

      t.timestamps
    end
  end
end
