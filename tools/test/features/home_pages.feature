Feature: Viewer visits the Home Page
  In order to read the page
  As a viewer
  I want to see the home page of my app
Scenario: Find body on home page
  Given I am on the home page
  Then I should see "Start typing to begin searching for your Pokemon." within a div tag with id "search"
Scenario: Find about block on the home page
	Given I am on the home page
	Then I should see "Copyright (C) Larry Price 2012" within a div tag with id "about-body"