class WorkDetail < ApplicationRecord
  validates_uniqueness_of :work_id
  validates :work_id, format: { with: /w/, message: "ID must start with w" }
  belongs_to :author_id, :class_name => 'Person'
  has_and_belongs_to_many :patron_id, :class_name => 'Person'
  has_and_belongs_to_many :printer_id, :class_name => 'Person'
  belongs_to :authorship
  belongs_to :work_form
  belongs_to :place
  belongs_to :work_source_library
  belongs_to :bardic_poetry
  has_and_belongs_to_many :work_classifications
end
