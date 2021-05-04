class Event < ApplicationRecord
  validates_uniqueness_of :event_id
  validates :event_id, format: { with: /e/, message: "ID must start with e" }
  belongs_to :event_type
  belongs_to :start_date_type, :class_name => 'BirthDeathDateType', optional: true
  belongs_to :end_date_type, :class_name => 'BirthDeathDateType', optional: true
  belongs_to :place, optional: true

  validate :dates_validation
  def dates_validation
    if !self.start_date.nil? && !self.end_date.nil?
      if self.start_date > self.end_date
        errors.add(:end_date, "can't be before the start date")
      end
    end
  end
end
