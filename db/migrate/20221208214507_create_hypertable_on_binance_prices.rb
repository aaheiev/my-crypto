class CreateHypertableOnBinancePrices < ActiveRecord::Migration[6.1]
  def change
    execute "SELECT create_hypertable('binance_prices','created_at')"
  end
end
