require 'binance'

client = Binance::Spot.new(key: ENV['BINANCE_API_KEY'], secret: ENV['BINANCE_SECRET_KEY'])
client.ticker_price.each do |p|
  pp = BinancePricePair.find_or_create_by(id: p[:symbol])
  price = p[:price].to_f
  pp.latest_price_usd = price
  pp.update_price price
  pp.save
  puts "#{p[:symbol]}: #{price} #{pp.updated_at}"
end
