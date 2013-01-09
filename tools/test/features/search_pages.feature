Feature: Viewer searches for a Pokemon
  In order to read the information
  As a viewer
  I want to see the search results

Scenario: Find about block on the search page
	Given I am on the search page
	Then I should see "Copyright &copy Larry Price 2013" within a div tag with id "about-body"

Scenario: Find search text on the search page
  Given I am on the search page
  Then I should see "Search for another Pokemon." within a div tag with id "search"
Scenario: Find typeahead on the search page
  Given I am on the search page
  Then I should see an input with a "typeahead" dataprovide
Scenario: Type data into typeahead input
	Given I am on the search page
	When I fill in "pokemon-input" with "Bulbasaur"
	And I click the "Search" button
	Then I should be on the "search" page
	And I should see an image with source "http://img.pokemondb.net/artwork/bulbasaur.jpg"
Scenario: Type garbage data into typeahead input on the search page
  Given I am on the search page
  When I fill in "pokemon-input" with "bubbasaur"
  And I click the "Search" button
  Then I should be on the "search" page
  And I should see an image with source "images/girkachu.png"
  And I should see "I don't recognize the Pokemon 'bubbasaur.'" within a div tag with id "gir-image"
  And I should see "Did you mean 'Bulbasaur?'" within a div tag with id "gir-image"

Scenario: See Pokemon image on the search page
	Given I am on the search page having typed "Bulbasaur"
	Then I should see an image with source "http://img.pokemondb.net/artwork/bulbasaur.jpg"
Scenario: See garbage image on the search page
	Given I am on the search page having typed "bubbasaur"
	Then I should see an image with source "images/girkachu.png"
  And I should see "I don't recognize the Pokemon 'bubbasaur.'" within a div tag with id "gir-image"
  And I should see "Did you mean 'Bulbasaur?'" within a div tag with id "gir-image"