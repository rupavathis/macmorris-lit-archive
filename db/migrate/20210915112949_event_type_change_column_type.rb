class EventTypeChangeColumnType < ActiveRecord::Migration[6.1]
  # def up
  #   change_column :event_types, :created_at, :datetime
  #   change_column :event_types, :updated_at, :datetime
  # end

  # def down
  #   change_column :event_types, :created_at, :string
  #   change_column :event_types, :updated_at, :string
  # end
  def change
    change_column(:event_types, :created_at, :string)
    change_column(:event_types, :updated_at, :string)
  end
end
