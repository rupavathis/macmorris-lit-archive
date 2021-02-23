class Place < ApplicationRecord
  belongs_to :place_type
  def name
    self.name_in_EN
  end
end
