class CreateMerchants < ActiveRecord::Migration
  def self.up
    create_table :merchants do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :contact_name
      t.text :address
      t.integer :authenticateable_id
      t.string :authenticateable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :merchants
  end
end
