class Site < ApplicationRecord
  # validates_uniqueness_of :site_id
  # validates :site_id, format: { with: /D/, message: "ID must start with D" }
  belongs_to :site_type
  belongs_to :place
  belongs_to :bardic_poetry
  has_and_belongs_to_many :person_id, :class_name => 'Person'
  # def site_id
  #   errors.add(:site_id, 'Site ID must start with s') unless site_id =~ %r{\Aw}
  # end
end
