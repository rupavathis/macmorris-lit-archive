class CreateJoinTablePeopleReligiousDesignations < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :religious_designations do |t|
      # t.index [:person_id, :religious_designation_id]
      # t.index [:religious_designation_id, :person_id]
    end
  end
end
