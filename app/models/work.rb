class Work < ApplicationRecord
  # validates_uniqueness_of :work_id
  validates :work_id, format: { with: /w/, message: "ID must start with w" }
  belongs_to :author_id, :class_name => 'Person'
  belongs_to :authorship, optional: true
  belongs_to :work_form, optional: true
  belongs_to :work_format, optional: true
  belongs_to :bardic_poetry, optional: true
  belongs_to :work_source_library, optional: true
  has_and_belongs_to_many :patron_id, class_name: 'Person', join_table: :works_patrons
  # , join_table: :works_patrons
  has_and_belongs_to_many :printer_id, :class_name => 'Person', join_table: :works_printers
  has_and_belongs_to_many :publisher_id, :class_name => 'Person', join_table: :works_publishers
  has_and_belongs_to_many :bookseller_id, :class_name => 'Person', join_table: :works_booksellers
  has_and_belongs_to_many :work_classification, :class_name => 'WorkClassification'
  has_and_belongs_to_many :places, :class_name => 'Place'
  has_and_belongs_to_many :languages
end
