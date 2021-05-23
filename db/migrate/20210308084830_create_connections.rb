class CreateConnections < ActiveRecord::Migration[6.1]
  def change
    create_table :connections do |t|
      t.references :source_type    
      t.references :target_type
      t.references :source_id
      t.references :target_id
      t.references :relationship_category
      t.references :start_date_type
      t.date :start_date
      t.references :end_date_type
      t.date :end_date
      t.references :time_period
      t.references :place
      t.string :reference
      t.boolean :connection_verified
      t.string :poem_id

      t.timestamps
    end
  end
end
