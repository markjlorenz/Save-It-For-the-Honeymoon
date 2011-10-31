require 'spec_helper'

describe Consumer do
  it { should have_one :user}
  it { should have_many(:purchased_deals)}
  it { should have_many(:deals).through(:purchased_deals)}

  it "should require a user" do
    @consumer = Consumer.new
    @consumer.user = mock_model(User, authenticateable:@consumer, :[]==>nil)
    @consumer.should be_valid
      
    @consumer = Consumer.new
    @consumer.should_not be_valid
  end

end
