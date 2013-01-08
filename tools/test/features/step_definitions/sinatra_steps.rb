Given /^I am on the home page$/ do
  visit "/"
end
Given /^I am on the search page$/ do
	visit "/"
  click_button "Search"
end
Given /^I am on the search page having typed "(.*?)"$/ do |arg1|
  visit "/"
  fill_in("pokemon-input", :with => arg1)
  click_button "Search"
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |arg1, arg2|
	fill_in(arg1, :with => arg2)
end
When /^I click the "(.*?)" button$/ do |arg1|
  click_button arg1
end

Then /^I should see "([^"]*)" in the selector "([^"]*)"$/ do |text, selector|
  page.should have_selector selector, text: text
end
Then /^I should see "([^"]*)" within a div tag with id "([^"]*)"$/ do |text, selector|
	find(:xpath, "//div[@id='#{selector}']").should have_content text
end
Then /^I should see an input with a "([^"]*)" dataprovide$/ do |provide|
	find(:xpath, "//input[@data-provide='#{provide}']").should_not be_nil
end
Then /^I should be on the "(.*?)" page$/ do |arg1|
  current_path.should == "/#{arg1}"
end
Then /^I should see an image with source "(.*?)"$/ do |src|
  find(:xpath, "//img[@src='#{src}']").should_not be_nil
end
