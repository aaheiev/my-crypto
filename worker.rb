#!/usr/bin/env ruby

# bundle exec shoryuken -q binance-price-update -r ./worker.rb
require "json"
require 'shoryuken'
SQS_QUEUE_NAME = 'binance-price-update'

sqs = Aws::SQS::Client.new(endpoint: "http://127.0.0.1:4576", verify_checksums: false)
Shoryuken.sqs_client_receive_message_opts = { max_number_of_messages: 10, wait_time_seconds: 10 }
Shoryuken.configure_server { |config| config.sqs_client = sqs }
Shoryuken.configure_client { |config| config.sqs_client = sqs }

class BinancePriceUpdateWorker
  include Shoryuken::Worker
  shoryuken_options queue: SQS_QUEUE_NAME, auto_delete: true

  def perform(sqs_msg, symbol)
    %x[bundle exec rake binance:price[#{symbol}]]
  end
end
