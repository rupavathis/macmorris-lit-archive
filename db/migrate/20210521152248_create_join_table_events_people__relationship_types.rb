class CreateJoinTableEventsPeopleRelationshipTypes < ActiveRecord::Migration[6.1]
  def change
    create_join_table :events_people, :relationship_types do |t|
      # t.index [:events_person_id, :relationship_type_id]
      # t.index [:relationship_type_id, :events_person_id]
    end
  end
end
