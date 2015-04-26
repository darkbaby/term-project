Given /the following course exist/ do |course_table|
  course_table.hashes.each do |name|
    Course.create(name)
  end
  
end