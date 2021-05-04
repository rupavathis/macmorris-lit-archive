class Place < ApplicationRecord
  belongs_to :place_type
  has_many :birth_place_People, :class_name => 'Person', :foreign_key => 'birth_place_id'
  has_many :flourishing_place_People, :class_name => 'Person', :foreign_key => 'flourishing_place_id'
  has_many :death_place_People, :class_name => 'Person', :foreign_key => 'death_place_id'
  
end
