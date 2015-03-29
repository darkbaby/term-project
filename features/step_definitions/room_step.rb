Given /the following room exist/ do |room_table|
  room_table.hashes.each do |name|
    Room.create(name)
  end
  
end


