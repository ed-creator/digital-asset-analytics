require 'httparty'
require 'sqlite3'
require 'active_record'
require './app/models/application_record'
require './app/models/digital_asset'

ActiveRecord::Base.establish_connection(
  adapter:  "sqlite3",
  database: "./db/development.sqlite3"
)

response = HTTParty.get('https://www.cryptocompare.com/api/data/coinlist/')
data = response.parsed_response['Data']

data.each do |asset|
  DigitalAsset.create(name: asset[1]["CoinName"],
                      ticker: asset[0],
                      total_coin_supply: asset[1]["TotalCoinSupply"],
                      proof_type: asset[1]["ProofType"])
end
