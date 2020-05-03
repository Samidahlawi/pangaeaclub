class Trip < ApplicationRecord
  belongs_to :guide
  belongs_to :region
  has_many :item_includeds, dependent: :destroy
  has_many :item_not_includeds, dependent: :destroy
end
