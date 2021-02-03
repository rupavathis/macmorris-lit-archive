class CreateReligiousOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :religious_orders do |t|
      t.string :name

      t.timestamps
    end
  end
end
