class DigitalAssets::PriceDataController < ApplicationController

  def show
    session[:current_digital_asset_id] = params['id']
  end
end
