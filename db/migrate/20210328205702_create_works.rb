class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :work_id
      t.references :author_id
      t.references :authorship
      t.references :work_form
      t.text :title
      t.string :display_title
      t.references :language
      t.date :work_date
      t.references :place
      t.string :visualisation_location
      t.string :shelfmark
      t.references :work_source_library
      t.string :marc_id
      t.references :bardic_poetry
      t.string :link_uri
      t.string :description
      t.boolean :is_written_during_years_active

      t.timestamps
    end
  end
end
