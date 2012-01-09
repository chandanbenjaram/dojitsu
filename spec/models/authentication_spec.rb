require 'spec_helper'

describe Authentication do
 it "should have a user" do
      should belong_to(:user) 
  end          
end
