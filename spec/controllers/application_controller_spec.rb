require 'spec_helper'

describe ApplicationController do
  it 'removes the flash from xhr requests' do
      
      controller.stub!(:ajaxaction).and_return(flash[:notice]='FLASHNOTICE')
      controller.stub!(:regularaction).and_return()
      xhr :get, :ajaxaction
      flash[:notice].should == 'FLASHNOTICE'
      get :regularaction
      flash[:notice].should be_nil

  end

end
