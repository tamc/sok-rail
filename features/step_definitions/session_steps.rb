Given /^I sign in with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  fill_in 'session_email', :with => email
  fill_in 'session_password', :with => password
  click_button 'Log in'
end

Given /^There is a confirmed user with email "([^"]*)" and password "([^"]*)"$/ do |email,password|
  @user = User.create!(:email => email, :password => password, :password_confirmation => password)
end

Then /^the signed in user should be "([^"]*)"$/ do |email|
  user = User.first(:email => email)
  user.should_not be_nil
  User.current.should == user
end

Given /^Nobody is signed in$/ do
  User.current = nil
end

Given /^I am signed in as "([^"]*)"$/ do |email|
  Then %Q{There is a confirmed user with email "#{email}" and password "password"}
  Then %Q{I go to the new session page}
  Then %Q{I sign in with email "#{email}" and password "password"}
end