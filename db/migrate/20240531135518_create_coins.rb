class CreateCoins < ActiveRecord::Migration[7.1]
  def change
    create_table :coins do |t|
      t.string :symbol
      t.string :show_symbol
      t.string :name
      t.integer :rank
      t.decimal :price
      t.decimal :market_cap
      t.decimal :volume_24h
      t.decimal :delta_24h
      t.decimal :total_volume_24h
      t.decimal :low_24h
      t.decimal :high_24h
      t.decimal :delta_1h
      t.decimal :delta_7d
      t.decimal :delta_30d

      t.timestamps
    end
  end
end
