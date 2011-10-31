class FixAuthenticateableAssocation < ActiveRecord::Migration
  def self.up
    add_column :users, :authenticateable_id, :integer
    add_column :users, :authenticateable_type, :string
  end

  def self.down
    remove_column :users, :authenticateable_id
    remove_column :users, :authenticateable_type
    add_column :consumers, :authenticateable_id, :integer
    add_column :consumers, :authenticateable_type, :string
    add_column :merchants, :authenticateable_id, :integer
    add_column :merchants, :authenticateable_type, :string
  end
end
