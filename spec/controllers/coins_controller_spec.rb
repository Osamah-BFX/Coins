require 'rails_helper'

RSpec.describe CoinsController, type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get coins_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get coins_path
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:coin) { Coin.create!(symbol: 'BTC', name: 'Bitcoin', rank: 1, price: 50000, market_cap: 1000000000, volume_24h: 500000, delta_24h: 0.05, total_volume_24h: 1000000, low_24h: 48000, high_24h: 52000, delta_1h: 0.01, delta_7d: 0.1, delta_30d: 0.2) }

    it 'returns http success' do
      get coin_path(coin.id)
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get coin_path(coin.id)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #overview' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the overview template' do
      get root_path
      expect(response).to render_template(:overview)
    end
  end
end
