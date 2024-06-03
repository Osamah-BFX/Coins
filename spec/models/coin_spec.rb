require 'rails_helper'

RSpec.describe Coin, type: :model do
  describe 'validations' do
    it 'validates presence of required fields' do
      coin = Coin.new
      expect(coin.valid?).to eq(false)
      expect(coin.errors[:symbol].any?).to eq(true)
      # expect(coin.errors[:show_symbol].any?).to eq(true)
      expect(coin.errors[:name].any?).to eq(true)
      expect(coin.errors[:rank].any?).to eq(true)
      expect(coin.errors[:price].any?).to eq(true)
      expect(coin.errors[:market_cap].any?).to eq(true)
      expect(coin.errors[:volume_24h].any?).to eq(true)
      expect(coin.errors[:delta_24h].any?).to eq(true)
      # expect(coin.errors[:total_volume_24h].any?).to eq(true)
      expect(coin.errors[:low_24h].any?).to eq(true)
      expect(coin.errors[:high_24h].any?).to eq(true)
      expect(coin.errors[:delta_1h].any?).to eq(true)
      expect(coin.errors[:delta_7d].any?).to eq(true)
      expect(coin.errors[:delta_30d].any?).to eq(true)
    end
  end
end
