require 'spec_helper'

describe "validatiions/edit.html.slim" do
  before(:each) do
    @validatiion = assign(:validatiion, stub_model(Validatiion,
      :name => "MyString",
      :phone => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit validatiion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => validatiions_path(@validatiion), :method => "post" do
      assert_select "input#validatiion_name", :name => "validatiion[name]"
      assert_select "input#validatiion_phone", :name => "validatiion[phone]"
      assert_select "input#validatiion_email", :name => "validatiion[email]"
    end
  end
end
