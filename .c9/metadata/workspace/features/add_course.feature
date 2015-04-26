{"changed":true,"filter":false,"title":"add_course.feature","tooltip":"/features/add_course.feature","value":"Feature: add course by admin\n  \nBackground: course in database\n  \n  Given the following course exist\n  | cname  | rname   | day    | time        |\n  | cn202  | ENGR201 | Monday | 9.30-11.00  |\n  | cn320  | ENGR316 | Monday | 13.30-15.00 |\n  | cn340  | ENGR507 | Tuesday| 11.00-12.30 |\n  \n  Given the following room exist\n  | name    | building | tools                | capacity |\n  | ENGR201 | ENGR     | projector whiteboard |  50      |\n  | ENGR316 | ENGR     | projector whiteboard |  50      |\n  | ENGR507 | ENGR     | projector whiteboard |  50      |\n\nScenario: add course to database\n  When I go to the add_courseform page \n  And  I fill in \"Course\" with \"cn301\"\n  And  I select \"ENGR507\" from \"Room Name\"\n  And  I select \"Wednesday\" from \"Day\"\n  And  I select \"9.30-11.00\" from \"Time\"\n  When I press \"Submit\"\n  And  I should see \"successfully\"\n  \nScenario: course name blank\n  When I go to the add_courseform page \n  And  I fill in \"Course\" with \"\"\n  And  I select \"ENGR316\" from \"Room Name\"\n  And  I select \"Wednesday\" from \"Day\"\n  And  I select \"9.30-11.00\" from \"Time\"\n  When I press \"Submit\"\n  And  I should see \"can't be blank\"\n  \nScenario: course time overlap\n  When I go to the add_courseform page \n  And  I fill in \"Course\" with \"cn302\"\n  And  I select \"ENGR316\" from \"Room Name\"\n  And  I select \"Monday\" from \"Day\"\n  And  I select \"13.30-15.00\" from \"Time\"\n  When I press \"Submit\"\n  And  I should see \"u can't add this Course\"\n  \nWhen I go to the show_course pagesee \"cn340\"Scenario: delete course \n When I go to the show_course page\n And I press \"Delete_cn202\"\n Then I should see \"Course 'cn202' deleted.\"\n ","undoManager":{"mark":0,"position":4,"stack":[[{"group":"doc","deltas":[{"start":{"row":34,"column":0},"end":{"row":34,"column":1},"action":"insert","lines":["ป"]},{"start":{"row":34,"column":0},"end":{"row":34,"column":1},"action":"remove","lines":["ป"]},{"start":{"row":34,"column":0},"end":{"row":34,"column":1},"action":"insert","lines":["x"]},{"start":{"row":34,"column":0},"end":{"row":34,"column":1},"action":"remove","lines":["x"]},{"start":{"row":34,"column":0},"end":{"row":34,"column":3},"action":"insert","lines":["Giv"]},{"start":{"row":34,"column":3},"end":{"row":34,"column":6},"action":"insert","lines":["en "]},{"start":{"row":34,"column":6},"end":{"row":34,"column":8},"action":"insert","lines":["I "]},{"start":{"row":34,"column":8},"end":{"row":34,"column":13},"action":"insert","lines":["am on"]},{"start":{"row":34,"column":13},"end":{"row":34,"column":14},"action":"insert","lines":[" "]},{"start":{"row":34,"column":14},"end":{"row":34,"column":16},"action":"insert","lines":["in"]},{"start":{"row":34,"column":16},"end":{"row":34,"column":19},"action":"insert","lines":["dex"]},{"start":{"row":34,"column":19},"end":{"row":34,"column":22},"action":"insert","lines":[" pa"]},{"start":{"row":34,"column":22},"end":{"row":34,"column":24},"action":"insert","lines":["ge"]},{"start":{"row":34,"column":20},"end":{"row":34,"column":24},"action":"remove","lines":["page"]},{"start":{"row":34,"column":19},"end":{"row":34,"column":20},"action":"remove","lines":[" "]},{"start":{"row":34,"column":0},"end":{"row":34,"column":19},"action":"remove","lines":["Given I am on index"]},{"start":{"row":34,"column":0},"end":{"row":34,"column":1},"action":"insert","lines":["W"]},{"start":{"row":34,"column":1},"end":{"row":34,"column":4},"action":"insert","lines":["hen"]},{"start":{"row":34,"column":4},"end":{"row":34,"column":6},"action":"insert","lines":["\"S"]},{"start":{"row":34,"column":6},"end":{"row":34,"column":9},"action":"insert","lines":["how"]},{"start":{"row":34,"column":9},"end":{"row":34,"column":11},"action":"insert","lines":[" r"]},{"start":{"row":34,"column":8},"end":{"row":34,"column":9},"action":"remove","lines":["w"]},{"start":{"row":34,"column":7},"end":{"row":34,"column":9},"action":"remove","lines":["o "]},{"start":{"row":34,"column":7},"end":{"row":34,"column":9},"action":"insert","lines":["ow"]},{"start":{"row":34,"column":9},"end":{"row":34,"column":10},"action":"remove","lines":["r"]},{"start":{"row":34,"column":9},"end":{"row":34,"column":11},"action":"insert","lines":[" C"]},{"start":{"row":34,"column":11},"end":{"row":34,"column":14},"action":"insert","lines":["our"]},{"start":{"row":34,"column":14},"end":{"row":34,"column":16},"action":"insert","lines":["se"]},{"start":{"row":34,"column":16},"end":{"row":34,"column":17},"action":"insert","lines":["\""]},{"start":{"row":34,"column":17},"end":{"row":34,"column":18},"action":"insert","lines":["c"]},{"start":{"row":34,"column":18},"end":{"row":34,"column":21},"action":"insert","lines":["oue"]},{"start":{"row":34,"column":20},"end":{"row":34,"column":21},"action":"remove","lines":["e"]},{"start":{"row":34,"column":20},"end":{"row":34,"column":21},"action":"insert","lines":["r"]},{"start":{"row":34,"column":21},"end":{"row":34,"column":23},"action":"insert","lines":["se"]},{"start":{"row":34,"column":23},"end":{"row":34,"column":26},"action":"insert","lines":[" pa"]},{"start":{"row":34,"column":26},"end":{"row":34,"column":28},"action":"insert","lines":["ge"]},{"start":{"row":34,"column":9},"end":{"row":34,"column":10},"action":"remove","lines":[" "]},{"start":{"row":34,"column":9},"end":{"row":34,"column":10},"action":"insert","lines":["_"]},{"start":{"row":34,"column":5},"end":{"row":34,"column":16},"action":"remove","lines":["Show_Course"]},{"start":{"row":34,"column":5},"end":{"row":34,"column":16},"action":"insert","lines":["Show_Course"]},{"start":{"row":34,"column":0},"end":{"row":34,"column":17},"action":"remove","lines":["When\"Show_Course\""]},{"start":{"row":34,"column":0},"end":{"row":34,"column":36},"action":"insert","lines":["When I go to the add_courseform page"]},{"start":{"row":34,"column":17},"end":{"row":34,"column":31},"action":"remove","lines":["add_courseform"]},{"start":{"row":34,"column":17},"end":{"row":34,"column":19},"action":"insert","lines":["sh"]},{"start":{"row":34,"column":19},"end":{"row":34,"column":21},"action":"insert","lines":["ow"]},{"start":{"row":34,"column":21},"end":{"row":34,"column":22},"action":"insert","lines":["_"]},{"start":{"row":34,"column":17},"end":{"row":34,"column":22},"action":"remove","lines":["show_"]},{"start":{"row":34,"column":17},"end":{"row":34,"column":28},"action":"insert","lines":["show_course"]},{"start":{"row":34,"column":42},"end":{"row":34,"column":44},"action":"remove","lines":["ge"]},{"start":{"row":34,"column":33},"end":{"row":34,"column":42},"action":"remove","lines":["course pa"]},{"start":{"row":34,"column":33},"end":{"row":34,"column":36},"action":"insert","lines":["see"]},{"start":{"row":34,"column":36},"end":{"row":34,"column":38},"action":"insert","lines":[" c"]},{"start":{"row":34,"column":38},"end":{"row":34,"column":39},"action":"insert","lines":["n"]},{"start":{"row":34,"column":39},"end":{"row":34,"column":42},"action":"insert","lines":["340"]},{"start":{"row":34,"column":38},"end":{"row":34,"column":42},"action":"remove","lines":["n340"]},{"start":{"row":34,"column":37},"end":{"row":34,"column":38},"action":"remove","lines":["c"]},{"start":{"row":34,"column":37},"end":{"row":34,"column":38},"action":"insert","lines":["\""]},{"start":{"row":34,"column":38},"end":{"row":34,"column":39},"action":"insert","lines":["c"]},{"start":{"row":34,"column":38},"end":{"row":34,"column":39},"action":"remove","lines":["c"]},{"start":{"row":34,"column":38},"end":{"row":34,"column":40},"action":"insert","lines":["cn"]},{"start":{"row":34,"column":40},"end":{"row":34,"column":43},"action":"insert","lines":["340"]},{"start":{"row":34,"column":43},"end":{"row":34,"column":44},"action":"insert","lines":["\""]},{"start":{"row":32,"column":36},"end":{"row":32,"column":37},"action":"remove","lines":[" "]},{"start":{"row":32,"column":36},"end":{"row":33,"column":2},"action":"insert","lines":["","  "]},{"start":{"row":33,"column":2},"end":{"row":34,"column":2},"action":"insert","lines":["","  "]},{"start":{"row":34,"column":2},"end":{"row":41,"column":36},"action":"insert","lines":["Scenario: course name blank","  When I go to the add_courseform page ","  And  I fill in \"Course\" with \"\"","  And  I select \"ENGR316\" from \"Room Name\"","  And  I select \"Wednesday\" from \"Day\"","  And  I select \"9.30-11.00\" from \"Time\"","  When I press \"Submit\"","  And  I should see \"can't be blank\""]},{"start":{"row":34,"column":0},"end":{"row":34,"column":2},"action":"remove","lines":["  "]},{"start":{"row":34,"column":17},"end":{"row":34,"column":27},"action":"remove","lines":["name blank"]},{"start":{"row":34,"column":17},"end":{"row":34,"column":21},"action":"insert","lines":["time"]},{"start":{"row":34,"column":21},"end":{"row":34,"column":22},"action":"insert","lines":[" "]},{"start":{"row":34,"column":22},"end":{"row":34,"column":26},"action":"insert","lines":["same"]},{"start":{"row":34,"column":26},"end":{"row":34,"column":27},"action":"insert","lines":[" "]},{"start":{"row":34,"column":27},"end":{"row":34,"column":29},"action":"insert","lines":["ad"]},{"start":{"row":34,"column":28},"end":{"row":34,"column":29},"action":"remove","lines":["d"]},{"start":{"row":34,"column":28},"end":{"row":34,"column":30},"action":"insert","lines":["s "]},{"start":{"row":34,"column":28},"end":{"row":34,"column":30},"action":"remove","lines":["s "]},{"start":{"row":34,"column":26},"end":{"row":34,"column":28},"action":"remove","lines":[" a"]},{"start":{"row":34,"column":26},"end":{"row":34,"column":31},"action":"insert","lines":[" same"]},{"start":{"row":34,"column":30},"end":{"row":34,"column":31},"action":"remove","lines":["e"]},{"start":{"row":34,"column":29},"end":{"row":34,"column":30},"action":"remove","lines":["m"]},{"start":{"row":34,"column":22},"end":{"row":34,"column":29},"action":"remove","lines":["same sa"]},{"start":{"row":34,"column":22},"end":{"row":34,"column":26},"action":"insert","lines":["นอำพ"]},{"start":{"row":34,"column":23},"end":{"row":34,"column":26},"action":"remove","lines":["อำพ"]},{"start":{"row":34,"column":23},"end":{"row":34,"column":24},"action":"insert","lines":["o"]},{"start":{"row":34,"column":22},"end":{"row":34,"column":24},"action":"remove","lines":["นo"]},{"start":{"row":34,"column":22},"end":{"row":34,"column":24},"action":"insert","lines":["ov"]},{"start":{"row":34,"column":24},"end":{"row":34,"column":28},"action":"insert","lines":["erla"]},{"start":{"row":34,"column":28},"end":{"row":34,"column":29},"action":"insert","lines":["p"]},{"start":{"row":36,"column":32},"end":{"row":36,"column":33},"action":"insert","lines":["c"]},{"start":{"row":36,"column":33},"end":{"row":36,"column":34},"action":"insert","lines":["n"]},{"start":{"row":36,"column":34},"end":{"row":36,"column":37},"action":"insert","lines":["301"]},{"start":{"row":36,"column":36},"end":{"row":36,"column":37},"action":"remove","lines":["1"]},{"start":{"row":36,"column":36},"end":{"row":36,"column":37},"action":"insert","lines":["2"]},{"start":{"row":38,"column":21},"end":{"row":38,"column":26},"action":"remove","lines":["esday"]},{"start":{"row":38,"column":17},"end":{"row":38,"column":21},"action":"remove","lines":["Wedn"]},{"start":{"row":38,"column":17},"end":{"row":38,"column":18},"action":"insert","lines":["N"]},{"start":{"row":38,"column":17},"end":{"row":38,"column":18},"action":"remove","lines":["N"]},{"start":{"row":38,"column":17},"end":{"row":38,"column":18},"action":"insert","lines":["M"]},{"start":{"row":38,"column":18},"end":{"row":38,"column":22},"action":"insert","lines":["onda"]},{"start":{"row":38,"column":22},"end":{"row":38,"column":23},"action":"insert","lines":["y"]},{"start":{"row":39,"column":17},"end":{"row":39,"column":18},"action":"remove","lines":["9"]},{"start":{"row":39,"column":17},"end":{"row":39,"column":19},"action":"insert","lines":["13"]},{"start":{"row":39,"column":24},"end":{"row":39,"column":25},"action":"remove","lines":["1"]},{"start":{"row":39,"column":24},"end":{"row":39,"column":25},"action":"insert","lines":["5"]},{"start":{"row":41,"column":33},"end":{"row":41,"column":35},"action":"remove","lines":["nk"]},{"start":{"row":41,"column":29},"end":{"row":41,"column":33},"action":"remove","lines":[" bla"]},{"start":{"row":41,"column":21},"end":{"row":41,"column":29},"action":"remove","lines":["can't be"]},{"start":{"row":41,"column":21},"end":{"row":41,"column":100},"action":"insert","lines":["This Room, This Day and This Time have been reserve. So u can't add this Course"]},{"start":{"row":41,"column":21},"end":{"row":41,"column":100},"action":"remove","lines":["This Room, This Day and This Time have been reserve. So u can't add this Course"]},{"start":{"row":41,"column":21},"end":{"row":41,"column":48},"action":"insert","lines":["This Time have been reserve"]},{"start":{"row":41,"column":21},"end":{"row":41,"column":48},"action":"remove","lines":["This Time have been reserve"]},{"start":{"row":41,"column":21},"end":{"row":41,"column":44},"action":"insert","lines":["u can't add this Course"]},{"start":{"row":7,"column":44},"end":{"row":7,"column":45},"action":"remove","lines":["'"]},{"start":{"row":8,"column":44},"end":{"row":8,"column":45},"action":"remove","lines":["'"]},{"start":{"row":8,"column":32},"end":{"row":8,"column":33},"action":"remove","lines":["'"]},{"start":{"row":7,"column":32},"end":{"row":7,"column":33},"action":"remove","lines":["'"]},{"start":{"row":6,"column":32},"end":{"row":6,"column":33},"action":"remove","lines":["'"]},{"start":{"row":6,"column":42},"end":{"row":6,"column":43},"action":"remove","lines":["'"]},{"start":{"row":5,"column":44},"end":{"row":5,"column":46},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":22,"column":23},"end":{"row":22,"column":24},"action":"insert","lines":["r"]}]}],[{"group":"doc","deltas":[{"start":{"row":22,"column":24},"end":{"row":22,"column":25},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":22,"column":24},"end":{"row":22,"column":25},"action":"remove","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":22,"column":23},"end":{"row":22,"column":24},"action":"remove","lines":["r"]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":22,"column":23},"end":{"row":22,"column":23},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1429450227000}