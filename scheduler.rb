#!clockwork
require 'clockwork'
require 'aws-sdk-sqs'
require 'aws-sdk-sts'
include Clockwork
sqs_client = Aws::SQS::Client.new(endpoint: "http://127.0.0.1:4576", verify_checksums: false)
queue_name = 'binance-price-update'
queue_url = "http://127.0.0.1:4576/123456789012/#{queue_name}"

def send_message(sqs_client, queue_url, message_body)
  sqs_client.send_message(queue_url: queue_url, message_body: message_body)
  true
rescue StandardError => e
  puts "Error sending message: #{e.message}"
  false
end

handler do |binance_price_pair|
  # %x[bundle exec rake binance:price[#{binance_price_pair}]]
  send_message(sqs_client, queue_url, binance_price_pair)
end

every(1.minute,  'AXSUSDT')
every(1.minute,  'AXSBUSD')
every(1.minute,  'DOGEUSDT')
every(1.minute,  'DOGEBUSD')
every(1.minute,  'OSMOBUSD')
every(1.minute,  'OSMOUSDT')
every(1.minute,  'BNBUSDT')
every(1.minute,  'BNBBUSD')
every(1.minute,  'SOLBUSD')
every(1.minute,  'ETHBUSD')
every(1.minute,  'ETHTUSD')
every(1.minute,  'BTCBUSD')
every(1.minute,  'BTCTUSD')
every(3.minutes, 'HFTBUSD')
every(5.minutes, 'MATICBUSD')
