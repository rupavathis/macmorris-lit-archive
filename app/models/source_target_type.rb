class SourceTargetType < ApplicationRecord
    has_many :source_type_connection, :class_name => 'Connection', :foreign_key => 'source_type_id'
    has_many :target_type_connection, :class_name => 'Connection', :foreign_key => 'target_type_id'
end
