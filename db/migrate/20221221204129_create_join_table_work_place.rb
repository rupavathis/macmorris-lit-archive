class CreateJoinTableWorkPlace < ActiveRecord::Migration[6.1]
  def change
    create_join_table :works, :places do |t|
      # t.index [:work_id, :place_id]
      # t.index [:place_id, :work_id]
    end
  end
end
