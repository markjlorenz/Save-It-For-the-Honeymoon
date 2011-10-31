require 'spec_helper'

describe Deal do
  it { should have_attached_file(:image)}
  it { should have_many(:purchased_deals)}
  it { should have_many(:consumers).through(:purchased_deals)}
  it { should belong_to(:merchant)}
end
