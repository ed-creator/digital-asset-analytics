class CreateDigitalAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :digital_assets do |t|
      t.string :name
      t.string :ticker
      t.string :proof_type
      t.integer :total_coin_supply, limit: 8
      t.timestamps
    end
  end
end
