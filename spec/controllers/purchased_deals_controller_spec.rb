require 'spec_helper'

describe PurchasedDealsController do

  def valid_attributes
    {consumer:Consumer.create(user:User.create(email:'test@test.com', password:'pass')), deal:Deal.create(copy:'copy',copy_header:'copy header',copy_subheader:'copy_subheader')}
  end

  describe "GET index" do
    describe "without signed in user" do
      it "requires signed in user to visit" do
        post :create, :purchased_deal => valid_attributes
        should deny_access
      end
    end
    describe "with signed in user" do
      before(:each) do
        sign_in_as mock_model(User, email:'test@test.com', consumer:mock_model(Consumer))
      end
      it "assigns all purchased_deals as @purchased_deals" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        get :index
        assigns(:purchased_deals).should eq([purchased_deal])
      end
      it "assigns only consumeres purchased deals if consumer_id present as @purchased_deals" do
        me = mock_model(Consumer, user:(mock_model User, consumer:mock_model(Consumer)))
        other_user = mock_model(Consumer, user:(mock_model User, consumer:mock_model(Consumer)))
        deal_1 = mock_model(Deal)
        deal_2 = mock_model(Deal)

        purchased_deal = PurchasedDeal.create! consumer:me, deal:deal_1
        other_purchased_deal = PurchasedDeal.create! consumer:me, deal:deal_2
        not_my_purchased_deal = PurchasedDeal.create! consumer:other_user, deal:deal_1
        not_my_other_purchased_deal = PurchasedDeal.create! consumer:other_user, deal:deal_2
        get :index, consumer_id:me.id
        assigns(:purchased_deals).should eq([purchased_deal, other_purchased_deal])
      end
    end
  end

  describe "GET show" do
    describe "without signed in user" do
      it "requires signed in user to visit" do
        post :create, :purchased_deal => valid_attributes
        should deny_access
      end
    end
    describe "with signed in user" do
      before(:each) do
        sign_in_as mock_model(User, email:'test@test.com', consumer:mock_model(Consumer))
      end
      it "assigns the requested purchased_deal as @purchased_deal" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        get :show, :id => purchased_deal.id.to_s
        assigns(:purchased_deal).should eq(purchased_deal)
      end
    end
  end

  describe "GET new" do
    describe "without signed in user" do
      it "requires signed in user to visit" do
        post :create, :purchased_deal => valid_attributes
        should deny_access
      end
    end
    describe "with signed in user" do
      before(:each) do
        sign_in_as mock_model(User, email:'test@test.com', consumer:mock_model(Consumer))
      end
      it "assigns a new purchased_deal as @purchased_deal" do
        get :new
        assigns(:purchased_deal).should be_a_new(PurchasedDeal)
      end
    end
  end

  describe "GET edit" do
    describe "without signed in user" do
      it "requires signed in user to visit" do
        post :create, :purchased_deal => valid_attributes
        should deny_access
      end
    end
    describe "with signed in user" do
      before(:each) do
        sign_in_as mock_model(User, email:'test@test.com', consumer:mock_model(Consumer))
      end
      it "assigns the requested purchased_deal as @purchased_deal" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        get :edit, :id => purchased_deal.id.to_s
        assigns(:purchased_deal).should eq(purchased_deal)
      end
    end
  end

  describe "POST create" do
    describe "without signed in user" do
      it "requires signed in user to visit" do
        post :create, :purchased_deal => valid_attributes
        should deny_access
      end
    end
    describe "with valid params" do
      before(:each) do
        sign_in_as mock_model(User, email:'test@test.com', consumer:mock_model(Consumer))
      end

      it "creates a new PurchasedDeal" do
        expect {
          post :create, :purchased_deal => valid_attributes
        }.to change(PurchasedDeal, :count).by(1)
      end

      it "assigns a newly created purchased_deal as @purchased_deal" do
        post :create, :purchased_deal => valid_attributes
        assigns(:purchased_deal).should be_a(PurchasedDeal)
        assigns(:purchased_deal).should be_persisted
      end

      it "redirects to the created purchased_deal" do
        post :create, :purchased_deal => valid_attributes
        #response.should redirect_to(PurchasedDeal.last)
        response.should redirect_to(purchased_deals_thanks_for_purchasing_path)
      end
    end

    describe "with invalid params" do
      before(:each) do
        sign_in_as mock_model(User, email:'test@test.com', consumer:mock_model(Consumer))
      end
      it "assigns a newly created but unsaved purchased_deal as @purchased_deal" do
        # Trigger the behavior that occurs when invalid params are submitted
        PurchasedDeal.any_instance.stub(:save).and_return(false)
        post :create, :purchased_deal => {}
        assigns(:purchased_deal).should be_a_new(PurchasedDeal)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PurchasedDeal.any_instance.stub(:save).and_return(false)
        post :create, :purchased_deal => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "without signed in user" do
      it "requires signed in user to visit" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        put :update, :id => purchased_deal.id, :purchased_deal => valid_attributes
        should deny_access
      end
    end
    describe "with valid params" do
      before(:each) do
        sign_in_as mock_model(User, email:'test@test.com', consumer:mock_model(Consumer))
      end
      it "updates the requested purchased_deal" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        # Assuming there are no other purchased_deals in the database, this
        # specifies that the PurchasedDeal created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PurchasedDeal.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => purchased_deal.id, :purchased_deal => {'these' => 'params'}
      end

      it "assigns the requested purchased_deal as @purchased_deal" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        put :update, :id => purchased_deal.id, :purchased_deal => valid_attributes
        assigns(:purchased_deal).should eq(purchased_deal)
      end

      it "redirects to the purchased_deal" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        put :update, :id => purchased_deal.id, :purchased_deal => valid_attributes
        response.should redirect_to(purchased_deal)
      end
    end

    describe "with invalid params" do
      before(:each) do
        sign_in_as mock_model(User, email:'test@test.com', consumer:mock_model(Consumer))
      end
      it "assigns the purchased_deal as @purchased_deal" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PurchasedDeal.any_instance.stub(:save).and_return(false)
        put :update, :id => purchased_deal.id.to_s, :purchased_deal => {}
        assigns(:purchased_deal).should eq(purchased_deal)
      end

      it "re-renders the 'edit' template" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PurchasedDeal.any_instance.stub(:save).and_return(false)
        put :update, :id => purchased_deal.id.to_s, :purchased_deal => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    describe "without signed in user" do
      it "requires signed in user to visit" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        delete :destroy, :id => purchased_deal.id.to_s
        should deny_access
      end
    end
    describe "with a signed in user" do
      before(:each) do
        sign_in_as mock_model(User, email:'test@test.com', consumer:mock_model(Consumer))
      end
      it "destroys the requested purchased_deal" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        expect {
          delete :destroy, :id => purchased_deal.id.to_s
        }.to change(PurchasedDeal, :count).by(-1)
      end

      it "redirects to the purchased_deals list" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        delete :destroy, :id => purchased_deal.id.to_s
        response.should redirect_to(purchased_deals_url)
      end
    end
  end

  describe "PUT redeem" do
    describe "without signed in user" do
      it "requires signed in user to visit" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        put :redeem, :identifier => purchased_deal.id, :purchased_deal => valid_attributes
        should deny_access
      end
    end
    describe "with valid params" do
      before(:each) do
        sign_in_as mock_model(User, email:'test@test.com', consumer:mock_model(Consumer))
      end
      it "updates the requested purchased_deal" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        #PurchasedDeal.any_instance.should_receive(:update_attributes).with({'redeem' => 1})
        request.env["HTTP_REFERER"] = purchased_deal_url(purchased_deal)
        put :redeem, :identifier => purchased_deal.identifier, :purchased_deal => {'redeem' => '1'}
      end

      it "assigns the requested purchased_deal as @purchased_deal" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        request.env["HTTP_REFERER"] = purchased_deal_url(purchased_deal)
        put :redeem, :purchased_deal => {'identifier'=>purchased_deal.identifier, 'redeem'=>'1'}
        assigns(:purchased_deal).redeemed_at.should_not be_nil
      end

      it "redirects to the purchased_deal" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        request.env["HTTP_REFERER"] = purchased_deal_url(purchased_deal)
        put :redeem, :purchased_deal => {'identifier'=>purchased_deal.identifier, 'redeem'=>'1'}
        response.should redirect_to(:back)
      end

      it "alerts when a deal is redeemed twice" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        purchased_deal.redeem=true
        purchased_deal.save
        request.env["HTTP_REFERER"] = purchased_deal_url(purchased_deal)
        put :redeem, :purchased_deal => {'identifier'=>purchased_deal.identifier, 'redeem'=>'1'}
        flash[:alert].should_not be_nil
      end
    end

    describe "with invalid params" do
      before(:each) do
        sign_in_as mock_model(User, email:'test@test.com', consumer:mock_model(Consumer))
      end

      it "re-renders the 'edit' template" do
        purchased_deal = PurchasedDeal.create! valid_attributes
        request.env["HTTP_REFERER"] = purchased_deal_url(purchased_deal)
        put :redeem, :purchased_deal=>{:identifier => '0'}
        response.should redirect_to(:back)
      end
    end
  end


end
