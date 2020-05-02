class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_admin!, only: [:new,:edit,:update,:destroy,:create]
  def ensure_user_admin!
    unless current_user and current_user.admin == true
      flash[:error] = "(: لا يُمكنك الوصول إلى هذه الصّفحة"
      redirect_to root_path
    end
  end
  # GET /itineraries
  # GET /itineraries.json
  def index
    @itineraries = Itinerary.all
  end

  # GET /itineraries/1
  # GET /itineraries/1.json
  def show
  end

  # GET /itineraries/new
  def new
    @itinerary = Itinerary.new
  end

  # GET /itineraries/1/edit
  def edit
  end

  # POST /itineraries
  # POST /itineraries.json
  def create
    @itinerary = Itinerary.new(itinerary_params)

    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to @itinerary, notice: 'Itinerary was successfully created.' }
        format.json { render :show, status: :created, location: @itinerary }
      else
        format.html { render :new }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itineraries/1
  # PATCH/PUT /itineraries/1.json
  def update
    respond_to do |format|
      if @itinerary.update(itinerary_params)
        format.html { redirect_to @itinerary, notice: 'Itinerary was successfully updated.' }
        format.json { render :show, status: :ok, location: @itinerary }
      else
        format.html { render :edit }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itineraries/1
  # DELETE /itineraries/1.json
  def destroy
    @itinerary.destroy
    respond_to do |format|
      format.html { redirect_to itineraries_url, notice: 'Itinerary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary
      @itinerary = Itinerary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def itinerary_params
      params.require(:itinerary).permit(:title, :name, :description, :image)
    end
end
