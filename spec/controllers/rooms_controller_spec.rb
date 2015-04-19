require 'rails_helper'
require 'spec_helper'

describe RoomsController do

    describe '#add_room' do
        it 'should render add room form page' do
            get :add_roomform
            response.should render_template 'add_roomform'
        end
        it 'should add a new room' do
            #RoomsController.stub(:add_room).and_return(my_room)
            post :add_room, {:id=>'100', :room_name=>"ENGR322" ,:building=>"ENGR" ,:tools=>"YOYOYO" ,:capacity=>2000}
            flash[:notice].should_not be_nil
        end
        it 'should dont add a new room' do
            post :add_room, {:id=>'100', :room_name=>"" ,:building=>"ENGR" ,:tools=>"YOYOYO" ,:capacity=>10.2}
            response.should render_template 'add_roomform'
        end
    end
    
    describe '#show_room' do
        it "is all room" do
            get :show_room
            response.should render_template 'show_room'
        end
    end
    
    describe '#destroy' do
        it "deletes the room" do 
            rec = Room.new(:name=>"ENGR322" ,:building=>"ENGR" ,:tools=>"YOYOYO" ,:capacity=>2000)
            rec.save
            post :destroy, {:name => "ENGR322"}
            flash[:notice].should_not be_nil
        end 
    end
    
    describe '#edit_room' do
        before(:each) do
            @rec = Room.new(:name=>"ENGR322" ,:building=>"ENGR" ,:tools=>"YOYOYO" ,:capacity=>2000)
            @rec.save
        end
        it 'should render edit room form' do
            #RoomsController.stub(:edit_room).and_return(my_room)
            post :edit_roomform, {:id => @rec.id}
            response.should render_template 'edit_roomform'
        end
        it 'should edit a room' do
            post :edit_room, {:id=>@rec.id, :room_name=>"ENGR100" ,:building=>"ENGR" ,:tools=>"YOYOYO" ,:capacity=>100}
            response.should redirect_to(show_room_path)
        end
    end
    
    
end