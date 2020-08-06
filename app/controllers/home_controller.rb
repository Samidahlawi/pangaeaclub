class HomeController < ApplicationController
  def index
    @trips = Trip.all
    # title*
    # country*
    # asset* => image of cards in trip and background of single trip
    # start_date*
    # Status 
    # Price*
    # group_size_start
    # group_size_end
    # Duration*
    # ---
    # *trip.guide.first_name + trip.guide.last_name
    # *trip.asset => profile_photo 
    #######
    @guides = Guide.all
    #Country
    #guide.asset => profile_photo
  end

  #  /about
  def show 

  end

end

