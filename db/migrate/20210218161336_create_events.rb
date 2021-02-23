class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event_id
      t.references :event_type, foreign_key: true
      #  null: false, 
      t.string :name_in_EN
      t.string :name_in_GA
      t.references :start_date_type
      t.date :start_date
      t.references :end_date_type
      t.date :end_date
      t.references :place, foreign_key: true
      # null: false, 
      t.string :notes
      t.timestamps
    end
  end
end
