class Itinerary < ApplicationRecord
  belongs_to :trip
  #validation
  validates :title, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :asset, presence: true


  # image of itinerary
  has_one_attached :asset 
  attr_accessor :remove_asset
  after_save { asset.purge if remove_asset == '1' }

end
