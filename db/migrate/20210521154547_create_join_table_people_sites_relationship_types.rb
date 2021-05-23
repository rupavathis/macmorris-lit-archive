class CreateJoinTablePeopleSitesRelationshipTypes < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people_sites, :relationship_types do |t|
      # t.index [:people_site_id, :relationship_type_id]
      # t.index [:relationship_type_id, :people_site_id]
    end
  end
end
