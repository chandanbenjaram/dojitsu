require 'spec_helper'

describe "validatiions/index.html.slim" do
  before(:each) do
    assign(:validatiions, [
      stub_model(Validatiion,
        :name => "Name",
        :phone => "Phone",
        :email => "Email"
      ),
      stub_model(Validatiion,
        :name => "Name",
        :phone => "Phone",
        :email => "Email"
      )
    ])
  end

  it "renders a list of validatiions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
