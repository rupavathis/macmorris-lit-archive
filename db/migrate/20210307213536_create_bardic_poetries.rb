class CreateBardicPoetries < ActiveRecord::Migration[6.1]
  def change
    create_table :bardic_poetries do |t|
      t.string :bardic_id
      t.string :url

      t.timestamps
    end
  end
end
