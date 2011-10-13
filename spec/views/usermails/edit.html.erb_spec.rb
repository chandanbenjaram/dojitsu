require 'spec_helper'

describe "usermails/edit.html.erb" do
  before(:each) do
    @usermail = assign(:usermail, stub_model(Usermail,
      :email => "MyString"
    ))
  end

  it "renders the edit usermail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => usermails_path(@usermail), :method => "post" do
      assert_select "input#usermail_email", :name => "usermail[email]"
    end
  end
end
