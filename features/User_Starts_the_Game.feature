Feature: User starts a times table game

as a user
I want to start the times table game
so that I can learn my multiplication tables

Scenario: New user starts game
Given I am a new user
When I start the game
Then I should see the menu box
And I should be able to choose the "New User" button
And I should be able to enter my new ID

Scenario: Old user starts game
Given I am a returning user
When I start the game
Then I should see the menu box
And I should be able to choose the "Returning User" button
And I should be able to select my ID from a dropdown box
