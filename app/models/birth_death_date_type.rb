class BirthDeathDateType < ApplicationRecord
    has_many :birth_date_type_People, :class_name => 'Person', :foreign_key => 'birth_date_type_id'
    has_many :death_date_type_People, :class_name => 'Person', :foreign_key => 'death_date_type_id'
    has_many :flourishing_date_type_People, :class_name => 'Person', :foreign_key => 'flourishing_date_type_id'
    has_many :start_date_type_Event, :class_name => 'Event', :foreign_key => 'start_date_type_id'
    has_many :end_date_type_Event, :class_name => 'Event', :foreign_key => 'end_date_type_id'
    has_many :start_date_type_connection, :class_name => 'Connection', :foreign_key => 'start_date_type_id'
    has_many :end_date_type_connection, :class_name => 'Connection', :foreign_key => 'end_date_type_id'
end
