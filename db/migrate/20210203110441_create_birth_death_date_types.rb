class CreateBirthDeathDateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :birth_death_date_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
