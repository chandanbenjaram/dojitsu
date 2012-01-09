require 'spec_helper'

describe MessagesController do
  include Devise::TestHelpers
 
 def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
 end

  before(:each) do
      # mock up an authentication in the underlying warden library
      request.env['warden'] = mock(Warden, :authenticate => mock_user,
                                           :authenticate! => mock_user)
  end
  
  describe "Post 'storemessage" do
    
      before do
        @aMessage = {"messageDetails"=>{
            "recipients"=>["100003135115833", "100003174704960", "100000974421554", "100003276706127", "100000018823471", "100002573213371"],
            "thread_id"=>"291827220867616",
            "name"=>"social challenges testing",
            "body"=>"hi, how is going",
            "author_id"=>"100002573213371"} 
          }
      end

     it "should create message 'storemessage;" do
        expect {
          @aMessage.stub!(:save).and_return(true)
          post :storemessage, @aMessage
        }.to_not raise_error(ActionView::MissingTemplate)
      end
      
     it "should render 404 page if template does not exist" do
      expect {
        post :storemessage, :page => 'does_not_exist'
      }.to_not raise_error(ActionView::MissingTemplate)
      
    end
  end
  
  describe "GET 'message" do
    it "should be successful" do
      get :message
      response.should be_success
    end
  end

end
