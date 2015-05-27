require 'rails_helper'
require 'spec_helper'

describe RoomsController do
    
    describe '#index' do
        it 'should redirect home page but go on index' do
            session[:cur] = "admin"
            get :index
            response.should redirect_to(firstform_path)
        end
        it 'should render index when u are annoymous' do
            get :index, {:state => "annoy"}
            response.should render_template 'index'
        end
        it 'should cannot login if wrong username or password' do
            get :firstform, {:username => "admin" , :password => "yoyo"}
            response.should redirect_to(root_path)
        end
    end

    describe '#add_room' do
        it 'should render add room form page' do
            get :add_roomform
            response.should render_template 'add_roomform'
        end
        it 'should add a new room' do
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
            post :edit_roomform, {:id => @rec.id}
            response.should render_template 'edit_roomform'
        end
        it 'should edit a room' do
            post :edit_room, {:id=>@rec.id, :room_name=>"ENGR100" ,:building=>"ENGR" ,:tools=>"YOYOYO" ,:capacity=>100}
            response.should redirect_to(show_room_path)
        end
        it 'should not edit a room' do
            post :edit_room, {:id=>@rec.id, :room_name=>"" ,:building=>"ENGR" ,:tools=>"YOYOYO" ,:capacity=>100}
            response.should render_template 'edit_roomform'
        end
    end
    
    describe '#detail_room' do
        before(:each) do
            @rec = Room.new(:name=>"ENGR322" ,:building=>"ENGR" ,:tools=>"YOYOYO" ,:capacity=>2000)
            @rec.save
            @rec2 = Course.new(:cname=>"CN322",:rname=>"ENGR322",:day=>"Monday",:time=>"8.00-9.30")
            @rec2.save
        end
        it 'should render detail room' do
            post :detail_room, {:name => @rec.name}
            response.should render_template 'detail_room'
        end
        it 'course in detail room should equal' do
            post :detail_room, {:name => @rec.name}
            dump = Course.find_all_by_rname(@rec.name).count
            expect(dump).to be == flash[:check]
        end    
    end
    
    describe '#search_room' do
        before(:each) do
            @rec = Room.new(:name=>"ENGR322" ,:building=>"ENGR" ,:tools=>"YOYOYO" ,:capacity=>2000)
            @rec.save
        end
        it 'should search room' do
            post :search, {:room_name => "ENGR"}
            response.should render_template 'search'
            flash[:notice2].should_not be_nil
        end
        it 'should not be empty' do
            post :search, {:room_name => ""}
            response.should redirect_to(search_form_path)
            flash[:notice2].should_not be_nil
        end
    end
    
            
end