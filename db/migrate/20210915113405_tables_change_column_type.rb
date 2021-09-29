class TablesChangeColumnType < ActiveRecord::Migration[6.1]
  # def change
  #   change_column(:events_people, :start_date, :string)
  #   change_column(:events_people, :end_date, :string)
  #   change_column(:events, :start_date, :string)
  #   change_column(:events, :end_date, :string)
  #   change_column(:people, :date_of_birth, :string)
  #   change_column(:people, :date_of_death, :string)
  #   change_column(:people, :flourishing_date, :string)
  #   change_column(:people, :active_in_ireland_start, :string)
  #   change_column(:people, :active_in_ireland_end, :string)
  #   change_column(:people_sites, :start_date, :string)
  #   change_column(:people_sites, :end_date, :string)
  #   change_column(:connections, :start_date, :string)
  #   change_column(:connections, :end_date, :string) 
  #   change_column(:works, :work_date, :string)   


  def change
    reversible do |dir|
      change_table :works do |t|
        dir.up   { t.change :work_date, :string }
        dir.down { t.change :work_date, :date }
      end
      change_table :connections do |t|
        dir.up   { t.change :start_date, :string }
        dir.down { t.change :start_date, :date }
        dir.up   { t.change :end_date, :string }
        dir.down { t.change :end_date, :date }
      end
      change_table :people_sites do |t|
        dir.up   { t.change :start_date, :string }
        dir.down { t.change :start_date, :date }
        dir.up   { t.change :end_date, :string }
        dir.down { t.change :end_date, :date }
      end
      change_table :people do |t|
        dir.up   { t.change :date_of_birth, :string }
        dir.down { t.change :date_of_birth, :date }
        dir.up   { t.change :date_of_death, :string }
        dir.down { t.change :date_of_death, :date }
        dir.up   { t.change :flourishing_date, :string }
        dir.down { t.change :flourishing_date, :date }
        dir.up   { t.change :active_in_ireland_start, :string }
        dir.down { t.change :active_in_ireland_start, :date }
        dir.up   { t.change :active_in_ireland_end, :string }
        dir.down { t.change :active_in_ireland_end, :date }
      end
      change_table :events_people do |t|
        dir.up   { t.change :start_date, :string }
        dir.down { t.change :start_date, :date }
        dir.up   { t.change :end_date, :string }
        dir.down { t.change :end_date, :date }
      end
      change_table :events do |t|
        dir.up   { t.change :start_date, :string }
        dir.down { t.change :start_date, :date }
        dir.up   { t.change :end_date, :string }
        dir.down { t.change :end_date, :date }
      end
    end
  end
end
