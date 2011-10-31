class PurchasedDeal < ActiveRecord::Base
  require "digest/sha1" #to be factored out later
  require 'rmagick'
  require 'barby'
  #require 'barby/outputter/rmagick_outputter'
  require 'dbd_rmagick_outputter'
  require 'barby/outputter/ascii_outputter'

  IdentifierLength = 9

  belongs_to :consumer
  belongs_to :deal

  validates :consumer, presence:true
  validates :deal, presence:true

  before_create :generate_identifier

  def redeem=(val)
    self.redeemed_at = DateTime.now if val
  end

  def barcode_data
    return if self.identifier.nil?
    barcode = Barby::Code128B.new(self.identifier)
    barcode.to_png height:40, font_height:12
  end
  
  def favor_data
    dest = Magick::Image.read("#{Rails.root}/public/images/favor.png")[0].resize_to_fit!(400)
    barcode = Magick::Image.from_blob(barcode_data)[0]
    result = dest.composite(barcode, Magick::SouthGravity, 0, 35, Magick::OverCompositeOp)
    result.to_blob
  end

  private
    def generate_identifier
      #a good enough method for making a machine readable key for this purchased deal for now
      self.identifier = Digest::SHA1.hexdigest(Time.now.to_s + rand(12341234).to_s)[1..PurchasedDeal::IdentifierLength]  #by my calc, nine decimal of hex would give almost 78 billion posibilities
    end

end
