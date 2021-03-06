class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all.order("start_date DESC").paginate(page: params[:page], per_page: 6)
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip_id = params[:id].to_i
    # GET the trip by @trip_id
    @trip = Trip.find_by(id:@trip_id)
    # # Get the total ** NEEED TO UPDATE 
    # @price = Trip.find_by(id:@trip_id)[:price]
    @booking = Booking.new
    @participant = Participant.new
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:title, :sub_title, :trip_type, :country, :destination, :deadline, :level, :bg_image, :group_size_start, :group_size_end, :duration, :image, :start_date, :end_date, :description, :price, :guide_id, :region_id)
    end
end
