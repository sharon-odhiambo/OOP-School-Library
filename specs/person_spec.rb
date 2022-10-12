require_relative 'spec_helper'

describe Person do 
            it "takes two parameters and returns a Person object" do
                @person = Person.new("Age", "Name")
                @person.should be_an_instance_of Person
            end
           
           it "returns the name" do 
              name = Person.new(10, "Sharon")
              newname = name.correct_name
              expect(newname).to eq "Sharon" 
           end
end