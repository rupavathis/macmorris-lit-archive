class Language < ApplicationRecord
    has_and_belongs_to_many :people
    has_and_belongs_to_many :works
end
