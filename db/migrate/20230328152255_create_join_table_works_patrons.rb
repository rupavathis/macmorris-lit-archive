class CreateJoinTableWorksPatrons < ActiveRecord::Migration[6.1]
  def change
    create_join_table :works, :people, table_name: :works_patrons do |t|
      t.index [:work_id, :person_id]
      t.index [:person_id, :work_id]
    end
  end
end
