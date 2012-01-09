require 'spec_helper'

describe ChallengesController do
  include Devise::TestHelpers
  render_views
  
  context "when user signed in" do
    
    before do
      @Challenge = Factory(:challenge)
    end
    
    describe "GET 'index'" do
      it "should be successful" do
        get :index
        response.should be_success
      end
      
      it "should have the right title" do
        get :index
        response.should have_selector("title", :content => "Users")
      end
    end
    
    describe "GET 'show_soc'" do
      
      before do
        get :show_soc
      end
      
      it "should have the right title" do
        get :show_soc
        response.should have_selector("title", :content => "Dojitsu")
      end
      
    end
    
    describe "GET 'show_per'" do
      
      before do
        get :show_per
      end
      
      it "should have the right title" do
        get :show_per
        response.should have_selector("title", :content => "Dojitsu")
      end
      
    end
    
    describe "GET 'show'" do
      
      before do
        get :show
      end
      
      it "should have the right title" do
        get :show
        response.should have_selector("title", :content => "Dojitsu")
      end
      
      it 'should load that challenge' do
        assigns[:challenge].should == @challenge
      end
      
    end
    
    describe "GET 'new'" do
      before do
        get :new
      end
      
      it "should have the right title" do
        get :new
        response.should have_selector("title", :content => "Dojitsu")
      end
    end
    
  end
  
  
  

end
