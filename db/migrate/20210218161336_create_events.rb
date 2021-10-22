class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event_id
      t.references :event_type, foreign_key: true
      #  null: false, 
      t.string :name
      t.string :gaelic_name
      t.references :start_date_type
      t.string :start_date
      t.references :end_date_type
      t.string :end_date
      t.references :place, foreign_key: true, null: true 
      t.string :description
      t.timestamps
    end
  end
end
