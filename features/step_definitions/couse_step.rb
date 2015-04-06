Given /the following course exist/ do |couse_table|
  couse_table.hashes.each do |name|
    Course.create(name)
  end
  
end