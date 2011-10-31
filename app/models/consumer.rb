class Consumer < ActiveRecord::Base
  has_one :user, :as=>:authenticateable
  accepts_nested_attributes_for :user

  has_many :purchased_deals
  has_many :deals, :through=>:purchased_deals

  validates :user, presence:true

end
