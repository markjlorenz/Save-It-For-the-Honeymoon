class Deal < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :purchased_deals
  has_many :consumers, :through=>:purchased_deals
  belongs_to :merchant



  validates :copy, presence:true
  validates :copy_header, presence:true
  validates :copy_subheader, presence:true
end
