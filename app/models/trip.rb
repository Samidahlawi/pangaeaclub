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
  validates :description, presence: true
  validates :trip_type, presence: true
  validates :region_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :country, presence: true
  validates :destination, presence: true
  validates :deadline, presence: true
  validates :level, presence: true
  validates :bg_image, presence: true
  validates :group_size_start, presence: true
  validates :group_size_end, presence: true
  validates :duration, presence: true
  # validates :image, presence: true
  validates :guide_id, presence: true
  validates :price, presence: true


end
