class Guide < ApplicationRecord
    has_many :trips

    #validation
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :country, presence: true
    validates :hobby, presence: true
    validates :instagram, presence: true
    validates :description, presence: true
    validates :profile_image, presence: true

end
