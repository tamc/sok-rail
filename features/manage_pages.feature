Feature: Manage pages
  In order to create a useful wiki system, we need to be able to create, update and destroy wiki pages
  
  Scenario: Add a new wiki page to the system
    Given I am signed in as "test@test.site"
    And I create a page titled "Home Page" containing "Hello world!"
    Then there should be a page with title "Home Page" and content "Hello world!"
    Then I should be on the "Home Page" page