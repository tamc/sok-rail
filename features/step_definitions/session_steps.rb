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
  email = email
  password = "password"
  @user = User.create!(:email => email, :password => password, :password_confirmation => password)
  User.current = @user
end



# Given /^the following sessions:$/ do |sessions|
#   Session.create!(sessions.hashes)
# end
# 
# When /^I delete the (\d+)(?:st|nd|rd|th) session$/ do |pos|
#   visit sessions_path
#   within("table tr:nth-child(#{pos.to_i+1})") do
#     click_link "Destroy"
#   end
# end
# 
# Then /^I should see the following sessions:$/ do |expected_sessions_table|
#   expected_sessions_table.diff!(tableish('table tr', 'td,th'))
# end
