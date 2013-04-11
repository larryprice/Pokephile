Feature: Viewer searches for a Pokemon
  In order to read the information
  As a viewer
  I want to see the search results

Scenario: Find about block on the search page
	Given I am on the search page
	Then I should see "Copyright &copy Larry Price 2013" within a div tag with id "about-body"

Scenario: Find search text on the search page
  Given I am on the search page
  Then I should see "Search for another Pokémon." within a div tag with id "search"
Scenario: Find typeahead on the search page
  Given I am on the search page
  Then I should see an input with a "typeahead" dataprovide
Scenario: Type valid data into typeahead input on the search page
	Given I am on the search page
	When I fill in "pokemon-input" with "Pidgey"
	And I click the "Search" button
	Then I should be on the "search" page
	And I should see an image with source "http://img.pokemondb.net/artwork/pidgey.jpg"
  And I should see "#016 - Pidgey" within a div tag with id "pokemon-info"
  And I should see "Types: Normal, Flying" within a div tag with id "pokemon-info"
  And I should see "Immune Against: Ghost, Ground" within a div tag with id "pokemon-info"
  And I should see "Good Defensively Against: Grass, Bug" within a div tag with id "pokemon-info"
  And I should see "Poor Defensively Against: Electric, Ice, Rock" within a div tag with id "pokemon-info"
Scenario: Type garbage data into typeahead input on the search page
  Given I am on the search page
  When I fill in "pokemon-input" with "bubbasaur"
  And I click the "Search" button
  Then I should be on the "search" page
  And I should see an image with source "/img/girkachu.png"
  And I should see "I don't recognize the Pokémon 'bubbasaur.'" within a div tag with id "gir-image"
  And I should see "Did you mean 'Bulbasaur?'" within a div tag with id "gir-image"

Scenario: See Pokemon image on the search page
	Given I am on the search page having typed "Pidgey"
	Then I should see an image with source "http://img.pokemondb.net/artwork/pidgey.jpg"
  And I should see "#016 - Pidgey" within a div tag with id "pokemon-info"
  And I should see "Types: Normal, Flying" within a div tag with id "pokemon-info"
  And I should see "Immune Against: Ghost, Ground" within a div tag with id "pokemon-info"
  And I should see "Good Defensively Against: Grass, Bug" within a div tag with id "pokemon-info"
  And I should see "Poor Defensively Against: Electric, Ice, Rock" within a div tag with id "pokemon-info"
Scenario: See garbage image on the search page
	Given I am on the search page having typed "bubbasaur"
	Then I should see an image with source "/img/girkachu.png"
  And I should see "I don't recognize the Pokémon 'bubbasaur.'" within a div tag with id "gir-image"
  And I should see "Did you mean 'Bulbasaur?'" within a div tag with id "gir-image"