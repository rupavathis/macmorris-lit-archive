class CreateJoinTablePersonSite < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :sites do |t|
      # t.index [:person_id, :site_id]
      # t.index [:site_id, :person_id]
    end
  end
end
