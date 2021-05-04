class CreateJoinTableWorkWorkClassification < ActiveRecord::Migration[6.1]
  def change
    create_join_table :works, :work_classifications do |t|
      # t.index [:work_id, :work_classification_id]
      # t.index [:work_classification_id, :work_id]
    end
  end
end
