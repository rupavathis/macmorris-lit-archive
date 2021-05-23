class CreateEventsPeople < ActiveRecord::Migration[6.1]
  def change
    create_table :events_people do |t|
      t.references :source_type
      t.references :target_type
      t.references :source_id
      t.references :target_id
      # t.references :person, foreign_key: true
      # t.references :event, foreign_key: true
      # t.references :relationship_type, foreign_key: true
      t.references :start_date_type
      t.date :start_date
      t.references :end_date_type
      t.date :end_date
      # t.references :birth_death_date_type, foreign_key: true
      t.references :time_period, foreign_key: true
      t.references :place, foreign_key: true
      t.string :reference_text      

      t.timestamps
    end
  end
end
