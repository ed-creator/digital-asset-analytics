require 'httparty'

class DigitalAsset < ApplicationRecord
  validates :ticker, uniqueness: true
  has_many :price_histories

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

  def usd_string_marketcap
    if usd_price != nil
      return (ActionController::Base.helpers.number_with_precision(usd_marketcap,precision: 20, strip_insignificant_zeros: true))
    else
      return "0"
    end
  end

  def get_price_history_max
    return price_histories.max_by(&:close).close unless price_histories.empty?
  end

  def get_price_history_data
    array = price_histories.where("close > 0").order('date_integer_timestamp')
    array.map do |x|
      {price: x.close, date: (x.date_timestamp.to_i * 1000)}
    end
  end

end
