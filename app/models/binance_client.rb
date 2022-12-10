require 'binance'
class BinanceClient
  def self.client
    Binance::Spot.new(key: ENV['BINANCE_API_KEY'], secret: ENV['BINANCE_SECRET_KEY'])
  end
end