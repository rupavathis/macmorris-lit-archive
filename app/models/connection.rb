class Connection < ApplicationRecord
  belongs_to :source_type, :class_name => 'SourceTargetType'
  belongs_to :target_type, :class_name => 'SourceTargetType'
  belongs_to :start_date_type, :class_name => 'BirthDeathDateType'
  belongs_to :end_date_type, :class_name => 'BirthDeathDateType'
  belongs_to :time_period
  belongs_to :place
end
