class DealsController < ApplicationController
  before_filter only:[:show] {|controller| @allow_new_users = true}

  def index
    @deals = Deal.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deals }
    end
  end



  def show

    #TODO: update Deal.last to show today's deal
    params[:id].nil? ? @deal = Deal.last : @deal = Deal.find(params[:id])
    @consumer = Consumer.new 
    @consumer.build_user
    @years = (Time.now.year..Time.now.year + 3).map {|y| [y,y] }
    @months = (1..12).map {|m| [Date::MONTHNAMES[m], m]}


    respond_to do |format|
      format.html # show.html.erb
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
