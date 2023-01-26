class CreateJoinTablePersonAuthorshipType < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :authorship_types do |t|
      # t.index [:person_id, :authorship_type_id]
      # t.index [:authorship_type_id, :person_id]
    end
  end
end
