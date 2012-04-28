Feature: Comparing high card hands

  Scenario: Comparing simple low hands
    Given player1 has a high card hand with 8 as the high card
    And player2 has a high card hand with 9 as the high card
    Then player2 is the winner
    
