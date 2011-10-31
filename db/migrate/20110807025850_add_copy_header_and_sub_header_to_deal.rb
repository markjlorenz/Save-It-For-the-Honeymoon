class AddCopyHeaderAndSubHeaderToDeal < ActiveRecord::Migration
  def self.up
    add_column :deals, :copy_header, :text
    add_column :deals, :copy_subheader, :text
  end

  def self.down
    remove_column :deals, :copy_subheader
    remove_column :deals, :copy_header
  end
end
