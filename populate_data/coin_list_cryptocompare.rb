require 'httparty'
require 'sqlite3'
require 'active_record'
require './app/models/application_record'
require './app/models/digital_asset'

ActiveRecord::Base.establish_connection(
  adapter:  "sqlite3",
  database: "./db/development.sqlite3"
)

def cryptocompare
response = HTTParty.get('https://www.cryptocompare.com/api/data/coinlist/')
data = response.parsed_response['Data']
  data.each do |asset|
    instance = DigitalAsset.create(name: asset[1]["CoinName"],
                        ticker: asset[0],
                        total_coin_supply: asset[1]["TotalCoinSupply"],
                        proof_type: asset[1]["ProofType"])
    instance.update_price
  end
end

def coinmarketcap
  response = HTTParty.get('https://api.coinmarketcap.com/v1/ticker/')
  data = response.parsed_response
  data.each do |asset|
    instance = DigitalAsset.create(name: asset["name"],
                        ticker: asset["symbol"],
                        total_coin_supply: asset["total_supply"],
                        usd_price: asset["price_usd"],
                        btc_price: asset["price_btc"],
                        available_coin_supply: asset["available_supply"],
                        usd_marketcap: asset["market_cap_usd"])


  end
end
coinmarketcap
