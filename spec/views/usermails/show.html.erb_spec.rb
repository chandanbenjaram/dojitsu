require 'spec_helper'

describe "usermails/show.html.erb" do
  before(:each) do
    @usermail = assign(:usermail, stub_model(Usermail,
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
  end
end
