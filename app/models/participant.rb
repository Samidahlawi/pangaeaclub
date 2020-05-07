class Participant < ApplicationRecord
  belongs_to :booking
  #validation
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :gender, presence: true
end
