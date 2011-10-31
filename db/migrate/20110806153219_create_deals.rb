class CreateDeals < ActiveRecord::Migration
  def self.up
    create_table :deals do |t|
      t.datetime :live_at
      t.integer :merchant_id
      t.text :copy

      t.timestamps
    end
  end

  def self.down
    drop_table :deals
  end
end
