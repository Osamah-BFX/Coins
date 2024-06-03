require 'rails_helper'

RSpec.feature "Coins", type: :feature do
  describe 'index page' do
    it 'displays the correct title' do
      visit coins_path
      expect(page).to have_content('All Coins')
    end
  end

  describe 'show page' do
    let(:coin) { Coin.create!(symbol: 'BTC', name: 'Bitcoin', rank: 1, price: 50000, market_cap: 1000000000, volume_24h: 500000, delta_24h: 0.05, total_volume_24h: 1000000, low_24h: 48000, high_24h: 52000, delta_1h: 0.01, delta_7d: 0.1, delta_30d: 0.2) }

    it 'displays the correct title' do
      visit coin_path(coin.id)
      expect(page).to have_content(coin.name)
    end
  end

  describe 'overview page' do
    it 'displays the correct title' do
      visit root_path
      expect(page).to have_content('Top 10 Coins')
    end
  end
end
