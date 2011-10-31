require 'spec_helper'

describe User do
  it {should belong_to :authenticateable}

  it "should be able to determine username from email" do
    @user = User.new
    @user.email = "test@test.com"
    @user.name_from_email.should  == "test"
  end
end
