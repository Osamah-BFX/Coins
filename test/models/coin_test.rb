require "test_helper"

class CoinTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @coin = coins(:one)
  end

  test "should not save coin without name" do
    @coin.name = nil
    assert_not @coin.save
  end
end
