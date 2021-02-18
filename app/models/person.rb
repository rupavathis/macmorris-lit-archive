class Person < ApplicationRecord
  belongs_to :birth_date_type, :class_name => 'BirthDeathDateType'
  belongs_to :death_date_type, :class_name => 'BirthDeathDateType'
  belongs_to :flourishing_date_type, :class_name => 'BirthDeathDateType'
  belongs_to :religious_subtype
  belongs_to :religious_order
  belongs_to :attrib
  has_many :person_author, :class_name => 'Work', :foreign_key => 'author_id'
  has_many :person_patron, :class_name => 'Work', :foreign_key => 'patron_id'
  # def custom_label_method
  #   "Author #{macmorris_id}"
  # end

  def name
    self.macmorris_id
  end
end
