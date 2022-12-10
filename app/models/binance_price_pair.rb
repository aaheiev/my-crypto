class BinancePricePair < ApplicationRecord
  self.primary_key = :id
  has_many :binance_prices

  def update_price(price = nil)
    price  = BinanceClient::client.ticker_price(symbol: self.id)[:price] if price.nil?
    self.binance_prices.create(price: price, created_at: DateTime.now)
  end
end
