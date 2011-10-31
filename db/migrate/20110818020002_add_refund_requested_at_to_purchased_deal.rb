class AddRefundRequestedAtToPurchasedDeal < ActiveRecord::Migration
  def self.up
    add_column :purchased_deals, :refund_requested_at, :datetime
  end

  def self.down
    remove_column :purchased_deals, :refund_requested_at
  end
end
