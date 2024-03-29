class CreateConsumers < ActiveRecord::Migration
  def self.up
    create_table :consumers do |t|
      t.string :wedding_month
      t.integer :wedding_year
      t.string :postal_code
      t.integer :authenticateable_id
      t.string :authenticateable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :consumers
  end
end
