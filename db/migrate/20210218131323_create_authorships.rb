class CreateAuthorships < ActiveRecord::Migration[6.1]
  def change
    create_table :authorships do |t|
      t.string :name

      t.timestamps
    end
  end
end
