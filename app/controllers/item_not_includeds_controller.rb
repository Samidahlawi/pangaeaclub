class ItemNotIncludedsController < ApplicationController
  before_action :set_item_not_included, only: [:show, :edit, :update, :destroy]

  # GET /item_not_includeds
  # GET /item_not_includeds.json
  def index
    @item_not_includeds = ItemNotIncluded.all
  end

  # GET /item_not_includeds/1
  # GET /item_not_includeds/1.json
  def show
  end

  # GET /item_not_includeds/new
  def new
    @item_not_included = ItemNotIncluded.new
  end

  # GET /item_not_includeds/1/edit
  def edit
  end

  # POST /item_not_includeds
  # POST /item_not_includeds.json
  def create
    @item_not_included = ItemNotIncluded.new(item_not_included_params)

    respond_to do |format|
      if @item_not_included.save
        format.html { redirect_to @item_not_included, notice: 'Item not included was successfully created.' }
        format.json { render :show, status: :created, location: @item_not_included }
      else
        format.html { render :new }
        format.json { render json: @item_not_included.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_not_includeds/1
  # PATCH/PUT /item_not_includeds/1.json
  def update
    respond_to do |format|
      if @item_not_included.update(item_not_included_params)
        format.html { redirect_to @item_not_included, notice: 'Item not included was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_not_included }
      else
        format.html { render :edit }
        format.json { render json: @item_not_included.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_not_includeds/1
  # DELETE /item_not_includeds/1.json
  def destroy
    @item_not_included.destroy
    respond_to do |format|
      format.html { redirect_to item_not_includeds_url, notice: 'Item not included was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_not_included
      @item_not_included = ItemNotIncluded.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_not_included_params
      params.require(:item_not_included).permit(:title, :description)
    end
end
