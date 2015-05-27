Feature: detail each room
  
Background: course in database
  
  Given the following course exist
  | cname  | rname   | day    | time        |
  | CN202  | ENGR201 | Monday | 09.30-11.00  |
  | CN320  | ENGR316 | Monday | 13.30-15.00 |
  | CN340  | ENGR507 | Tuesday| 11.00-12.30 |
  
  Given the following room exist
  | name    | building | tools                | capacity |
  | ENGR201 | ENGR     | projector whiteboard |  50      |
  | ENGR316 | ENGR     | projector whiteboard |  50      |
  | ENGR507 | ENGR     | projector whiteboard |  50      |

Scenario: detail room should render page
 When I go to the show_room page
 And I press "Detail_ENGR316"
 Then I should be on the detail_room page
 
Scenario: detail room
 When I go to the show_room page
 And I press "Detail_ENGR316"
 Then I should see "CN320"