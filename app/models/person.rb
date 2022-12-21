class Person < ApplicationRecord
  belongs_to :place_of_birth, :class_name => 'Place', optional: true
  belongs_to :place_of_flourishing, :class_name => 'Place', optional: true
  belongs_to :place_of_death, :class_name => 'Place', optional: true
  validates :macmorris_id, format: { with: /m/, message: "ID must start with M" }
  belongs_to :birth_date_type, :class_name => 'BirthDeathDateType'
  belongs_to :death_date_type, :class_name => 'BirthDeathDateType'
  belongs_to :flourishing_date_type, :class_name => 'BirthDeathDateType'
  belongs_to :religious_order, optional: true
  belongs_to :gender, optional: true
  has_many :person_author, :class_name => 'Work', :foreign_key => 'author_id'
  has_many :person_source, :class_name => 'Connection', :foreign_key => 'source_id'
  has_many :person_target, :class_name => 'Connection', :foreign_key => 'target_id'
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :attribs
  has_and_belongs_to_many :religious_subtypes
  has_and_belongs_to_many :religious_designations
  has_and_belongs_to_many :person_patron, :class_name => 'Work'
  has_and_belongs_to_many :person_printer, :class_name => 'Work'
  has_and_belongs_to_many :person_publisher, :class_name => 'Work'
  has_and_belongs_to_many :person_bookseller, :class_name => 'Work'
  has_and_belongs_to_many :sites
  attribute :name
  
  # validate :dates_validation
  validate :isCultural_bool

  def dates_validation
    if(!(self.date_of_birth.nil? and self.date_of_death.nil? and self.flourishing_date.nil?))
      if self.date_of_birth > self.date_of_death
        errors.add(:date_of_death, "can't be before date of birth")
      end

      if self.flourishing_date > self.date_of_death
        errors.add(:flourishing_date, "should be before the death")
      end

      if self.date_of_birth > self.flourishing_date
        errors.add(:flourishing_date, "can't be before the birth")
      end
    end
  end

  def isCultural_bool
    if is_cultural_actor.nil?
      is_cultural_actor = false
    end
  end

  def name
    self.display_name
  end

end
