class DigitalAssetsController < ApplicationController
  before_action :set_digital_asset, only: [:show, :edit, :update, :destroy]

  # GET /digital_assets
  # GET /digital_assets.json
  def index
    @digital_assets = DigitalAsset.all
  end

  # GET /digital_assets/1
  # GET /digital_assets/1.json
  def show
  end

  # GET /digital_assets/new
  def new
    @digital_asset = DigitalAsset.new
  end

  # GET /digital_assets/1/edit
  def edit
  end

  # POST /digital_assets
  # POST /digital_assets.json
  def create
    @digital_asset = DigitalAsset.new(digital_asset_params)

    respond_to do |format|
      if @digital_asset.save
        format.html { redirect_to @digital_asset, notice: 'Digital asset was successfully created.' }
        format.json { render :show, status: :created, location: @digital_asset }
      else
        format.html { render :new }
        format.json { render json: @digital_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /digital_assets/1
  # PATCH/PUT /digital_assets/1.json
  def update
    respond_to do |format|
      if @digital_asset.update(digital_asset_params)
        format.html { redirect_to @digital_asset, notice: 'Digital asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @digital_asset }
      else
        format.html { render :edit }
        format.json { render json: @digital_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /digital_assets/1
  # DELETE /digital_assets/1.json
  def destroy
    @digital_asset.destroy
    respond_to do |format|
      format.html { redirect_to digital_assets_url, notice: 'Digital asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_digital_asset
      @digital_asset = DigitalAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def digital_asset_params
      params.require(:digital_asset).permit(:name, :ticker)
    end
end
