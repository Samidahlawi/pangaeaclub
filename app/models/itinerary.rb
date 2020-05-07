class Itinerary < ApplicationRecord
  belongs_to :trip
  #validation
  validates :title, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
