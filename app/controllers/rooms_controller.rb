class RoomsController < ApplicationController
  def index
  end
  
  def about
  end
  
  def edit_roomform
    rec = Room.find_by_id(params[:id])
    @id = rec.id
    @name = rec.name
    @building = rec.building
    @tools = rec.tools
    @capacity = rec.capacity
  end
  
  def edit_room
    rec = Room.find_by_id(params[:id])
    rec.name = params[:room_name]
    rec.building = params[:building]
    rec.tools = params[:tools]
    rec.capacity = params[:capacity]
    rec.save
    redirect_to show_room_path
  end
  
  def add_roomform
  end
  
  def add_room
    name = params[:room_name]
    building = params[:building]
    tools = params[:tools]
    capacity = params[:capacity]
    rec = Room.new(:name => name, :building => building , :tools => tools , :capacity => capacity)
    rec.save
    flash[:notice] = "Room #{rec.name} was successfully created."
    redirect_to rooms_index_path
  end
  
  def show_room
    @room = Room.find(:all)
  end
  
  def add_courseform
  end
  
  def add_course
  end
  
  def delete
    c = params[:name]
    rec = Room.find_by_name(c)
    rec.destroy
    flash[:notice] = "Room '#{rec.name}' deleted."
    redirect_to show_room_path
  end
  
end