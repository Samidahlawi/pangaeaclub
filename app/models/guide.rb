class Guide < ApplicationRecord
    has_many :trips

    #validation
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :country, presence: true
    validates :visit, presence: true
    validates :langauge, presence: true
    validates :hobby, presence: true
    validates :description, presence: true
    validates :profile_image, presence: true
    validates :background_image, presence: true
    validates :images, presence: true

end
