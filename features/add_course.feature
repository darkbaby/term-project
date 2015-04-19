Feature: add course by admin
  
Background: course in database
  
  Given the following course exist
  | cname  | rname   | day    | time          |
  | cn202  | ENGR201 | Monday | '9.30-11.00'  |
  | cn320  | ENGR316 | Monday | '13.30-15.00' |
  | cn340  | ENGR507 | Tuesday| '11.00-12.30' |
  
  Given the following room exist
  | name    | building | tools                | capacity |
  | ENGR201 | ENGR     | projector whiteboard |  50      |
  | ENGR316 | ENGR     | projector whiteboard |  50      |
  | ENGR507 | ENGR     | projector whiteboard |  50      |

Scenario: add course to database
  When I go to the add_courseform page 
  And  I fill in "Course" with "cn301"
  And  I select "ENGR507" from "Room Name"
  And  I select "Wednesday" from "Day"
  And  I select "9.30-11.00" from "Time"
  When I press "Submit"
  And  I should see "successfully"
  
Scenario: course name blank
  When I go to the add_courseform page 
  And  I fill in "Course" with ""
  And  I select "ENGR316" from "Room Name"
  And  I select "Wednesday" from "Day"
  And  I select "9.30-11.00" from "Time"
  When I press "Submit"
  And  I should see "can't be blank" 
  
Scenario: delete course 
 When I go to the show_course page
 And I press "Delete_cn202"
 Then I should see "Course 'cn202' deleted."
 