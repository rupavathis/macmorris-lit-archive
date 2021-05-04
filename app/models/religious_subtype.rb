class ReligiousSubtype < ApplicationRecord
  belongs_to :religious_designation
  has_and_belongs_to_many :people
end
