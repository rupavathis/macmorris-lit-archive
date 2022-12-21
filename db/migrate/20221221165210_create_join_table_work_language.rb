class CreateJoinTableWorkLanguage < ActiveRecord::Migration[6.1]
  def change
    create_join_table :works, :languages do |t|
      # t.index [:work_id, :language_id]
      # t.index [:language_id, :work_id]
    end
  end
end
