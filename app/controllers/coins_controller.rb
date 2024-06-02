class CoinsController < ApplicationController

  def index
    @coins = Coin.order(rank: :asc).select(:id, :rank, :name, :symbol, :price, :market_cap)
  end

  def show
    @coin = Coin.find(params[:id])
  end

  def overview
    @coins = Coin.order(rank: :asc).select(:id, :rank, :name, :symbol, :price, :market_cap).limit(10)
    @min_price = @coins.minimum(:price)
    @max_price = @coins.maximum(:price)
    @avg_price = @coins.average(:price)
    @total_market_cap = Coin.sum(:market_cap)
    @volume_24h = Coin.sum(:volume_24h)
    @num_coins = Coin.count
    @avg_delta_24h = Coin.average(:delta_24h)
    @highest_market_cap_coin = Coin.order(market_cap: :desc).first
    @most_traded_coin = Coin.order(total_volume_24h: :desc).first
  end

  def update_data
    update_coins
    update_coin_details
    redirect_to coins_path, notice: 'Data updated successfully!'
  end

  private

  def update_coins
    response = HTTParty.get("https://coinlib.io/api/v1/coinlist?key=#{ENV['COINLIB_API_KEY']}&pref=USD&page=1&order=rank_asc")
    data = JSON.parse(response.body)

    coins = data['coins']
    coins.each do |coin_data|
      coin = Coin.find_or_initialize_by(symbol: coin_data['symbol'])
      coin.update(
        name: coin_data['name'],
        rank: coin_data['rank'],
        price: coin_data['price'].to_d,
        market_cap: coin_data['market_cap'].to_d,
        volume_24h: coin_data['volume_24h'].to_d,
        delta_24h: coin_data['delta_24h']
      )
    end
  end

  def update_coin_details
    Coin.all.each do |coin|
      details = fetch_coin_details(coin.symbol)
      coin.update(details)
    end
  end

  def fetch_coin_details(symbol)
    response = HTTParty.get("https://coinlib.io/api/v1/coin?key=#{ENV['COINLIB_API_KEY']}&pref=USD&symbol=#{symbol}")
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
end
