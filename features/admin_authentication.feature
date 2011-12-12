Feature: Admin Authentication

The authentication process should allow users to login and logout and should persist a UserSession

 Scenario: Open the admin homepage or login page
  Given I am on the admin homepage
  And I am not logged in

 Scenario: Logging In from the Login Page
  Given I am the user "admin"
  When I Log In
  Then there should be a session
  And the user should be "admin"