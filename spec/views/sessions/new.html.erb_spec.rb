require 'spec_helper'

describe "sessions/new.html.erb" do
  before(:each) do
    assign(:session, stub_model(Session,
      :email => "MyString",
      :password => "MyString"
    ).as_new_record)
  end

  it "renders new session form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sessions_path, :method => "post" do
      assert_select "input#session_email", :name => "session[email]"
      assert_select "input#session_password", :name => "session[password]"
    end
  end
end
