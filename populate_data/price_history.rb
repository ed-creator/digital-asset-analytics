require 'httparty'
require 'sqlite3'
require 'active_record'
require './app/models/application_record'
require './app/models/digital_asset'
require './app/models/price_history'


ActiveRecord::Base.establish_connection(
  adapter:  "sqlite3",
  database: "./db/development.sqlite3"
)

def cryptocompare(asset)
response = HTTParty.get('https://min-api.cryptocompare.com/data/histoday?fsym=' + asset.ticker + '&tsym=USD&limit=2000&aggregate=1&e=CCCAGG')
data = response.parsed_response['Data']
  data.each do |snapshot|

    instance = asset.price_histories.create(date_integer_timestamp: snapshot['time'],
                        close: snapshot['close'],
                        volume_from_usd: snapshot['volumefrom'],
                        volume_to_usd: snapshot["volumeto"])
  end

end

# DigitalAsset.find_each do |asset|
#   cryptocompare(asset)
# end

cryptocompare(DigitalAsset.first)
