class CreatePurchasedDeals < ActiveRecord::Migration
  def self.up
    create_table :purchased_deals do |t|
      t.integer :consumer_id
      t.integer :deal_id

      t.timestamps
    end
  end

  def self.down
    drop_table :purchased_deals
  end
end
