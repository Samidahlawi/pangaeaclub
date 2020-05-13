class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  #many_to_many
  has_many :participants, dependent: :destroy
#validation
validates :total, presence: true
# validates :user_id, presence: true  #remove comment
# validates :trip_id, presence: true  #remove comment
end
