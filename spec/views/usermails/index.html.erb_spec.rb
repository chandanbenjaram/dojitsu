require 'spec_helper'

describe "usermails/index.html.erb" do
  before(:each) do
    assign(:usermails, [
      stub_model(Usermail,
        :email => "Email"
      ),
      stub_model(Usermail,
        :email => "Email"
      )
    ])
  end

  it "renders a list of usermails" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
