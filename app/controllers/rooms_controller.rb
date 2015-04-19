class RoomsController < ApplicationController
  def index
  end
  
  def about
  end
  
  def edit_roomform
    @rec = Room.find_by_id(params[:id])
    @id = @rec.id
    @name = @rec.name
    @building = @rec.building
    @tools = @rec.tools
    @capacity = @rec.capacity
    @temprec = Room.new
  end
  
  def edit_room
    @temprec = Room.new(:name => params[:room_name], :building => params[:building] , :tools => params[:tools] , :capacity => params[:capacity])
    if(@temprec.valid?)
      @rec = Room.find_by_id(params[:id])
      @rec.name = params[:room_name]
      @rec.building = params[:building]
      @rec.tools = params[:tools]
      @rec.capacity = params[:capacity]
      @rec.save
      flash[:notice] = "Successfully edit."
      redirect_to show_room_path
    else
      @rec = Room.find_by_id(params[:id])
      @id = @rec.id
      @name = @rec.name
      @building = @rec.building
      @tools = @rec.tools
      @capacity = @rec.capacity
      render edit_roomform_path
    end
  end
  
  def add_roomform
    @rec = Room.new
  end
  
  def add_room
    name = params[:room_name]
    building = params[:building]
    tools = params[:tools]
    capacity = params[:capacity]
    @rec = Room.new(:name => name, :building => building , :tools => tools , :capacity => capacity)
    if(@rec.valid?)
      @rec.save
      flash[:notice] = "Room #{@rec.name} was successfully created."
      redirect_to rooms_index_path
    else
      render add_roomform_path
    end
  end
  
  def show_room
    @room = Room.find(:all)
  end
  
  def show_course
    @course = Course.find(:all)
  end
  
  def add_courseform
    @rec = Course.new
  end
  
  def detail_room
    @recroom = Room.find_by_name(params[:name])
    @reccourse = Course.find_all_by_rname(@recroom.name)
  end
  
  def add_course
    cname = params[:course]
    rname = params[:room_name]
    day = params[:day]
    time = params[:time]
    @reccheck = Course.where('rname = ? AND day = ? AND time = ?', rname, day,time)
    @rec = Course.new
    if(@reccheck.empty?)
      @rec = Course.new(:cname => cname, :rname => rname , :day => day , :time => time)
      if(@rec.valid?)
        @rec.save
        flash[:notice] = "Course #{@rec.cname} was successfully add to #{@rec.rname}."
        redirect_to rooms_index_path
      else
        render add_courseform_path
      end
    else
      flash[:notice] = "This Room, This Day and This Time have been reserve. So u can't add this Course"
      render add_courseform_path
    end
  end
  
  def destroy
    if(params[:name] != nil)
      @rec = Room.find_by_name(params[:name])
      @rec.destroy
      flash[:notice] = "Room '#{@rec.name}' deleted."
      redirect_to show_room_path
    else
      @rec = Course.find(params[:id])
      @rec.destroy
      flash[:notice] = "Course '#{@rec.cname}' deleted."
      redirect_to show_course_path
    end
  end
end