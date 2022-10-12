require_relative 'spec_helper'

describe Teacher do 
    it "takes three parameters and returns a Teacher object" do
        @teacher = Teacher.new(34, "Arya", "Chemistry")
        @teacher.should be_an_instance_of Teacher
    end
end