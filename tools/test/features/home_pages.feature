Feature: Viewer visits the Home Page
  In order to read the page
  As a viewer
  I want to see the home page of my app

Scenario: Find about block on the home page
	Given I am on the home page
	Then I should see "Copyright &copy Larry Price 2012" within a div tag with id "about-body"

Scenario: Find search text on the home page
  Given I am on the home page
  Then I should see "Start typing to search for your Pokemon." within a div tag with id "search"
Scenario: Find typeahead on the home page
  Given I am on the home page
  Then I should see an input with a "typeahead" dataprovide
Scenario: Type data into typeahead input
	Given I am on the home page
	When I fill in "pokemon-input" with "Bulbasaur"
	And I click the "Search" button
	Then I should be on the "search" page