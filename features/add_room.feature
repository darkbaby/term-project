Feature: add room by admin

  #As a movie buff
  #So that I can find movies with my favorite director
  #I want to include and serach on director information in movies I enter
  
Background: rooms in database

  Given the following rooms exist:
  | name    | building | tools                | capacity |
  | ENGR315 | ENGR     | projector whiteboard |  50      |
  | ENGR316 | ENGR     | projector whiteboard |  50      |
  | ENGR317 | ENGR     | projector whiteboard |  50      |

Scenario: add room to database
  When I go to the add_roomform page 
  And  I fill in "Room Name" with "ENGR602-2"
  And  I fill in "Building" with "ENGR"
  And  I fill in "Tools" with "projector whiteboard"
  And  I fill in "Capacity" with "200"
  When I press "Submit"
  And  I should see "ENGR602-2"
  
Scenario: don't add room to database
  When I go to the add_roomform page
  And  I fill in "Room Name" with "ENGR602-3"
  And  I fill in "Building" with "ENGR"
  And  I fill in "Tools" with "projector whiteboard"
  And  I fill in "Capacity" with "200"
  When I follow "Back"
  And  I should not see "ENGR602-3"