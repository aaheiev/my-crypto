# rake binance:update_all
# rake binance:price[BNBUSDT]
namespace :binance do

  desc "Update all prices"
  task :update_all => :environment do
    Binance::Spot.new.ticker_price.each do |p|
      pp = BinancePricePair.find_or_create_by(id: p[:symbol])
      price = p[:price].to_f
      pp.latest_price_usd = price
      pp.update_price price
      pp.save
      puts "#{p[:symbol]}: #{price} #{pp.updated_at}"
    end
  end

  desc "Update price pair 'rake binance:price[binance_price_pair_id]'"
  task :price, [:binance_price_pair_id] => :environment do |_key, args|
    puts args[:binance_price_pair_id]
    pp = BinancePricePair.find(args[:binance_price_pair_id])
    pp.update_price
  end
end
