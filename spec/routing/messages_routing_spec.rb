require "spec_helper"

describe MessagesController do
  describe "routing" do

    it "Shoud route to MESSAGES controller STOREMESSAGE action" do
      { :get=> "/messages/storemessage"}.should route_to(:controller => 'messages', :action => 'storemessage')
    end
    
    it "Should route to MESSAGES controller MESSAGE action" do
      { :get =>"/messages/message"}.should route_to(:controller => 'messages', :action => 'message')
    end
    
    it "should route to MESSAGES controller NEWMESSAGE action" do
      { :get =>"/messages/newmessage"}.should route_to(:controller => 'messages', :action => 'newmessage')
    end
    
    it "should route to MESSAGES controller individualAllMessage action" do
      { :get =>"/messages/individualAllMessage"}.should route_to(:controller => 'messages', :action => 'individualAllMessage')
    end

  end
end
