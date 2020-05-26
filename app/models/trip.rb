class Trip < ApplicationRecord
  belongs_to :guide
  belongs_to :region

  # many_to_many 
  has_and_belongs_to_many :item_includeds
  has_and_belongs_to_many :item_not_includeds

  has_many :itineraries, dependent: :destroy
  has_many :bookings

  #validations
  validates :title, presence: true
  validates :sub_title, presence: true
  validates :trip_type, presence: true
  validates :country, presence: true
  validates :destination, presence: true
  validates :deadline, presence: true
  validates :level, presence: true
  validates :assets, presence: true
  validates :group_size_start, presence: true
  validates :group_size_end, presence: true
  validates :duration, presence: true
  validates :asset, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :description, presence: true
  validates :price, presence: true
  # validates :guide_id, presence: true  #remove comment
  # validates :region_id, presence: true #remove comment


  ###

   # background_image of trip
   has_one_attached :asset 
   attr_accessor :remove_asset
   after_save { asset.purge if remove_asset == '1' }


   ## images of trip
   has_many_attached :assets
   attr_accessor :remove_assets
   after_save do
     Array(remove_assets).each { |id| assets.find_by_id(id).try(:purge) }
   end

end
