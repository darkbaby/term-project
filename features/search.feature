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
  
Scenario: search room in database
  When I go to the search_form page 
  And  I fill in "Search by Room Name:" with "ENGR315"
  When I press "SEARCH"
  And  I should see "ENGR315"
  
Scenario: search room with blank text
  When I go to the search_form page 
  And  I fill in "Search by Room Name:" with ""
  When I press "SEARCH"
  Then I should be on the search_form page 