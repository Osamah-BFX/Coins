require "test_helper"

class CoinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coin = coins(:one)
  end

  test "should get index" do
    get coins_url
    assert_response :success
  end

  test "should get overview" do
    get root_url
    assert_response :success
  end

  # test "should get new" do
  #   get new_coin_url
  #   assert_response :success
  # end

  # test "should create coin" do
  #   assert_difference("Coin.count") do
  #     post coins_url, params: { coin: { delta_1h: @coin.delta_1h, delta_24h: @coin.delta_24h, delta_30d: @coin.delta_30d, delta_7d: @coin.delta_7d, high_24h: @coin.high_24h, low_24h: @coin.low_24h, market_cap: @coin.market_cap, name: @coin.name, price: @coin.price, rank: @coin.rank, show_symbol: @coin.show_symbol, symbol: @coin.symbol, total_volume_24h: @coin.total_volume_24h, volume_24h: @coin.volume_24h } }
  #   end

  #   assert_redirected_to coin_url(Coin.last)
  # end

  test "should show coin" do
    get coin_url(@coin)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_coin_url(@coin)
  #   assert_response :success
  # end

  # test "should update coin" do
  #   patch coin_url(@coin), params: { coin: { delta_1h: @coin.delta_1h, delta_24h: @coin.delta_24h, delta_30d: @coin.delta_30d, delta_7d: @coin.delta_7d, high_24h: @coin.high_24h, low_24h: @coin.low_24h, market_cap: @coin.market_cap, name: @coin.name, price: @coin.price, rank: @coin.rank, show_symbol: @coin.show_symbol, symbol: @coin.symbol, total_volume_24h: @coin.total_volume_24h, volume_24h: @coin.volume_24h } }
  #   assert_redirected_to coin_url(@coin)
  # end

  # test "should destroy coin" do
  #   assert_difference("Coin.count", -1) do
  #     delete coin_url(@coin)
  #   end

  #   assert_redirected_to coins_url
  # end
end
