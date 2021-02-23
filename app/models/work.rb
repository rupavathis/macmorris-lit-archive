class Work < ApplicationRecord
  validates_uniqueness_of :work_id
  validates :work_id, format: { with: /w/, message: "ID must start with w" }
  belongs_to :author_id, :class_name => 'Person'
  belongs_to :patron_id, :class_name => 'Person'
  belongs_to :authorship
  belongs_to :work_form
  belongs_to :work_classification
  belongs_to :place
  belongs_to :work_source_library
end
