class RelationshipType < ApplicationRecord
  belongs_to :relationship_category
  has_and_belongs_to_many :connections
end
