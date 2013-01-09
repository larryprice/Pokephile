Feature: Viewer visits the Home Page
  In order to read the page
  As a viewer
  I want to see the home page of my app

Scenario: Find about block on the home page
	Given I am on the home page
	Then I should see "Copyright &copy Larry Price 2013" within a div tag with id "about-body"

Scenario: Find search text on the home page
  Given I am on the home page
  Then I should see "Start typing to search for your Pokemon." within a div tag with id "search"
Scenario: Find typeahead on the home page
  Given I am on the home page
  Then I should see an input with a "typeahead" dataprovide
Scenario: Type data into typeahead input on the home page
	Given I am on the home page
	When I fill in "pokemon-input" with "Bulbasaur"
	And I click the "Search" button
	Then I should be on the "search" page
  And I should see an image with source "http://img.pokemondb.net/artwork/bulbasaur.jpg"
Scenario: Type garbage data into typeahead input on the home page
  Given I am on the home page
  When I fill in "pokemon-input" with "bubbasaur"
  And I click the "Search" button
  Then I should be on the "search" page
  And I should see an image with source "images/girkachu.png"
  And I should see "I don't recognize the Pokemon 'bubbasaur.'" within a div tag with id "gir-image"
  And I should see "Did you mean 'Bulbasaur?'" within a div tag with id "gir-image"