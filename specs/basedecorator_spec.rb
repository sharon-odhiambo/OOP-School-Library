require_relative 'spec_helper'
require 'pry'

describe BaseDecorator do 
    it "takes one parameter and returns a BaseDecorator object" do
        @nameable = "Sharon" 
        @basedecorator = BaseDecorator.new(@nameable) 
        @basedecorator.should be_an_instance_of BaseDecorator
    end

    it "returns the correct name" do 
        correct = BaseDecorator.new("Sharon")
        changedname = correct.correct_name
        expect(changedname).to eq "Sharon" 
     end
end