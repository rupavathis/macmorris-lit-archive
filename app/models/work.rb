class Work < ApplicationRecord
  belongs_to :author_id, :class_name => 'Person'
  belongs_to :patron_id, :class_name => 'Person'
  belongs_to :authorship
  belongs_to :work_form
  belongs_to :work_classification
  belongs_to :place
  belongs_to :work_source_library
end
