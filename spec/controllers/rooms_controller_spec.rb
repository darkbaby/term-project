require 'rails_helper'
require 'spec_helper'

describe RoomsController do

    describe "#show_all" do
        it "is all room" do
            get :show_room
            response.should render_template 'show_room'
        end
    end

    describe '#add_room' do
        it 'should add a new room' do
            my_room = {:id=>'100', :name=>"ENGR322" ,:building=>"ENGR" ,:tools=>"YOYOYO" ,:capacity=>2000}
            #RoomsController.stub(:add_room).and_return(my_room)
            post :add_room, my_room
            flash[:notice].should_not be_nil
        end
    end
   
end