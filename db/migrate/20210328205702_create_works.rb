class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :work_id
      t.references :author_id
      t.references :authorship
      t.references :work_form
      t.text :title
      t.string :display_title
      t.string :work_date
      t.string :visualisation_location
      t.string :shelfmark
      t.references :work_source_library
      t.references :work_format
      t.string :marc_id
      t.references :bardic_poetry
      t.string :link_uri
      t.string :description
      t.text :reference
      t.boolean :by_irish
      t.boolean :while_ireland
      t.boolean :about_ireland
      t.boolean :printed_in_ireland
      t.boolean :bf_af_ireland

      t.timestamps
    end
  end
end
