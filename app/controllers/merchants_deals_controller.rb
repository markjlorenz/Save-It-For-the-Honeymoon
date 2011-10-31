class MerchantsDealsController < ApplicationController
  acts_as_nested_resource model:Deal
  layout 'merchant'

  def index
    redirect_to(merchant_deal_path(@deals.first.merchant, @deals.first)) and return if (@deals.size == 1)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deals }
    end
  end



  def show
    @deal = Deal.find(params[:id])

    respond_to do |format|
      format.html { render action:'show' } 
      format.xml  { render :xml => @deal }
    end
  end



  def new
    @deal = Deal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @deal }
    end
  end


  def edit
    @deal = Deal.find(params[:id])
  end



  def create
    @deal = Deal.new(params[:deal])

    respond_to do |format|
      if @deal.save
        format.html { redirect_to(@deal, :notice => 'Deal was successfully created.') }
        format.xml  { render :xml => @deal, :status => :created, :location => @deal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @deal.errors, :status => :unprocessable_entity }
      end
    end
  end



  def update
    @deal = Deal.find(params[:id])

    respond_to do |format|
      if @deal.update_attributes(params[:deal])
        format.html { redirect_to(@deal, :notice => 'Deal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @deal.errors, :status => :unprocessable_entity }
      end
    end
  end



  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy

    respond_to do |format|
      format.html { redirect_to(deals_url) }
      format.xml  { head :ok }
    end
  end
end
