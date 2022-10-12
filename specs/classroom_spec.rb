require_relative 'spec_helper'

describe Classroom do 
    it "takes one parameter and returns a Classroom object" do
        @class = Classroom.new("Maths")
        @class.should be_an_instance_of Classroom
    end
end