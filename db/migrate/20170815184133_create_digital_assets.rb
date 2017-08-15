class CreateDigitalAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :digital_assets do |t|
      t.string :name
      t.string :ticker

      t.timestamps
    end
  end
end
