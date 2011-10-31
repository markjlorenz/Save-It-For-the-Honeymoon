class AddRedeemedAtToPurchasedDeal < ActiveRecord::Migration
  def self.up
    add_column :purchased_deals, :redeemed_at, :datetime
  end

  def self.down
    remove_column :purchased_deals, :redeemed_at
  end
end
