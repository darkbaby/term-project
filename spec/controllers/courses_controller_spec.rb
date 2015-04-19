require 'rails_helper'
require 'spec_helper'

describe RoomsController do
    
    describe 'show_course' do
        it "is all course" do
            get :show_course
            response.should render_template 'show_course'
        end
    end

    describe '#add_course' do
        it 'should render add course form page' do
            get :add_courseform
            response.should render_template 'add_courseform'
        end
        it 'should add a new course' do
            post :add_course, {:course=>"cn320" ,:room_name=>"ENGR316" ,:day=>"Monday" ,:time=>"13.30-15.00"}
            flash[:notice].should_not be_nil
        end
        it 'should dont add a new course' do
            post :add_course, {:course=>"" ,:room_name=>"ENGR316" ,:day=>"Monday" ,:time=>"13.30-15.00"}
            response.should render_template 'add_courseform'
        end
    end

    describe '#destroy' do
        before(:each) do
            @dump = Course.new(:cname=>"CN322" ,:rname=>"ENGR322" ,:day=>"Sunday" ,:time=>"8.00-9.30")
            @dump.save
        end
        it "deletes the course" do 
            post :destroy, {:id => @dump.id}
            flash[:notice].should_not be_nil
        end 
    end
    
end