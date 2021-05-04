class CreateJoinTablePeopleReligiousSubType < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :religious_subtypes do |t|
      # t.index [:person_id, :religious_subtype_id]
      # t.index [:religious_subtype_id, :person_id]
    end
  end
end
