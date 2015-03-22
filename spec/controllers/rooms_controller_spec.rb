require 'rails_helper'
require 'spec_helper'

describe RoomsController do

    describe "#show_all" do
        it "is all room" do
            get :show_room
            response.should render_template 'show_room'
        end
    end

end