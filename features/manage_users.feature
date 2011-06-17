Feature: Manage users
  In order to track authorship we need to track some information about people
  
  Scenario: Add a new email to the system
    Given I go to the new user page
    And I sign up with email "tom@test.fake", password "password" and password confirmation "password"
    Then there should be a user with email "tom@test.fake"
    Then I should be on the user created page