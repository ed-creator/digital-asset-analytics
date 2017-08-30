require 'nokogiri'

def social_scrape
  require 'open-uri'
  # require 'openssl'
  doc = Nokogiri::HTML(open('https://coinmarketcap.com/').read)
  require 'pry'; binding.pry
end

social_scrape
