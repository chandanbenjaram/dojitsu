require 'spec_helper'

describe ChallengesController do
 
  describe "GET 'index'" do
    render_views
    before do
      @challenge = Factory(:challenge)
    end
    
    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have the right title" do
      get :index
      response.should have_selector("title", :content => "Challenges")
    end
  end
  
  describe "GET 'show_per" do
    before do
      @challenge = Factory(:challenge)
    end
    
    it "should be successful" do
      get :show_per, :id => @challenge.id
      response.should be_success
    end
    
    it "should load all challenge" do
      get :show_per, :id => @challenge.id
      assigns[:challenge].should == @challenge
    end
    
    it "should redirect to 'show_per' page " do
      get :show_per, :id =>@challenge.id
      response.should render_template('show_per')
    end
  end
  
  describe "GET 'show_soc'" do
    before do
      @challenge = Factory(:challenge)
      get :show_soc, :id => @challenge.id
    end
    
    it "should load right challenge" do
      get :show_soc, :id =>@challenge.id
      assigns[:challenge].should == @challenge
    end
    
    it "should redirect to 'show_soc' page " do
      get :show_soc, :id =>@challenge.id
      response.should render_template('show_soc')
    end
  end
  
  describe "GET 'new' challenge page" do
    it "should load new challenge creation page" do
      get :new
    end
    
    it "should to load new challenge object" do
      get :new
      assigns[:challenge].should_not be_nil
      assigns[:challenge].should be_kind_of(Challenge)
      assigns[:challenge].should be_new_record
    end 
  end
  
  describe "POST 'create'" do
    context "when successsful" do
      before do
        @challenge_params = {"challenge"=>{"title"=>"testing",
           "description"=>"desc",
           "task_attributes"=>[{"score_by"=>"Check box:1 for checking off the task",
           "score"=>"12",
           "name"=>"task no 1"}],
           "canCompleteBeforeTasks"=>"1"},
           "start_point_type"=>"startPointDate",
           "start_point_value"=>"01/06/2012",
           "end_point_type"=>"endPointDate",
           "end_point_value"=>"01/21/2012",
           "soc_who_win"=>"Highest number of points",
           "soc_how_many_winner"=>"1",
           "myvar"=>"0",
           "invitees"=>"",
           "per_who_win"=>"",
           "commit"=>"DONE"}
      end
      it "should redirect to 'index' page" do
        @challenge_params.stub!(:save).and_return(true)
        post :create, :challenge => @challenge_params
        response.should redirect_to(challenges_path)
      end
      it "should assign a @challenge variable" do
        post :create, @challenge_params
        assigns[:challenge].should_not be_nil
        assigns[:challenge].should be_kind_of(Challenge)
      end
    end
  end
  
end
