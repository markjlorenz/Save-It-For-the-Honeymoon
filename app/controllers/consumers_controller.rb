class ConsumersController < ApplicationController


  def index
    @consumers = Consumer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consumers }
    end
  end


  def setup
    @consumer.build_user if @consumer.user.nil?
    @years = (Time.now.year..Time.now.year + 3).map {|y| [y,y] }
    @months = (1..12).map {|m| [Date::MONTHNAMES[m], m]}
  end


  def show
    @consumer = Consumer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consumer }
    end
  end



  def new
    @consumer = Consumer.new
    setup

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consumer }
    end
  end


  def edit
    @consumer = Consumer.find(params[:id])
  end



  def create
    @consumer = Consumer.new(params[:consumer])

    respond_to do |format|
      if @consumer.save
        flash[:notice] = "You're All Set.  Look For Our Emails"
        format.html { redirect_to(:back) }
        format.xml  { render :xml => @consumer, :status => :created, :location => @consumer }
        format.js  { render action:'success'}
      else
        setup
        format.html { render :action => "new", :status => :unprocessable_entity}
        format.xml  { render :xml => @consumer.errors, :status => :unprocessable_entity }
        #format.js  { render action:'failure', :status => :unprocessable_entity}
      end
    end
  end



  def update
    @consumer = Consumer.find(params[:id])

    respond_to do |format|
      if @consumer.update_attributes(params[:consumer])
        format.html { redirect_to(@consumer, :notice => 'Consumer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consumer.errors, :status => :unprocessable_entity }
      end
    end
  end



  def destroy
    @consumer = Consumer.find(params[:id])
    @consumer.destroy

    respond_to do |format|
      format.html { redirect_to(consumers_url) }
      format.xml  { head :ok }
    end
  end
end
