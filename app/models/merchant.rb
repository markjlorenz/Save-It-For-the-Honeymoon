class Merchant < ActiveRecord::Base
  has_one :user, :as=>:authenticateable
  has_many :deals
end

