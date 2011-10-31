class User < ActiveRecord::Base
  include Clearance::User
  belongs_to :authenticateable, polymorphic:true

  def name_from_email
    email.split('@')[0]
  end

  def consumer
    authenticateable
  end
  def merchant
    authenticateable
  end
end
