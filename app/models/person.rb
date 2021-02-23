class Person < ApplicationRecord
  validates_uniqueness_of :macmorris_id
  validates :macmorris_id, format: { with: /m/, message: "ID must start with M" }
  belongs_to :birth_date_type, :class_name => 'BirthDeathDateType'
  belongs_to :death_date_type, :class_name => 'BirthDeathDateType'
  belongs_to :flourishing_date_type, :class_name => 'BirthDeathDateType'
  belongs_to :religious_subtype
  belongs_to :religious_order
  # belongs_to :attrib
  has_many :person_author, :class_name => 'Work', :foreign_key => 'author_id'
  has_many :person_patron, :class_name => 'Work', :foreign_key => 'patron_id'
  # def custom_label_method
  #   "Author #{macmorris_id}"
  # end

  has_and_belongs_to_many :languages

  validate :dates_validation

    def dates_validation
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

    def name
      self.macmorris_id
    end
end
