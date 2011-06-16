Feature: Manage sessions
  In order to allow users to log in and out
  users
  wants to be able to sign in with their email and a password
  
  Scenario: Start a new session
    Given I go to the new session page
    And I sign in with email "tom@test.fake" and password "password"
    Then I should be on the home page
