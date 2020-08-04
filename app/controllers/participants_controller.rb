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
    # Get the user_id
    @user_id = current_user.id 
    # Get the trip_id 
    @trip_id = params[:trip]
    # Get the total ** NEEED TO UPDATE 
    @price = Trip.find_by(id:@trip_id)[:price]
    @booking = Booking.new
    @participant = Participant.new
  end

  # GET /participants/1/edit
  def edit
  end

  # POST /participants
  # POST /participants.json
  def create
    # Create a  booking includs user_id, trip_id, total
    @booking = Booking.create({user_id:@user_id,trip_id:@trip_id,total:@price})
    # Create a new participant includs user_id, trip_id, total
    @participant = Participant.new(participant_params)
    @participant[:booking_id] = @booking.id
    
    respond_to do |format|
      if @participant.save
        format.html { redirect_to @participant, notice: 'Participant was successfully created.' }
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
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
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
      params.require(:participant).permit(:first_name, :last_name, :email, :gender)
    end
end
