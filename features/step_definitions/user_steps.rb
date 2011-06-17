Given /^I sign up with email "([^"]*)", password "([^"]*)" and password confirmation "([^"]*)"$/ do |email, password,password_confirmation|
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => password
  fill_in 'user_password_confirmation', :with => password_confirmation
  click_button 'Create User'
end

Then /^there should be a user with email "([^"]*)"$/i do |email|
  @user = User.first(:email => email)
  @user.should_not be_nil
end

