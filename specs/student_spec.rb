require_relative 'spec_helper'

describe Student do 
    it "takes three parameters and returns a Student object" do
        @student = Student.new(22, "Nick", true)
        @student.should be_an_instance_of Student
    end

    it "returns Play Hooky element" do 
        student1 = Student.new(10, "Sharon", true)
        play = student1.play_hooky
        expect(play).to eq "¯\(ツ)/¯" 
     end

     it "returns true or false for whether student can use services" do 
        student2 = Student.new(19, "Sharon", true)
        use = student2.can_use_services?
        expect(use).to eq true 
     end
end