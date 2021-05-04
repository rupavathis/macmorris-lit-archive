class CreateTimePeriods < ActiveRecord::Migration[6.1]
  def change
    create_table :time_periods do |t|
      t.string :name

      t.timestamps
    end
  end
end
