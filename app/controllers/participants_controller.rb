class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  # GET /participants
  # GET /participants.json
  def index
    @participants = Participant.all
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
  end

  # GET /participants/new
  def new

    @trip_id = params[:trip_id].to_i
    # GET the trip by @trip_id
    @trip = Trip.find_by(id:@trip_id)
    # # Get the total ** NEEED TO UPDATE 
    # @price = Trip.find_by(id:@trip_id)[:price]
    @booking = Booking.new
    @participant = Participant.new
  end

  # GET /participants/1/edit
  def edit
    @trip_id = params[:trip_id].to_i
    # GET the trip by @trip_id
    @trip = Trip.find_by(id:@trip_id)
    @participant = Participant.find_by(id:params[:id])
  end

  # POST /participants
  # POST /participants.json
  def create
    
    # # Get the user_id
    user_id = current_user.id
    # # Get the trip_id 
    trip_id = request[:trip_id].to_i
    # #  Find the trip by id
    trip = Trip.find_by(id:trip_id)
    # cal the total of booking
    total = trip.price * params[:participant_number].to_i
    # # Create a  booking includs user_id, trip_id, total
    @booking = Booking.create({user_id:user_id,trip_id:trip_id,total:total})

  
    # // the number of form send it
    length = participant_params["first_name"].length
    # //make them in separate object
    length.times  do |index|
      participant = {}
      participant_params.each do |key,value|
        participant[key] = value[index]
      end
      @participant = Participant.new(participant)
      @participant[:booking_id] = @booking.id
      @participant.save
    end
    
    respond_to do |format|
      if @participant.save
        format.html { redirect_to booking_path(@booking.id), notice: "تـم الحـجـز بنـجاح, شكراُ لـثـقتكـم" }
        format.json { render :show, status: :created, location: @participant }
      else
        format.html { render :new }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participants/1
  # PATCH/PUT /participants/1.json
  def update
     # // the number of form send it
     
     # //make them in separate object
     
       participant = {}
       participant_params.each do |key,value|
         participant[key] = value[0]
       end

   

    respond_to do |format|
      if @participant.update(participant)
        format.html { redirect_to booking_path(@participant.booking_id), notice: 'تم تحديث بيانات العضو بنجاح' }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to participants_url, notice: 'Participant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def participant_params
      params.require(:participant).permit(:first_name => [] , :last_name => [], :email => [], :gender => [])
    end
end
