class Site < ApplicationRecord
  validates_uniqueness_of :site_id
  validates :site_id, format: { with: /D/, message: "ID must start with D" }
  belongs_to :site_type, optional: true
  belongs_to :place, optional: true
  # has_many :event_target, :class_name => 'PeopleSite', :foreign_key => 'target_id'
  belongs_to :bardic_poetry, optional: true
  has_many :site_people, :class_name => 'Person', :foreign_key =>'affiliated_people'
  # def site_id
  #   errors.add(:site_id, 'Site ID must start with s') unless site_id =~ %r{\Aw}
  # end
end
