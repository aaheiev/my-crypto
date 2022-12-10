class CreateBinancePricePairs < ActiveRecord::Migration[6.1]
  def change
    create_table :binance_price_pairs, id: false do |t|
      t.string :id, null: false
      t.float :latest_price_usd
      t.boolean :watch, default: false
      t.string :watch_schedule, default: nil
      t.timestamps
    end
    add_index :binance_price_pairs, :id, unique: true
  end
end
