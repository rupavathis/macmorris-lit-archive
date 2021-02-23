class EventTest < ApplicationRecord
  belongs_to :event_type
  belongs_to :birth_death_date_type
  belongs_to :place
end
