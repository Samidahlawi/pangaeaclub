class Trip < ApplicationRecord
  belongs_to :guide
  belongs_to :region

  # many_to_many 
  has_and_belongs_to_many :item_includeds
  has_and_belongs_to_many :item_not_includeds

end
