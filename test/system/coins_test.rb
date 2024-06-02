require "application_system_test_case"

class CoinsTest < ApplicationSystemTestCase
  setup do
    @coin = coins(:one)
  end

  test "visiting the index" do
    visit coins_url
    assert_selector "h1", text: "Coins"
  end

  test "should create coin" do
    visit coins_url
    click_on "New coin"

    fill_in "Delta 1h", with: @coin.delta_1h
    fill_in "Delta 24h", with: @coin.delta_24h
    fill_in "Delta 30d", with: @coin.delta_30d
    fill_in "Delta 7d", with: @coin.delta_7d
    fill_in "High 24h", with: @coin.high_24h
    fill_in "Low 24h", with: @coin.low_24h
    fill_in "Market cap", with: @coin.market_cap
    fill_in "Name", with: @coin.name
    fill_in "Price", with: @coin.price
    fill_in "Rank", with: @coin.rank
    fill_in "Show symbol", with: @coin.show_symbol
    fill_in "Symbol", with: @coin.symbol
    fill_in "Total volume 24h", with: @coin.total_volume_24h
    fill_in "Volume 24h", with: @coin.volume_24h
    click_on "Create Coin"

    assert_text "Coin was successfully created"
    click_on "Back"
  end

  test "should update Coin" do
    visit coin_url(@coin)
    click_on "Edit this coin", match: :first

    fill_in "Delta 1h", with: @coin.delta_1h
    fill_in "Delta 24h", with: @coin.delta_24h
    fill_in "Delta 30d", with: @coin.delta_30d
    fill_in "Delta 7d", with: @coin.delta_7d
    fill_in "High 24h", with: @coin.high_24h
    fill_in "Low 24h", with: @coin.low_24h
    fill_in "Market cap", with: @coin.market_cap
    fill_in "Name", with: @coin.name
    fill_in "Price", with: @coin.price
    fill_in "Rank", with: @coin.rank
    fill_in "Show symbol", with: @coin.show_symbol
    fill_in "Symbol", with: @coin.symbol
    fill_in "Total volume 24h", with: @coin.total_volume_24h
    fill_in "Volume 24h", with: @coin.volume_24h
    click_on "Update Coin"

    assert_text "Coin was successfully updated"
    click_on "Back"
  end

  test "should destroy Coin" do
    visit coin_url(@coin)
    click_on "Destroy this coin", match: :first

    assert_text "Coin was successfully destroyed"
  end
end
