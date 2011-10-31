class PurchasedDealsController < ApplicationController
  before_filter :authorize
  acts_as_nested_resource

  def index

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchased_deals }
    end
  end



  def show
    @purchased_deal = PurchasedDeal.find(params[:id])
    @barcode_url = url_for(:action => :image, :id => @purchased_deal.id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchased_deal }
    end
  end


  def image
    purchased_deal = PurchasedDeal.find(params[:id])
    @barcode_image = purchased_deal.barcode_data
    @barcode_image = purchased_deal.favor_data
    if @barcode_image
      headers['Cache-Control'] = 'public; max-age=2592000' # cache image for a month
      send_data @barcode_image, :filename => purchased_deal.deal.merchant.name, :disposition => 'inline', :type => "image/png"
    else
      raise NoBarcodeImage
    end
  end

  def new
    @purchased_deal = PurchasedDeal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchased_deal }
    end
  end


  def edit
    @purchased_deal = PurchasedDeal.find(params[:id])
  end



  def create
    raise NoConsumerForCurrentUser if current_user.consumer.nil? 
    @purchased_deal = PurchasedDeal.new(params[:purchased_deal])
    @purchased_deal.consumer = current_user.consumer

    respond_to do |format|
      if @purchased_deal.save
        #format.html { redirect_to(@purchased_deal, :notice => 'Purchased deal was successfully created.') }
        format.html { redirect_to({action:'thanks_for_purchasing'}, :notice => 'Purchased deal was successfully created.') }
        format.xml  { render :xml => @purchased_deal, :status => :created, :location => @purchased_deal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchased_deal.errors, :status => :unprocessable_entity }
      end
    end
  end



  def update
    @purchased_deal = PurchasedDeal.find(params[:id])

    respond_to do |format|
      if @purchased_deal.update_attributes(params[:purchased_deal])
        format.html { redirect_to(@purchased_deal, :notice => 'Purchased deal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchased_deal.errors, :status => :unprocessable_entity }
      end
    end
  end

  def redeem
    #TODO test
    @purchased_deal = PurchasedDeal.find_by_identifier(params[:purchased_deal][:identifier])
    respond_to do |format|
      if @purchased_deal.nil?
        flash[:alert] = 'Invalid Purchased Deal Identification Number'
        format.html {redirect_to :back}
        format.xml  { render :xml => @purchased_deal.errors}
      elsif !@purchased_deal.redeemed_at.nil?
        flash[:alert] = 'That Deal Has Already Been Redeemed!'
        format.html {redirect_to :back}
        format.xml  { render :xml => @purchased_deal.errors}
      else 
        if @purchased_deal.update_attributes(params[:purchased_deal])
          flash[:notice] = "Deal Redeemed for #{@purchased_deal.consumer.user.name_from_email}"
          format.html { redirect_to(:back) }
          format.xml  { head :ok }
        else
          raise PurchasedDealRedemptionError
        end
      end
    end
  end

  def destroy
    @purchased_deal = PurchasedDeal.find(params[:id])
    @purchased_deal.destroy

    respond_to do |format|
      format.html { redirect_to(purchased_deals_url) }
      format.xml  { head :ok }
    end
  end
end

module Exceptions
  class NoConsumerForCurrentUser < StandardError; end
  class NoBarcodeImage < StandardError; end
  class PurchasedDealRedemptionError < StandardError; end
end
