class RoomsController < ApplicationController
  def index
  end
  
  def about
  end
  
  def add_roomform
  end
  
  def add_room
    name = params[:room_name]
    building = params[:building]
    tools = params[:tools]
    capacity = params[:capacity]
    rec = Rooms.new(:name => name, :building => building , :tools => tools , :capacity => capacity)
    rec.save
    flash[:notice] = "Room #{rec.name} was successfully created."
    redirect_to rooms_index_path
  end
  
  def show_room
    @room = Rooms.find(:all)
  end
  
  def add_courseform
  end
  
  def add_course
  end
  
  def destroy
    rec = Rooms.find(params[:id])
    rec.destroy
    flash[:notice] = "Room '#{rec.name}' deleted."
    redirect_to show_room_path
  end
  
end