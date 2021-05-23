class CreateJoinTableConnectionRelationshipTypes < ActiveRecord::Migration[6.1]
  def change
    create_join_table :connections, :relationship_types do |t|
      # t.index [:connection_id, :relationship_type_id]
      # t.index [:relationship_type_id, :connection_id]
    end
  end
end
