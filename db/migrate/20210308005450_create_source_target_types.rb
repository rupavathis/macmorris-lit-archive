class CreateSourceTargetTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :source_target_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
