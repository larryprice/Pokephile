Given /^I am on the home page$/ do
  visit "/"
end
Then /^I should see "([^"]*)" in the selector "([^"]*)"$/ do |text, selector|
  page.should have_selector selector, text: text
end
Then /^I should see "([^"]*)" within a div tag with id "([^"]*)"$/ do |text, selector|
	find(:xpath, "//div[@id='#{selector}']").should have_content text
end
