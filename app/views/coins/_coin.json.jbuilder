json.extract! coin, :id, :symbol, :show_symbol, :name, :rank, :price, :market_cap, :volume_24h, :delta_24h, :total_volume_24h, :low_24h, :high_24h, :delta_1h, :delta_7d, :delta_30d, :created_at, :updated_at
json.url coin_url(coin, format: :json)
