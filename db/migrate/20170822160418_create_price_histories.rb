class CreatePriceHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :price_histories do |t|
      t.belongs_to :digital_asset, foreign_key: true

      t.timestamps
      t.integer :date_integer_timestamp
      t.float :close
      t.float :volume_from_usd
      t.float :volume_to_usd
      t.float :volume_from_btc
      t.float :volume_to_btc
      t.float :volume_from_eth
      t.float :volume_to_eth

    end
  end
end
