class GuidesController < ApplicationController
  # before_action :authenticate_user!, only: [:edit,:update,:destroy,:create]
  before_action :ensure_user_admin!, only: [:new,:edit,:update,:destroy,:create]
  def ensure_user_admin!
    unless current_user and current_user.admin == true
      flash[:error] = "(: لا يُمكنك الوصول إلى هذه الصّفحة"
      redirect_to root_path
    end
  end
  before_action :set_guide, only: [:show, :edit, :update, :destroy]

  # GET /guides
  # GET /guides.json
  def index
    @guides = Guide.all.order("updated_at DESC").paginate(page: params[:page], per_page: 8)
  end

  # GET /guides/1
  # GET /guides/1.json
  def show
  end

  # GET /guides/new
  def new
    @guide = Guide.new
  end

  # GET /guides/1/edit
  def edit
  end

  # POST /guides
  # POST /guides.json
  def create
    
    
    @@guide = Guide.new(guide_params)
    file = params[:guide][:profile_image]
    req = Cloudinary::Uploader.upload(file)
    @guide.profile_image = req["url"]
    respond_to do |format|
      if @guide.save
        format.html { redirect_to @guide, notice: 'Guide was successfully created.' }
        format.json { render :show, status: :created, location: @guide }
      else
        format.html { render :new }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guides/1
  # PATCH/PUT /guides/1.json
  def update
    
    file = params[:guide][:profile_image]
    req = Cloudinary::Uploader.upload(file)
    @guide = Guide.find(params[:id])
    respond_to do |format|
      if @guide.update(guide_params)
        @guide.update(profile_image:req["url"])
        format.html { redirect_to @guide, notice: 'Guide was successfully updated.' }
        format.json { render :show, status: :ok, location: @guide }
      else
        format.html { render :edit }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guides/1
  # DELETE /guides/1.json
  def destroy
    @guide.destroy
    respond_to do |format|
      format.html { redirect_to guides_url, notice: 'Guide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guide
      @guide = Guide.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guide_params
      params.require(:guide).permit(:first_name, :last_name, :country, :hobby, :instagram, :description, :profile_image, :position)
    end
end
