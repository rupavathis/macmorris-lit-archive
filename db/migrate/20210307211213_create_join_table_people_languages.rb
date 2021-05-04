class CreateJoinTablePeopleLanguages < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :languages do |t|
      # t.index [:person_id, :language_id]
      # t.index [:language_id, :person_id]
    end
  end
end
