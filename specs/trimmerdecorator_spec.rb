require_relative 'spec_helper'

describe TrimmerDecorator do 
    it "takes one parameter and returns a TrimmerDecorator object" do
        @nameable = "Sharon" 
        @trimmerdecorator = TrimmerDecorator.new(@nameable) 
        @trimmerdecorator.should be_an_instance_of TrimmerDecorator
    end

    it "takes a string and returns the capitalized version" do
        nameable = "Sharon is amazing" 
        trimmerdecorator = TrimmerDecorator.new(nameable) 
        trimm = trimmerdecorator.correct_name
        expect(trimm).to eq "Sharon is "
    end
end