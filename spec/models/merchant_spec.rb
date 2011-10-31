require 'spec_helper'

describe Merchant do
  it {should have_one :user}
  it {should have_many :deals}
end
