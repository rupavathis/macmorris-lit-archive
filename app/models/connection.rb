class Connection < ApplicationRecord
  belongs_to :source_type, :class_name => 'SourceTargetType'
  belongs_to :target_type, :class_name => 'SourceTargetType'
  belongs_to :start_date_type, :class_name => 'BirthDeathDateType'
  belongs_to :end_date_type, :class_name => 'BirthDeathDateType'
  belongs_to :source_id, :class_name => 'Person'
  belongs_to :target_id, :class_name => 'Person'
  belongs_to :time_period
  belongs_to :place
  belongs_to :relationship_category
  has_and_belongs_to_many :relationship_types
  belongs_to :bardic_poetry
end
