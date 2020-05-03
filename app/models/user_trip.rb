class UserTrip < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  has_many :participants, dependent: :destroy
end
