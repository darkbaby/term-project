class RoomsController < ApplicationController
  
  def firstform
    session[:page]="home"
    if(session[:cur] == "user")
    elsif(params[:ses] == "user")
      session[:cur] = "user"
    elsif(session[:cur] == "admin")
    elsif(params[:username] == "admin" && params[:password] == "admin")
      session[:cur] = "admin"
    else
      flash[:login] = "Wrong username or password"
      redirect_to root_path
    end
  end
  
  def index
    if(params[:state] == "annoy")
      session[:cur] = "annoy"
    elsif(session[:cur]=="admin")
      redirect_to firstform_path
    end
  end
  
  def about
    session[:page]="about"
  end
  
  def search_form
    session[:page]="search"
  end
  
  def search
    session[:page]="search"
    if(params[:room_name] == "")
      flash[:notice2] = "Search is empty"
      redirect_to search_form_path
    else
      @room_name = params[:room_name]
      @room = Room.where("name LIKE :name1",{:name1 => "%#{@room_name}%"})
      flash[:notice2] = "Search is successfully"
    end
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
    @rec = Room.find_by_id(params[:id])
    @temprec = Room.new(:name => params[:room_name], :building => params[:building] , :tools => params[:tools] , :capacity => params[:capacity])
    if(@temprec.valid? || @rec.name == params[:room_name])
      #@rec = Room.find_by_id(params[:id])
      @rec.name = params[:room_name]
      @rec.building = params[:building]
      @rec.tools = params[:tools]
      @rec.capacity = params[:capacity]
      @rec.save
      flash[:notice] = "Successfully edit."
      redirect_to show_room_path
    else
      #@rec = Room.find_by_id(params[:id])
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
    session[:page]="add_room"
  end
  
  def add_room
    session[:page]="add_room"
    name = params[:room_name]
    building = params[:building]
    tools = params[:tools]
    capacity = params[:capacity]
    @rec = Room.new(:name => name, :building => building , :tools => tools , :capacity => capacity)
    if(@rec.valid?)
      @rec.save
      flash[:notice] = "Room #{@rec.name} was successfully created."
      redirect_to firstform_path
    else
      render add_roomform_path
    end
  end
  
  def show_room
    session[:page]="show_room"
    @room = Room.find(:all)
  end
  
  def show_course
    @course = Course.find(:all)
    session[:page]="show_course"
  end
  
  def add_courseform
    @rec = Course.new
    session[:page]="add_course"
  end
  
  def detail_room
    @recroom = Room.find_by_name(params[:name])
    @reccourse = Course.find_all_by_rname(@recroom.name,:order => "cname,day,time")
    @total = @reccourse.count
    flash[:check] = @reccourse.count
  end
  
  def add_course
    cname = params[:course]
    rname = params[:room_name]
    day = params[:day]
    time = params[:time]
    if(time == "09.30-12.30" || time == "09.30-11.00" || time == "11.00-12.30")
      @reccheck = Course.where('rname = ? AND day = ? AND time = ?', rname, day,"09.30-12.30")
      if(@reccheck.count > 0)
        
      else
        @reccheck = Course.where('rname = ? AND day = ? AND time = ?', rname, day,"09.30-11.00")
        if(@reccheck.count > 0)
        
        else
          @reccheck = Course.where('rname = ? AND day = ? AND time = ?', rname, day,"11.00-12.30")
          if(@reccheck.count > 0)
          
          end
        end
      end
    elsif(time == "13.30-16.30" || time == "13.30-15.00" || time == "15.00-16.30")
      @reccheck = Course.where('rname = ? AND day = ? AND time = ?', rname, day,"13.30-16.30")
      if(@reccheck.count > 0)
        
      else
        @reccheck = Course.where('rname = ? AND day = ? AND time = ?', rname, day,"13.30-15.00")
        if(@reccheck.count > 0)
        
        else
          @reccheck = Course.where('rname = ? AND day = ? AND time = ?', rname, day,"15.00-16.30")
          if(@reccheck.count > 0)
          
          end
        end
      end
    else
      @reccheck = Course.where('rname = ? AND day = ? AND time = ?', rname, day,time)
    end
    @rec = Course.new
    if(@reccheck.empty?)
      @rec = Course.new(:cname => cname, :rname => rname , :day => day , :time => time)
      if(@rec.valid?)
        @rec.save
        flash[:notice] = "Course #{@rec.cname} was successfully add to #{@rec.rname}."
        redirect_to firstform_path
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