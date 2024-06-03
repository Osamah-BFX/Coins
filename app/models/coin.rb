class Coin < ApplicationRecord
  validates :symbol, presence: true
  # validates :show_symbol, presence: true
  validates :name, presence: true
  validates :rank, presence: true
  validates :price, presence: true
  validates :market_cap, presence: true
  validates :volume_24h, presence: true
  validates :delta_24h, presence: true
  # validates :total_volume_24h, presence: true
  validates :low_24h, presence: true
  validates :high_24h, presence: true
  validates :delta_1h, presence: true
  validates :delta_7d, presence: true
  validates :delta_30d, presence: true
end
