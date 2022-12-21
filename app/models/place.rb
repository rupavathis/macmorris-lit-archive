class Place < ApplicationRecord
  belongs_to :place_type
  has_many :place_of_birth_People, :class_name => 'Person', :foreign_key => 'place_of_birth_id'
  has_many :place_of_flourishing_People, :class_name => 'Person', :foreign_key => 'place_of_flourishing_id'
  has_many :place_of_death_People, :class_name => 'Person', :foreign_key => 'place_of_death_id'
  has_and_belongs_to_many :works
end
