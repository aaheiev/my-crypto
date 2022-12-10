class CreateBinancePrices < ActiveRecord::Migration[6.1]
  def change
    create_table :binance_prices, id: false do |t|
      t.references :binance_price_pair, type: :string, null: false, index: true
      t.timestamp  :created_at, null: false, default: DateTime.now
      t.float      :price
    end
    add_index :binance_prices, [:binance_price_pair_id, :created_at], unique: true
  end
end
