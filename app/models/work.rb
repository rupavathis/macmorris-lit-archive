class Work < ApplicationRecord
  validates_uniqueness_of :work_id
  validates :work_id, format: { with: /w/, message: "ID must start with w" }
  belongs_to :author_id, :class_name => 'Person'
  belongs_to :authorship, optional: true
  belongs_to :work_form, optional: true
  belongs_to :language, optional: true
  belongs_to :place, optional: true
  belongs_to :bardic_poetry, optional: true
  belongs_to :work_source_library, optional: true
  has_and_belongs_to_many :patron_id, :class_name => 'Person'
  has_and_belongs_to_many :printer_id, :class_name => 'Person'
end
