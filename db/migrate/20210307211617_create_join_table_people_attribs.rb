class CreateJoinTablePeopleAttribs < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :attribs do |t|
      # t.index [:person_id, :attrib_id]
      # t.index [:attrib_id, :person_id]
    end
  end
end
