# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'httparty'

response = HTTParty.get('https://coinlib.io/api/v1/coinlist?key=ab77110dac87d599&pref=USD&page=1&order=rank_asc')
data = JSON.parse(response.body)

coins = data['coins']
coins.each do |coin_data|
  Coin.create!(
    symbol: coin_data['symbol'],
    name: coin_data['name'],
    rank: coin_data['rank'],
    price: coin_data['price'].to_d,
    market_cap: coin_data['market_cap'].to_d,
    volume_24h: coin_data['volume_24h'].to_d,
    delta_24h: coin_data['delta_24h']
  )
end

puts "Initial seed data populated successfully!"

def fetch_coin_details(symbol)
  response = HTTParty.get("https://coinlib.io/api/v1/coin?key=ab77110dac87d599&pref=USD&symbol=#{symbol}")
  data = JSON.parse(response.body)
  details = {
    low_24h: data['low_24h'].to_d,
    high_24h: data['high_24h'].to_d,
    delta_1h: data['delta_1h'],
    delta_7d: data['delta_7d'],
    delta_30d: data['delta_30d']
  }
  details
end

Coin.all.each do |coin|
  details = fetch_coin_details(coin.symbol)
  coin.update!(details)
end

puts "Coin details updated successfully!"

    # symbol
    # name
    # rank
    # price
    # market_cap
    # volume_24h
    # delta_24h

    # "low_24h"
    # "high_24h"
    # "delta_1h"
    # "delta_7d"
    # "delta_30d"
