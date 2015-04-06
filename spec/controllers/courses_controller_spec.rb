require 'rails_helper'
require 'spec_helper'

describe RoomsController do
    describe 'show_course' do
        it "is all course" do
            get :show_course
            response.should render_template 'show_course'
        end
    end

end