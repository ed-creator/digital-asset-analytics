class DigitalAssets::PriceDataController < ApplicationController

  def show
    session[:current_digital_asset_id] = params['id']
    @price_histories = current_digital_asset.price_histories
    gon.current_digital_asset = current_digital_asset
    gon.data = current_digital_asset.get_price_history_data.map{|x| [x[:date], x[:price]]}
    gon.max_price = current_digital_asset.get_price_history_max
  end
end
