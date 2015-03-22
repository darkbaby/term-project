Given /the following rooms exist/ do |rooms_table|
  rooms_table.hashes.each do |name|
    Rooms.create(name)
  end
  
end