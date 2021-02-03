class CreateAttribs < ActiveRecord::Migration[6.1]
  def change
    create_table :attribs do |t|
      t.string :name
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
