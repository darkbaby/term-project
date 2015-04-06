Feature: add course by admin
  
Background: course in database
  
  Given the following course exist
  | cname  | rname    | day    | time          |
  | cn202  | ENGR 201 | Monday | '9.30-11.00'  |
  | cn320  | ENGR 316 | Monday | '13.30-16.30' |
  | cn340  | ENGR 315 | Tuesday| '9.30-12.30'  |

Scenario: add course to database
  When I go to the add_courseform page 
  And  I fill in "Course" with "cn301"
  And  I fill in "Room Name" with "ENGR316"
  And  I select "Wednesday" from "Day"
  And  I select "9.30-11.00" from "Time"
  When I press "Submit"
  And  I should see "successfully"
  
Scenario: course name blank
  When I go to the add_courseform page 
  And  I fill in "Course" with ""
  And  I fill in "Room Name" with "ENGR316"
  And  I select "Wednesday" from "Day"
  And  I select "9.30-11.00" from "Time"
  When I press "Submit"
  And  I should see "can't be blank"