class Guide < ApplicationRecord
    has_many :trips
    #upload_images by Active_Storage
    # has_one_attached :asset

    #validation
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :country, presence: true
    validates :hobby, presence: true
    validates :instagram, presence: true
    validates :description, presence: true
    validates :profile_image, presence: true



end
