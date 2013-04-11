Feature: Viewer visits the Home Page
  In order to read the page
  As a viewer
  I want to see the home page of my app

Scenario: Find about block on the home page
	Given I am on the home page
	Then I should see "Copyright &copy Larry Price 2013" within a div tag with id "about-body"

Scenario: Find search text on the home page
  Given I am on the home page
  Then I should see "Start typing to search for your Pokémon." within a div tag with id "search"
Scenario: Find typeahead on the home page
  Given I am on the home page
  Then I should see an input with a "typeahead" dataprovide
Scenario: Type data into typeahead input on the home page
	Given I am on the home page
	When I fill in "pokemon-input" with "Pidgey"
	And I click the "Search" button
	Then I should be on the "search" page
  And I should see an image with source "http://img.pokemondb.net/artwork/pidgey.jpg"
  And I should see "#016 - Pidgey" within a div tag with id "pokemon-info"
  And I should see "Types: Normal, Flying" within a div tag with id "pokemon-info"
  And I should see "Immune Against: Ghost, Ground" within a div tag with id "pokemon-info"
  And I should see "Good Defensively Against: Grass, Bug" within a div tag with id "pokemon-info"
  And I should see "Poor Defensively Against: Electric, Ice, Rock" within a div tag with id "pokemon-info"
Scenario: Type garbage data into typeahead input on the home page
  Given I am on the home page
  When I fill in "pokemon-input" with "bubbasaur"
  And I click the "Search" button
  Then I should be on the "search" page
  And I should see an image with source "/img/girkachu.png"
  And I should see "I don't recognize the Pokémon 'bubbasaur.'" within a div tag with id "gir-image"
  And I should see "Did you mean 'Bulbasaur?'" within a div tag with id "gir-image"