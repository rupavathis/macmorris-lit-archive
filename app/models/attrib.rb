class Attrib < ApplicationRecord
  belongs_to :role
  has_and_belongs_to_many :people
end
