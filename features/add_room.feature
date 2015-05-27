Feature: add room by admin

  #As a movie buff
  #So that I can find movies with my favorite director
  #I want to include and serach on director information in movies I enter
  
Background: room in database

  Given the following room exist:
  | name    | building | tools                | capacity |
  | ENGR315 | ENGR     | projector whiteboard |  50      |
  | ENGR316 | ENGR     | projector whiteboard |  50      |
  | ENGR317 | ENGR     | projector whiteboard |  50      |
  
Scenario: show course should render page
  When I go to the show_room page
  Then I should see "ENGR317"
  
Scenario: add room to database
  Given I am logged in as "admin"
  When I go to the add_roomform page 
  And  I fill in "Room Name" with "ENGR602"
  And  I fill in "Building" with "ENGR"
  And  I fill in "Tools" with "projector whiteboard"
  And  I fill in "Capacity" with "200"
  When I press "Submit"
  And  I should see "successfully"
  
Scenario: room name blank
  Given I am logged in as "admin"
  When I go to the add_roomform page
  And  I fill in "Room Name" with ""
  And  I fill in "Building" with "ENGR"
  And  I fill in "Tools" with "projector whiteboard"
  And  I fill in "Capacity" with "60"
  When I press "Submit"
  And  I should see "can't be blank"
  
Scenario: building blank
  Given I am logged in as "admin"
  When I go to the add_roomform page
  And  I fill in "Room Name" with "ENGR203"
  And  I fill in "Building" with ""
  And  I fill in "Tools" with "projector whiteboard"
  And  I fill in "Capacity" with "60"
  When I press "Submit"
  And  I should see "can't be blank"
  

Scenario: capacity not a number
  Given I am logged in as "admin"
  When I go to the add_roomform page
  And  I fill in "Room Name" with "ENGR602-4"
  And  I fill in "Building" with "ENGR"
  And  I fill in "Tools" with "projector whiteboard"
  And  I fill in "Capacity" with "sixty"
  When I press "Submit"
  And  I should see "is not a number"


Scenario: delete room
 Given I am logged in as "admin"
 When I go to the show_room page
 And I press "Delete_ENGR315"
 Then I should see "Room 'ENGR315' deleted."
 

Scenario: edit room
 Given I am logged in as "admin"
 When I go to the show_room page
 And I press "Edit_ENGR317"
 And  I fill in "Room Name" with "ENGR311"
 When I press "Submit"
 Then I should see "ENGR311"
 
Scenario: edit room (bad path)
 Given I am logged in as "admin"
 When I go to the show_room page
 And I press "Edit_ENGR317"
 And  I fill in "Room Name" with ""
 When I press "Submit"
 Then I should see "can't be blank"