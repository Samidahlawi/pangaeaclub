class ItemIncluded < ApplicationRecord
    has_and_belongs_to_many :trips
    #validation

    validates :title, presence: true
    validates :description, presence: true
end
