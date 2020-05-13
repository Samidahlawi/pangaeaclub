class Itinerary < ApplicationRecord
  belongs_to :trip
  #validation
  validates :title, presence: true
  validates :name, presence: true
  validates :description, presence: true
  #image is not require!!
end
