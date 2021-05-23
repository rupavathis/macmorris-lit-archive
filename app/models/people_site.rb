class PeopleSite < ApplicationRecord
  belongs_to :source_type, :class_name => 'SourceTargetType'
  belongs_to :target_type, :class_name => 'SourceTargetType'
  belongs_to :start_date_type, :class_name => 'BirthDeathDateType'
  belongs_to :end_date_type, :class_name => 'BirthDeathDateType'
  belongs_to :source_id, :class_name => 'Person'
  belongs_to :target_id, :class_name => 'Site'
  belongs_to :event
  has_and_belongs_to_many :relationship_type
  belongs_to :time_period
  belongs_to :place
end
