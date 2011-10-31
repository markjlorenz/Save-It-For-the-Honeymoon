require 'spec_helper'

describe "Deals" do
  describe "GET /deals" do
    it "works! (now write some real specs)" do
      get deals_path
      response.status.should be(200)
    end
  end
end
