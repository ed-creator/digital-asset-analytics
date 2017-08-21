require 'httparty'

class DigitalAsset < ApplicationRecord
  validates :ticker, uniqueness: true

  def update_price
    response = HTTParty.get('https://min-api.cryptocompare.com/data/price?fsym=' + ticker + '&tsyms=BTC,USD,ETH')
    self.usd_price = response.parsed_response['USD']
    self.btc_price = response.parsed_response['BTC']
    self.eth_price = response.parsed_response['ETH']
    self.usd_marketcap = usd_price * total_coin_supply if usd_price != nil
    self.save
  end

  def usd_string_price
    if usd_price != nil
      return (ActionController::Base.helpers.number_with_precision(usd_price,precision: 20, strip_insignificant_zeros: true))
    else
      return "0"
    end
  end

end
