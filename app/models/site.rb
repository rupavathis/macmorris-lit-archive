class Site < ApplicationRecord
  belongs_to :site_type
  belongs_to :place
end
