Feature: Viewer searches for a Pokemon
  In order to read the information
  As a viewer
  I want to see the search results

Scenario: Find about block on the search page
	Given I am on the search page
	Then I should see "Copyright (C) Larry Price 2012" within a div tag with id "about-body"

Scenario: Find search text on the search page
  Given I am on the search page
  Then I should see "Search for another Pokemon." within a div tag with id "search-bottom"
Scenario: Find typeahead on the search page
  Given I am on the search page
  Then I should see an input with a "typeahead" dataprovide
Scenario: Type data into typeahead input
	Given I am on the search page
	When I fill in "pokemon-input" with "Bulbasaur"
	And I click the "Search" button
	Then I should be on the "search" page

Scenario: See Pokemon image on the search page
	Given I am on the search page having typed "Bulbasaur"
	Then I should see an image with source "http://img.pokemondb.net/artwork/bulbasaur.jpg"