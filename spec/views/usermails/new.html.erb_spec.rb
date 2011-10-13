require 'spec_helper'

describe "usermails/new.html.erb" do
  before(:each) do
    assign(:usermail, stub_model(Usermail,
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new usermail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => usermails_path, :method => "post" do
      assert_select "input#usermail_email", :name => "usermail[email]"
    end
  end
end
