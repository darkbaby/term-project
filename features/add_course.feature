Feature: add course by admin
  
Background: course in database
  
  Given the following course exist
  | cname  | rname   | day    | time        |
  | cn202  | ENGR201 | Monday | 09.30-11.00 |
  | cn320  | ENGR316 | Monday | 15.00-16.30 |
  | cn555  | ENGR317 | Monday | 11.00-12.30 |
  | cn340  | ENGR507 | Tuesday| 11.00-12.30 |
  | cn777  | ENGR316 | Monday | 09.30-11.00 |
  
  Given the following room exist
  | name    | building | tools                | capacity |
  | ENGR201 | ENGR     | projector whiteboard |  50      |
  | ENGR316 | ENGR     | projector whiteboard |  50      |
  | ENGR507 | ENGR     | projector whiteboard |  50      |
  | ENGR317 | ENGR     | projector whiteboard |  50      |

Scenario: add course to database
  Given I am logged in as "admin"
  When I go to the add_courseform page 
  And  I fill in "Course" with "cn301"
  And  I select "ENGR507" from "Room Name"
  And  I select "Wednesday" from "Day"
  And  I select "08.00-09.30" from "Time"
  When I press "Submit"
  And  I should see "successfully"
  
Scenario: course name blank
  Given I am logged in as "admin"
  When I go to the add_courseform page 
  And  I fill in "Course" with ""
  And  I select "ENGR316" from "Room Name"
  And  I select "Wednesday" from "Day"
  And  I select "09.30-11.00" from "Time"
  When I press "Submit"
  And  I should see "can't be blank"
  
Scenario: course time overlap
  Given I am logged in as "admin"
  When I go to the add_courseform page 
  And  I fill in "Course" with "cn302"
  And  I select "ENGR316" from "Room Name"
  And  I select "Monday" from "Day"
  And  I select "13.30-16.30" from "Time"
  When I press "Submit"
  And  I should see "u can't add this Course"
  
Scenario: course time overlap second
  Given I am logged in as "admin"
  When I go to the add_courseform page 
  And  I fill in "Course" with "cn303"
  And  I select "ENGR316" from "Room Name"
  And  I select "Monday" from "Day"
  And  I select "09.30-12.30" from "Time"
  When I press "Submit"
  And  I should see "u can't add this Course"
  
Scenario: show course should render page
  When I go to the show_course page
  Then I should see "cn340"
  
Scenario: delete course 
 Given I am logged in as "admin"
 When I go to the show_course page
 And I press "Delete_cn202"
 Then I should see "Course 'cn202' deleted."
 