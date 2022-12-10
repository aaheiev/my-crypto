class BinancePrice < ApplicationRecord
  belongs_to :binance_price_pair
  self.primary_key = :binance_price_pair_id,:created_at
end
