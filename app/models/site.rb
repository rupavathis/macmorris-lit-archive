class Site < ApplicationRecord
  validates_uniqueness_of :site_id
  validates :site_id, format: { with: /s/, message: "ID must start with s" }
  belongs_to :site_type, optional: true
  belongs_to :place, optional: true
  has_many :event_target, :class_name => 'PeopleSite', :foreign_key => 'target_id'
  # def site_id
  #   errors.add(:site_id, 'Site ID must start with s') unless site_id =~ %r{\Aw}
  # end
end
