Feature: Manage sessions
  In order to keep track of who is doing what we need to allow people to log in and out
  
  Scenario: Trying to go to any page but the new session page sends you to the new session page
    Given Nobody is signed in
    When I go to the home page
    Then I should be on the new session page
  
  Scenario: New arrival, without an account
    Given I go to the new session page
    When I follow "Sign up"
    Then I should be on the new user page
  
  Scenario: Start a new session on a brand new wiki
    Given I go to the new session page
    And There is a confirmed user with email "tom@test.fake" and password "password"
    And I sign in with email "tom@test.fake" and password "password"
    Then the signed in user should be "tom@test.fake"
    Then I should be on the new page page

