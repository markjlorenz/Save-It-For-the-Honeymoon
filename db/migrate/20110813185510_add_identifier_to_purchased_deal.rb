class AddIdentifierToPurchasedDeal < ActiveRecord::Migration
  def self.up
    add_column :purchased_deals, :identifier, :string
    add_index :purchased_deals, :identifier
  end

  def self.down
    remove_column :purchased_deals, :identifier
  end
end
