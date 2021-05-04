class CreateWorkDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :work_details do |t|
      t.string :work_id
      t.references :author_id
      t.references :authorship     
      t.references :work_form
      t.string :title
      t.string :display_title
      t.date :work_date
      t.references :place
      t.string :visualisation_location
      t.string :shelfmark
      t.references :work_source_library
      t.string :marc_id
      t.references :bardic_poetry
      t.string :desc

      t.timestamps
    end
  end
end
