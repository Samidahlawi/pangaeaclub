class ItemIncludedsController < ApplicationController
  before_action :set_item_included, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_admin!, only: [:new,:edit,:update,:destroy,:create]
  def ensure_user_admin!
    unless current_user and current_user.admin == true
      flash[:error] = "(: لا يُمكنك الوصول إلى هذه الصّفحة"
      redirect_to root_path
    end
  end
  # GET /item_includeds
  # GET /item_includeds.json
  def index
    @item_includeds = ItemIncluded.all
  end

  # GET /item_includeds/1
  # GET /item_includeds/1.json
  def show
  end

  # GET /item_includeds/new
  def new
    @item_included = ItemIncluded.new
  end

  # GET /item_includeds/1/edit
  def edit
  end

  # POST /item_includeds
  # POST /item_includeds.json
  def create
    @item_included = ItemIncluded.new(item_included_params)

    respond_to do |format|
      if @item_included.save
        format.html { redirect_to @item_included, notice: 'Item included was successfully created.' }
        format.json { render :show, status: :created, location: @item_included }
      else
        format.html { render :new }
        format.json { render json: @item_included.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_includeds/1
  # PATCH/PUT /item_includeds/1.json
  def update
    respond_to do |format|
      if @item_included.update(item_included_params)
        format.html { redirect_to @item_included, notice: 'Item included was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_included }
      else
        format.html { render :edit }
        format.json { render json: @item_included.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_includeds/1
  # DELETE /item_includeds/1.json
  def destroy
    @item_included.destroy
    respond_to do |format|
      format.html { redirect_to item_includeds_url, notice: 'Item included was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_included
      @item_included = ItemIncluded.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_included_params
      params.require(:item_included).permit(:title, :description)
    end
end
