class Guide < ApplicationRecord
    has_many :trips
    #upload_images by Active_Storage

    # profile_image of guide #image_profile
    has_one_attached :asset 
    attr_accessor :remove_asset
    after_save { asset.purge if remove_asset == '1' }


    ## images of guide
    has_many_attached :assets
    attr_accessor :remove_assets
    after_save do
      Array(remove_assets).each { |id| assets.find_by_id(id).try(:purge) }
    end

    # before_save do 
    #     debugger
    # end




    #validation
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :country, presence: true
    validates :hobby, presence: true
    validates :instagram, presence: true
    validates :description, presence: true
    # validates :profile_image, presence: true
    validates :asset, presence: true
    validates :assets, presence: true



end
