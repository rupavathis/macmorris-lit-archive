class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :work_id
      t.references :author_id
      t.references :authorship, null: false, foreign_key: true
      t.references :patron_id
      t.references :work_form, null: false, foreign_key: true
      t.string :title
      t.string :display_title, null: false
      t.references :work_classification, null: false, foreign_key: true
      t.date :work_date
      t.references :place, null: false, foreign_key: true
      t.string :visualisation_location
      t.string :shelfmark
      t.references :work_source_library, null: false, foreign_key: true
      t.string :marc_id
      t.string :bardic_id
      t.string :work_link
      t.string :desc

      t.timestamps
    end
  end
end
