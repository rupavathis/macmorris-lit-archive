class CreateJoinTableWorksPrinters < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :works, table_name: :works_printers do |t|
      t.index [:person_id, :work_id]
      t.index [:work_id, :person_id]
    end
  end
end
