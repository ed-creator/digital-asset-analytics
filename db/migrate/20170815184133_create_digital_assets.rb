class CreateDigitalAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :digital_assets do |t|

      t.string :name
      t.string :ticker
      t.string :proof_type
      t.float :usd_price
      t.float :btc_price
      t.float :eth_price
      t.float :usd_marketcap
      t.integer :total_coin_supply, limit: 8
      t.integer :available_coin_supply, limit: 8
      t.timestamps
    end
  end
end
