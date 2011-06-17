Given /^I create a page titled "([^"]*)" containing "([^"]*)"$/ do |title, content|
  visit path_to("the new page page")
  fill_in 'page_title', :with => title
  fill_in 'page_content', :with => content
  click_button 'Create Page'
end

Then /^there should be a page with title "([^"]*)" and content "([^"]*)"$/ do |title, content|
  page = Page.first(:title => title)
  page.should_not be_nil
  page.content.should == content
end
