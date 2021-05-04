class CreateJoinTablePeopleWorkDetails < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :work_details do |t|
      # t.index [:person_id, :work_detail_id]
      # t.index [:work_detail_id, :person_id]
    end
  end
end
